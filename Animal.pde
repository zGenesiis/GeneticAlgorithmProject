public class Animal {
  PVector pos;
  DNA Dna;
  PVector vel = new PVector(0,0);
  PVector acc = new PVector(0,0);
  boolean winner = false;
  int time = lifespan;
  boolean dead = false;

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
    fill(#020122, 120);
    rect(0, 0, 25, 10);
    pop();
  }
  
  void checkCollision(){
    // collision on walls
    
    if (pos.x < 0){
      dead = true;
    }else if (pos.x > width){
      dead = true;
    }else if (pos.y < 0){
      dead = true;
    }else if (pos.y > height){
      dead = true;  
    }
    
    // collision on obstacle
    if (pos.x < 150+obstacleWidth && pos.x > 150){
      if (pos.y > height/2 && pos.y < height/2+20){
        dead = true;
      }
    }
  }
  
  void update(){
    if (pos.dist(foodPos) > 25 && dead == false){
      vel.add(acc);
      pos.add(vel);
      acc.mult(0);
    }else if (pos.dist(foodPos) < 25 && winner == false){
      winner = true;
      time = counter;
    }
  }
  
  float calcFitness(){
    float d = pos.dist(foodPos);
    float p = 0f;
    
    if (dead){
      p = -0.2f;
    } 
    
    if (winner){
      d = 20f;
    }
    
    return (1/d) + (1/time) + p;
  }  
}
