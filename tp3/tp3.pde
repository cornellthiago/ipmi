//thiago carasco cornell comision 2
//https://youtu.be/EImenLbBaOY
int angulo = 18;
int num = 70; 
PImage img;

float rotacion = 0; 
boolean cambiodecolor = false; 
boolean sigueelmouse = false; 
boolean reiniciado = false; 

float centroX = 600;
float centroY = 200;
float velocidaddegiro = 2; 

void setup() {
  size(800, 400);
  img = loadImage("33.jpeg"); 
  noStroke(); 
}

void draw() {
  color colordelfondo = color(36, 181, 116);
  color colordelciruclo = color(102, 51, 153);

  //Condicionales if else
  if (cambiodecolor == true) {
    colordelfondo = color(102, 51, 153);           // El fondo cambia de color a violeta
    colordelciruclo = color(36, 181, 116);   // Los circulos cambian a color verde 
  }

  background(colordelfondo); 

 //funciones matematicas dist
  float distanciadelmouse = dist(mouseX, mouseY, centroX, centroY);

  // Si muevo el mouse se desactiva el estado de reiniciado
  if (mouseX != pmouseX || mouseY != pmouseY) {
    reiniciado = false;
  }

  //el centro sigue el mouse
  if (mouseX > 400 && focused == true && reiniciado == false) {
    sigueelmouse = true; 
  } else {
    sigueelmouse = false; 
  }

  if (sigueelmouse == true) {
    centroX = mouseX; 
    centroY = mouseY;
    
    //Funciones matematicas map modifica la velocidad de giro segun la distancia al mouse
    velocidaddegiro = map(distanciadelmouse, 0, 400, 1, 5);
  }

  //si mantenes apretado el clic gira
  if (mousePressed) {
    rotacion += velocidaddegiro; 
  }

  //función propia con parametros que no retorna valor void
  espiral(centroX, centroY, colordelciruclo);

//imagen
  image(img, 0, 0, 400, 400);  
}

//Funcion para no retornar el valor void
void espiral(float x, float y, color colorCentro) {
  //translate y totate
  pushMatrix();
  translate(x, y); 
  rotate(radians(rotacion));

  //ciclos for anidados
  for (int a = 0; a < 360; a += 45) {
    rotate(radians(a));

    pushMatrix();
    
    float posicion = 1050;
    float diametro = 230;

    //segundo ciclo for
    for (int i = 0; i < num; i++) {
      rotate(radians(angulo));
      
      color bordenegro = color(0);
      color bordeblanco = color(255);
      float movimiento = diametro * 0.04; 

      //bordes blanco y negro fijos
      fill(bordeblanco);
      ellipse(posicion - movimiento, -movimiento, diametro * 1.1, diametro * 1.1);
      
      fill(bordenegro);
      ellipse(posicion + movimiento, movimiento, diametro * 1.1, diametro * 1.1);

      //circulo principal interactivo
      fill(colorCentro);
      ellipse(posicion, 0, diametro, diametro); 
      
      //funcion propia con parametro que retorna un valor float
      posicion = calcularescala(posicion);
      diametro = calcularescala(diametro);
    }
    popMatrix();
  }
  popMatrix();
}

//funcion propia que retorna el valor float
float calcularescala(float valoractual) {
  float factorbase = 0.88;
  float resultado = valoractual * factorbase;
  return resultado; 
}

//evento de teclado para modificación de variables
void keyPressed() {
  //tecla C para invertir los colores
  if (key == 'c' || key == 'C') {
    cambiodecolor = !cambiodecolor; 
  }
  
  //reiniciar el programa para volver las variables a su estado original
  if (key == ' ') { 
    rotacion = 0;     
    cambiodecolor = false;   
    centroX = 600;            
    centroY = 200;            
    sigueelmouse = false; 
    reiniciado = true; //bloquea el movimiento inmediato en el centro
    velocidaddegiro = 2.0; //cambiado por un valor fijo sin usar random()
  }
}
