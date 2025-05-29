
# S12:
Am adaugat un modul verilog pentru generare de semnal PWM pe care o sa il folosim in top module. 
Am adaugat un testbench pentru modulul de PWM si o poza cu waveformul acestei simulari.
Am adaugat si toata partea de ADC IP activation care trebuie pusa pe placa. 
Am adaugat schema hardware mai detaliata si modificata pentru dificultatiile intampinare. 
Am adaugat poza si fisierul SCAD pentru reductia pe care am facuto initial pentru proiect, desi urmeaza sa nu o mai folosim

# Probleme intampinate: 
1.Reductia initial printata nu era suficient de inalta asa ca facea aerul sa fie impins inapoi de unde il tragea ventilatorul. 
2.Ventilatorul nu furnizeaza suficienta presiune pentru a impinge bila si a o tine in aer.

# Rezolvari: 
1.Am facut o reductie mai inalta care sa aibe pierderi minime ale presiunii. 
2.Am procurat un brushless motor, care in general este folosit la drone, care impreuna cu un ESC si o elice printata 3D va inlocui ventilatorul, cu precizarea ca elicea este in lucru si va fi facuta dupa calculele de riguare pentru a ne asigura ca de data aceasta o sa putem furniza suficienta presiune.


# S13:
Am adaugat modulul verilog pentru PID controller si un test bench pentru acesta, desi inca nu merge complet.
Am testat partea de ADC si de PWM impreuna si MERGE!!!
Am inlocuit ventilatorul Arctic P12 MAX cu altul mai mic care poate procura mai multa presiune statica si nu are nevoie de o reductie pentru eficienta. Noul model de ventilator este ARCTIC S4028-15K.


# Probleme intampinate:
1. Am facut o greseala din neatentie si s-a produs un scurt circuit pe placa, iar usb blaster-ul s-a ars, deoarece s-au atins cablul de alimentare pentru ventilator (12 V) si cel de la FPGA pentru senzor (3,3 V)(Cel putin noi asta consideram, nu putem diagnostica 100% probleam deoarece nu avem uneltele necesare). 
2. Am observat ca intervalul de duty al PWM-ului pe care bila ramane in tub este destul de mic (0x50-0x55) asa ca trebuie sa ne gandim la un mod prin care sistemul poate oferi precizie mai ridicata.

# Further improvements:
Urmeaza sa ne focusam tot progresul spre finalizarea modulului PID pentru a finaliza proiectul.
Pe partea de montaj, trebuie sa facem un suport pentru ventilator si unul pentru senzor in capetele opuse a tubului
Incepem sa ne gandim la un mod de comunicare cu montajul pentru a varia inaltimea la care bila leviteaza(targetul PID-ului), poate un senzor wifi cu ajutorul caruia sa putem controla din telefon aceasta inaltime.

