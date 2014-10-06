/*

Debug environment for my tiny particle system.

*/

ParticleSystem ps;
ParticleParameters pp;

void setup() {
  size(640,480,P3D);
  pp = new ParticleParameters();
  
  pp.mass = 10.0f;
  pp.lifespan = 60.0f;
  
  ps = new ParticleSystem(new PVector(width / 2, height / 2), pp);
      blendMode(ADD);
}

void draw() {
  background(0);
  ps.addParticle();
  ps.update();
  ps.draw();
}
