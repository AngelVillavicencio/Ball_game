ball ball_1;
int n=6;
float[] hueco=new float[n];
//Atributos de la pantalla
int size_horizontal=480;
int size_vertical=400;
float x_espacio=40;
float y_espacio=40;
float x_position_before;
float y_position_before;
float status_game;
int level = 1;
float velocidad_obstaculos;
float restart=1;
boolean newLevel = true;
int time_start;
int time_finish;
int time;
int Temporizador=20;
boolean winner = false;

void setup() {
  size(480, 400); 
  noStroke();
  rect(0, 0, size_horizontal-1, size_vertical-1);
  velocidad_obstaculos=0;
  //INICIALIZAR HUECOS
  status_game=1;
  ball_1 = new ball(0, 0);
  create_new_map();
  
}

void create_new_map() {
  for (int h=0; h<6; h++) {
    hueco[h]=random(360);
  }
}


void draw() {
  if(winner==false){
  if (newLevel) {
    print(level);
    print("hi");
    textSize(32);
    background(0);
    fill(255);
    text("Level " + level, 200, 200);
    textSize(14);
    text("Presione ESPACIO para continuar", 150, 250);
    if(level==1){
    
    textSize(32);
    text("!!! ESTÁTICO !!!", 120, 350);
    }
    if(level==2){
    velocidad_obstaculos=1;
    textSize(32);
    text("!!!AHORA CON MOVIMIENTO!!!", 5, 350);

    }
    if(level==3){
   
    textSize(25);
    text("!!!ESTÁTICO PERO CON TIEMPO!!!", 50, 350);
    text("!!!TIENES 20 SEGUNDOS!!!", 100, 400);
    textSize(25);
    text("!!!CORRE!!!", 200, 375);
    }
    if(level==4){
    textSize(25);
    text("!!!  CON MOVIMIENTO Y TIEMPO  !!!", 30, 350);
    text("!!!TIENES 20 SEGUNDOS!!!", 100, 400);
    textSize(25);
    text("!!!CORRE!!!", 180, 375);
    }
    
  } else {
    if (status_game==0) {
      //delay(2000);
      textSize(32);
      background(0, 255, 0);
      text("GAME OVER", 200, 200);
    
    }else{
      funcion_muerte_contorno();  
      print("wow");
      println("X:"+x_position_before);
      println("Y:"+y_position_before);
      background(255);
      fill(0);
      textSize(10);
      text("Level:"+level, 0, 400);
      obstaculos();
      ball_1.display();
      time=millis()/1000;
        if ((ball_1.restriccion( x_position_before, y_position_before, hueco[0], hueco[1], hueco[2], hueco[3], hueco[4], hueco[5]))==0) {
            status_game=0;
            level=0;
        }
        if (((y_position_before>=hueco[5]&&y_position_before<=hueco[5]+40)&&(x_position_before>=440&&x_position_before<=480))) {
            create_new_map();
            status_game=1;
            newLevel = true;
            ball_1= new ball(0, 0);
            level++;
            if(level==2){
              velocidad_obstaculos=1;          
            }else if(level==3){
                velocidad_obstaculos=0;
                time_start=millis()/1000;
            }else if(level==4){
                velocidad_obstaculos=1;
                time_start=millis()/1000;
            }else if(level==5){
                winner=true;
            }
             y_position_before=0;
             x_position_before=0;
             
            println("NIVEL++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++1");
    }
    
      if(level==3){
      time_finish=time-time_start;
      fill(0);
      textSize(9);
      text("Timer:"+(Temporizador-time_finish), 0, 390);
      if(time_finish>=(Temporizador-10)){
        fill(255,0,0);
        textSize(64);
        text((Temporizador-time_finish),200,200);
      }
        if((level==3)&&(time_finish>=Temporizador)){
            status_game=0;
            level=0; 
        }
      }
    if(level==4){
      time_finish=time-time_start;
      fill(0);
      textSize(9);
      text("Timer:"+(Temporizador-time_finish), 0, 390);
      
      if(time_finish>=(Temporizador-10)){
        fill(255,0,0);
        textSize(64);
        text((Temporizador-time_finish),200,200);
      }
        
      
        if((level==4)&&(time_finish>=Temporizador)){
            status_game=0;
            level=0; 
        }
      }
    
  }

  }
  }
  else{
    background(1,49,180);
    textSize(64);
    text("YOU WON!!!!",50,250);
  }
  
}

void keyPressed() {
  if (newLevel == true && keyCode == 32) {
    print("omg");
    print(level);
    newLevel = false;
    if(level==3){
      time_start=millis()/1000;
    }
    if(level==4){
      time_start=millis()/1000;
      velocidad_obstaculos=1;
    }
    
  }
  if (key == CODED) {
    if (keyCode == UP) {
      y_position_before= ball_1.bajar();
    } else if (keyCode == DOWN) {
      y_position_before=  ball_1.subir();
    } else if (keyCode == RIGHT) {
      x_position_before=ball_1.avanzar_derecha();
    } else if (keyCode == LEFT) {
      x_position_before= ball_1.avanzar_izquierda();
    }
  } 
  /*if ((key=='R')||(key =='r')) {
    create_new_map();
    level=0;
    ball_1= new ball(0, 0);    
    status_game=1;
    velocidad_obstaculos=0;
  }*/
}
void obstaculos() {
  //obstáculos
  for (int i=0; i<6; i++) {
    fill(0);
    rect(x_espacio+2*i*x_espacio, 0, 40, 400);
    fill(255);
    rect(x_espacio+2*i*x_espacio, hueco[i]+=velocidad_obstaculos, 40, 40);
    fill(255, 0, 0);
    rect(440, hueco[5], 40, 40);
    

    if (hueco[i]>=360||hueco[i]<0) {

      velocidad_obstaculos*=-1;
    }
  }
}

void funcion_muerte_contorno(){
  if((y_position_before>400)||(y_position_before<0)){
    status_game=0;
  }else if((x_position_before>480)||(x_position_before<0)){
    status_game=0;
  }
}
