public class Animal {
  PVector pos;
  char moveDna[];
  int colorDna[];
  
  public Animal(PVector position, int[] colorDNA){
    pos = position;
    colorDna = colorDNA;
  }
  
  void show(){
    push(); 
    rectMode(CENTER);
    fill(colorDna[0], colorDna[1], colorDna[2], 120);
    rect(pos.x, pos.y, 10, 5);
    pop();
  }
}
