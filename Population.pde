public class Population {
  Animal[] animals;
  int size;
  
  public Population(int sizey){
    size = sizey;
    animals = new Animal[size];
    
    for (int i = 0;i<size;i++){
        DNA dna = new DNA();
        PVector position = new PVector(width/2, height);
        animals[i] = new Animal(position, dna);
    }
  }
  
  void show(){
    for (Animal animal: animals){
      animal.show();
    }
  }
  
  void update(){
    for (Animal animal: animals){
      animal.update();
      animal.applyForce(new PVector(random(-.1, .1), random(-.1, .1)));
    }
  }
  
}
