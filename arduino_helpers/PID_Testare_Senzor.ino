// ---------------- PID Structură ----------------
struct PIDController {
  double kp, ki, kd;
  double prev_error;
  double integral;
};

// ---------------- Inițializare PID ----------------
void init_PID(PIDController *pid, double kp, double ki, double kd) {
  pid->kp = kp;
  pid->ki = ki;
  pid->kd = kd;
  pid->prev_error = 0.0;
  pid->integral = 0.0;
}

// ---------------- Update PID și mapare la PWM ----------------
double update_PID(PIDController *pid, double setpoint, double measured_value, double dt) {
  double error = setpoint - measured_value;
  pid->integral += error * dt;
  double derivative = (error - pid->prev_error) / dt;
  double output = (pid->kp * error) + (pid->ki * pid->integral) + (pid->kd * derivative);
  pid->prev_error = error;

  // Limităm output-ul PID și îl mapăm la 0–255 pentru PWM
  double minOutput = -100;
  double maxOutput = 100;
  output = constrain(output, minOutput, maxOutput);

  double pwm = (output - minOutput) * (255.0 / (maxOutput - minOutput)); // map la 0–255
  return pwm;
}

// ---------------- Configurație pinii ----------------
#define PWM_PIN 5      // PWM fan
#define SENSOR_PIN A3  // senzor distanță analog

PIDController pid;
unsigned long lastTime = 0;

void setup() {
  pinMode(PWM_PIN, OUTPUT);
  analogWrite(PWM_PIN, 0);
  init_PID(&pid, 3, 0, 0.5); // valori PID – ajustabile
  Serial.begin(9600);
}

void loop() {
  // Citire senzor
  int raw = analogRead(SENSOR_PIN);
  double voltage = raw * (5.0 / 1023.0); // convertem în voltaj

  // Estimare distanță în cm (approx, valabil între ~4 și ~30 cm)
  double distance_cm = 12.0 / (voltage - 0.1); // formula de calibrare (datasheet)
  distance_cm= constrain(distance_cm, 4, 30);

  // Poziția dorită (ex: 10 cm deasupra senzorului)
  double setpoint = 10.0;

  // Calcul timp pentru PID
  unsigned long now = millis();
  double dt = (now - lastTime) / 1000.0;
  lastTime = now;

  // Actualizare PID → output PWM
  double pwm = update_PID(&pid, setpoint, distance_cm, dt);
  pwm = constrain(pwm, 0, 255);

  // Aplicare PWM la ventilator
  analogWrite(PWM_PIN, (int)pwm);

  // Debug serial
  Serial.print("Dist: ");
  Serial.print(distance_cm);
  Serial.print(" cm | PWM: ");
  Serial.println((int)pwm);

  delay(50);
}
