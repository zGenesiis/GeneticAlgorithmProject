Animal tanimal;

void setup(){
  fullScreen();
  int colorD[] = {120, 120, 120};
  tanimal = new Animal(new PVector(width/2,height), colorD);
}

void draw(){
  tanimal.show();
}
