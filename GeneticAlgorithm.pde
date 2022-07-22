Population popul;
int lifespan = 300;
int popSize = 100;
int counter = 0;

void setup(){
  fullScreen();
  popul = new Population(popSize);
}

void draw(){
  background(190);
  if (counter <= lifespan){
    popul.show();
    popul.update();
    counter++;
  }else {
    popul = new Population(popSize);
    counter = 0;
  }
}
