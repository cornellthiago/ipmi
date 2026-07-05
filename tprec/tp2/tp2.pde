//thiago carrasco cornell comi 2 juego: darks souls
//variables
int pantalla = 0; 

PImage img1, img2, img3, img4, img5, img6;
PFont fuente;

//variables para las pantallas
int tiempodepantalla = 6000; //tiempo que duran las pantalla
int cambiodepantalla = 0;   //cambio de la pantalla

// variables de la animacion
float movimiento = 480;    
float opacidad = 0; 

//imagenes
void setup() {
  size(640, 480);
      
  //imagenes
  img1 = loadImage("imagen1.jpg");
  img2 = loadImage("imagen2.jpg");
  img3 = loadImage("imagen3.jpg");
  img4 = loadImage("imagen4.jpg");
  img5 = loadImage("imagen5.jpg");
  img6 = loadImage("imagen6.jpg");
  
  //tipografia
  fuente = loadFont("BookmanOldStyle-Italic-48.vlw");
  textFont(fuente);
}

//pantallas
void draw() {
  background(0);
  
  //condicionales
  if (pantalla == 0) {
    Inicio(); 
  } 
  else if (pantalla == 1) {
    Pantalla2(); 
    
    if (millis() - cambiodepantalla > tiempodepantalla) {
      pantalla = 2; 
      cambiodepantalla = millis();
      opacidad = 0;
    }
  } 
  else if (pantalla == 2) {
    Pantalla3();
    
    if (millis() - cambiodepantalla > tiempodepantalla) {
      pantalla = 3; 
      cambiodepantalla = millis();
      opacidad = 0; 
    }
  } 
  else if (pantalla == 3) {
    Pantalla4();
    
    if (millis() - cambiodepantalla > tiempodepantalla) {
      pantalla = 4; 
      cambiodepantalla = millis();
      movimiento = 480;
    }
  } 
  else if (pantalla == 4) {
    Pantalla5();
  } 
  else if (pantalla == 5) {
    Pantalla6();
    
    if (millis() - cambiodepantalla > tiempodepantalla) {
      pantalla = 0; 
      cambiodepantalla = millis();
      opacidad = 0;
    }
  }
}

//funciones de las pantallas
void Inicio() {
  image(img1, 0, 0, 640, 480); 
  
  fill(255);
  textSize(32);
  text("Inicia tu partida", 40, 140);
  
  // Boton iniciar
  fill(85, 30, 30);
  rect(57, 167, 200, 50);
  fill(255);
  textSize(20);
  text("INICIAR", 120, 200);
}

void Pantalla2() {
  image(img2, 0, 0, 640, 480);
  
  fill(255, 255, 255, opacidad); 
  textSize(24);
  text("En el momento de salida del primer juego de la saga Demons souls, lo normal era hacer juegos lineales o con las suficientesa ayudas para que el jugador entendiera lo que tenia que hacer, los souls llegaron y cambiaron la forma de jugar, pocas pistas, una explicacion indirecta de su historia dentro del juego y una dificultad fija para todas las partidas que crees", 250, 50, 350, 600);
  opacidad = opacidad + 4;
}

void Pantalla3() {
  image(img3, 0, 0, 640, 480);
  
  fill(220, 283, 225, opacidad); 
  textSize(24);
  text("A diferecia de otros juegos RPG esta saga no es conocida por estar llena de cinematicas o dialogos explicativos, su historia esta rota y dispersada en cada parte del mundo, objetos o NPCs, cada objeto te explica algo del lores al igual que las diferenes charlas con diferentes NPCs, pero sos vos el que tiene que ir armando ese rompecabezas", 350, 50, 290, 600);
  
  opacidad = opacidad + 4; 
}

void Pantalla4() {
  image(img4, 0, 0, 640, 480);
  
  fill(255);
  textSize(22); 
  
  text("Su diseño de niveles es realmente una obra maestra, el mundo esta toalmente conectado sin la necesidad de pantallas de carga", 30, movimiento, 250, 400);
  text("Podes estar explorando sufriendo las zonas que al principio son dificiles y te encunetras con un atajo que te lleva hacia el primer punto de aparecimiento sin tenes que hacer todo ese camino tedioso devuelta", 360, movimiento, 250, 400);
  
  movimiento = movimiento - 1.2; 
}

void Pantalla5() {
  image(img5, 0, 0, 640, 480);
  
  fill(255);
  textSize(24);
  text("Para cerrar, teniendo cuenta lo que genero la saga and el impacto que cuaso en el publico, los souls demostraron que los jugadores no querian todo facil. Devolvieron al gaming el valor del esfuerzo y unieron a una comunidad global a traves de la superacion y el sufrimiento compartido. Cambiaron la industria para siempre, enseñandonos que la muerte no es el final, sino el inicio del viaje. Gracias por su atencion ¡Price the sun!", 46, 15, 350, 600 );
  
  // Boton de reinicio
  fill(173, 113, 17);
  rect(430, 387, 200, 50);
  fill(0);
  textSize(20);
  text("Me rindo", 486, 416);
}

void Pantalla6() {
  tint(255, opacidad); 
  image(img6, 0, 0, 640, 480);
  noTint(); 
  
  if (opacidad < 255) {
    opacidad = opacidad + 4; 
  }
}

//botones
void mouseClicked() {
  // boton de inicio
  if (pantalla == 0 && (mouseX > 57 && mouseX < 257) && (mouseY > 167 && mouseY < 217)) {
    pantalla = 1;
    cambiodepantalla = millis(); 
  }
  
  // boton de rendirse
  if (pantalla == 4 && (mouseX > 430 && mouseX < 630) && (mouseY > 387 && mouseY < 437)) {
    pantalla = 5;              
    cambiodepantalla = millis(); 
    opacidad = 0;             
  }
}
