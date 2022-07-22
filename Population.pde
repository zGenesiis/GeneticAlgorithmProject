public class Population {
  Animal[] animals;
  int size;
  float[] fitness;
  Animal[] matingPool;
  
  public Population(int sizey){
    size = sizey;
    animals = new Animal[size];
    fitness = new float[size];
    
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
      animal.Dna.genes[counter].setMag(.3);
      animal.applyForce(animal.Dna.genes[counter]);
    }
  }
  
  void newGeneration(){
    int matingSize = 0;
    
    for (int i = 0;i<size;i++){
      fitness[i] = animals[i].calcFitness();
    }
    
    for (int j = 0;j<size;j++){
      for (int i = 0;i<fitness[j]*100;i++){
        matingSize++;
      }
    }
    
    matingPool = new Animal[matingSize];
    
    for (int j = 0;j<size;j++){
      for (int i = 0;i<floor(fitness[j]*100);i++){
        matingPool[i] = animals[j];
      }
    }
    
    for (Animal mating: matingPool){
      println(mating);
    }
  }
  
}
