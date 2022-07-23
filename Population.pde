public class Population {
  Animal[] animals;
  int size;
  float[] fitness;
  Animal[] matingPool = new Animal[0];
  
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
    /*
    for (Animal animal: animals){
      animal.show();
    }
    */
    for (int k = 0;k<nDrawings;k++){
      animals[k].show();
    }
  }
  
  void update(){
    for (Animal animal: animals){
      animal.checkCollision();
      animal.update();
      PVector gene = animal.Dna.genes[counter];
      gene.setMag(.3);
      animal.applyForce(gene);
    }
  }
  
  Animal[] newGeneration(){
    Animal[] newPopul = new Animal[0];
    
    for (int i = 0;i<size;i++){
      fitness[i] = animals[i].calcFitness();
    }
    
    for (int j = 0;j<size;j++){
      for (int i = 0;i<fitness[j]*100;i++){
        matingPool = (Animal[]) append(matingPool, animals[j]);
      }
    }
    
    for (int i = 0;i<size;i++){
      Animal parentA = matingPool[int(random(matingPool.length))]; //<>//
      Animal parentB = matingPool[int(random(matingPool.length))]; //<>//
      
      while (parentA == parentB){
        parentB = matingPool[int(random(matingPool.length))];
      }
      
      DNA childDna = parentA.Dna.crossover(parentB.Dna); //<>//
      Animal child = new Animal(new PVector(width/2, height), childDna);
      newPopul = (Animal[]) append(newPopul, child); //<>//
      
    }
    
    matingPool = new Animal[0];
    
    return newPopul;
    
  }
  
}
