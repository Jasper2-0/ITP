class PSParameters {
  int emitFor;
  int emitRate;

  PVector position;

  ParticleParameters pp;
  
  
  
  boolean reset;

  PSParameters() {
    pp = new ParticleParameters();
  }


  ParticleParameters getParticleParameters() {
    return pp;
  }
}


class ParticleParameters {


  float mass;
  float lifespan;
  float friction;  

  color startColor;
  color endColor;

  ParticleParameters() {
  }
}
