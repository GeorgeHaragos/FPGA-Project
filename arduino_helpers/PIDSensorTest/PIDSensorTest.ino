const int sensorPin = A0;
const int fanPWM = 3;

double setpoint = 1000;

double Kp = 0.05;
double Ki = 0;
double Kd = 0;

double input = 0;
double output = 0;
double lastError = 0;
double integral = 0;

unsigned long lastTime = 0;
double deltaTime = 0.01;

void setup() {
  Serial.begin(9600);
  pinMode(fanPWM, OUTPUT);
}


void loop() {

  int length = analogRead(sensorPin);

  double error = setpoint - input;

  unsigned long now = millis();
  deltaTime = (now - lastTime) / 1000.0;
  lastTime = now;

  integral += error * deltaTime;
  double derivative = (error - lastError) / deltaTime;
  lastError = error;

  output = Kp * error + Ki * integral + Kd * derivative;

  output=constrain(0,255, output);

  analogWrite(fanPWM, (int)output);

  Serial.print("Sensor: "); Serial.print(input);
  Serial.print(" | Error: "); Serial.print(error);
  Serial.print(" | Output (PWM): "); Serial.println(output);


}
