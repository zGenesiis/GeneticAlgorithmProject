public class Animal {
  PVector pos;
  DNA Dna;
  PVector vel = new PVector(0,0);
  PVector acc = new PVector(0,0);

  public Animal(PVector position, DNA dna){
    pos = position;
    Dna = dna;
  }
  
  void applyForce(PVector Force){
    acc.add(Force);
  }
  
  void show(){
    push(); 
    translate(pos.x, pos.y);
    rectMode(CENTER);
    rotate(vel.heading());
    fill(120, 120);
    rect(0, 0, 25, 10);
    pop();
  }
  
  void update(){
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
  }
  
}
