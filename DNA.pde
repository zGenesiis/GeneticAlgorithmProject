public class DNA {
  PVector[] genes = new PVector[lifespan];
  
  public DNA(){
    for (int i  = 0;i<lifespan;i++){
      genes[i] = PVector.random2D();
    }
  }
  
  
}
