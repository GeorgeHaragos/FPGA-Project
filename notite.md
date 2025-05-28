===
Vom avea branchul dev in care incarcam si testam inainte sa urcam pe main.


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

===