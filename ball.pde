class ball {

  float x_position;
  float y_position;
  float x_speed;
  float y_speed;
  float colors_snake;

  float continue_playing;

  ball(float x_position_before, float y_position_before ) {  
    colors_snake=100;
    x_position=x_position_before;
    y_position=y_position_before;
    x_speed=15;
    y_speed=15;
  }
  
  float restriccion(float x_position_before, float y_position_before, float hueco_0, float hueco_1, float hueco_2, float hueco_3, float hueco_4, float hueco_5) {

    if ((x_position_before>=0&&x_position_before<=40)||(x_position_before>=80&&x_position_before<=120)||(x_position_before>=160&&x_position_before<=200)||(x_position_before>=240&&x_position_before<=280)||(x_position_before>=320&&x_position_before<=360)||(x_position_before>=400&&x_position_before<=440)) {
      continue_playing=1;
    } else {
      if (((y_position_before>=hueco_0&&y_position_before<=hueco_0+40)&&(x_position_before>=40&&x_position_before<=80))||((y_position_before>=hueco_1&&y_position_before<=hueco_1+40)&&(x_position_before>=120&&x_position_before<=160))||((y_position_before>=hueco_2&&y_position_before<=hueco_2+40)&&(x_position_before>=200&&x_position_before<=240))||((y_position_before>=hueco_3&&y_position_before<=hueco_3+40)&&(x_position_before>=280&&x_position_before<=320))||((y_position_before>=hueco_4&&y_position_before<=hueco_4+40)&&(x_position_before>=360&&x_position_before<=400))||((y_position_before>=hueco_5&&y_position_before<=hueco_5+40)&&(x_position_before>=440&&x_position_before<=480))) {
        continue_playing=1;
      } else {
        continue_playing=0;
      }
    } 
    return continue_playing;
  }
  void display() {
    fill(colors_snake);
    rectMode(CENTER);
    ellipse(x_position, y_position, 20, 20) ;
    rectMode(CORNER);
  }

  float avanzar_derecha() {
    return x_position=x_position+x_speed;
  }

  float avanzar_izquierda() {
    return x_position=x_position-x_speed;
  }
  
  float subir() {
    return y_position=y_position+y_speed;
  }
  float bajar() {
    return y_position=y_position-y_speed;
  }
}
