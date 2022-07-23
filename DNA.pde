public class DNA {
  PVector[] genes = new PVector[lifespan];
  
  public DNA(){
    for (int i  = 0;i<lifespan;i++){
      genes[i] = PVector.random2D();
    }
  }
  
  public DNA(PVector[] gene){
    genes = gene;
  }
  
  PVector[] mutation(PVector[] childGenes){
    int chance = 100; // uma chance em ***
    PVector[] newChildGenes = childGenes;
    if (int(random(0, chance)) == 1){
      int index = int(random(0, childGenes.length));
      newChildGenes[index] = PVector.random2D();
    }
    
    return newChildGenes;
  }
  
  DNA crossover(DNA parentBDna){
    DNA childDNA;
    
    PVector[] childContent = new PVector[lifespan];
    
    int midpoint = int(random(0, lifespan));
    //int choice = int(random(0,1));
    int choice = 0;
    
    if (choice == 0){
      for (int i = 0;i<midpoint;i++){
        childContent[i] = genes[i];
      }
      
      for (int j = midpoint;j<lifespan;j++){
        childContent[j] = parentBDna.genes[j];
      }
      
    }else if (choice == 1){
      for (int i = 0;i<midpoint;i++){
        childContent[i] = parentBDna.genes[i];
      }
      
      for (int j = midpoint;j<lifespan;j++){
        childContent[j] = genes[j];
      }     
    }
    
    childContent = mutation(childContent);
    
    childDNA = new DNA(childContent);
    
    return childDNA;
  }
}
