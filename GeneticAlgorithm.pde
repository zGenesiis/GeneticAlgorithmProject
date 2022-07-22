Population popul;
int lifespan = 300;
int popSize = 100;
int counter = 0;
PVector foodPos;
boolean tFood = false;

void setup(){
  fullScreen();
  popul = new Population(popSize);
}

void draw(){
  background(#5DD39E);
  if (tFood == true){
    if (counter < lifespan){
      popul.show();
      popul.update();
      push();
      noStroke();
      fill(#14213D);
      circle(foodPos.x, foodPos.y, 30);
      pop();
      counter++;
    }else {
      popul.newGeneration();
      //popul = new Population(popSize);
      counter = 0;
    }
  }
}

void mousePressed(){
  if (tFood == false){
    foodPos = new PVector(mouseX, mouseY);
    tFood = true;
  }
}
