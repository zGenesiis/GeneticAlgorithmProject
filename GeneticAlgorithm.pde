Population popul;
int lifespan = 350;
int popSize = 5000;
int counter = 0;
PVector foodPos;
boolean tFood = false;
int generation = 1;
int obstacleWidth;
int nDrawings = 100;

void setup(){
  fullScreen();
  //size(720, 1020);
  popul = new Population(popSize);
  obstacleWidth = width - 300;
}

void draw(){
  background(#5DD39E);
  if (tFood == true){
    String genText = String.valueOf(generation);
    push();
    rectMode(CORNER);
    fill(0);
    textSize(64);
    text("Geração: "+genText, 0, 50);
    pop();
    
    push();
    // obstaculo
    rectMode(CORNER);
    noStroke();
    fill(#F9B5AC);
    rect(150, height/2, obstacleWidth, 20);           
    pop();
    
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
      popul.animals = popul.newGeneration();
      generation++;
      //popul = new Population(popSize);
      counter = 0;
    }
  }else {
    push();
    textAlign(CENTER);
    fill(0);
    textSize(64);
    text("Clique para iniciar", width/2, height/2);
    pop();
  }
}

void mousePressed(){
  if (tFood == false){
    foodPos = new PVector(mouseX, mouseY);
    tFood = true;
  }
}
