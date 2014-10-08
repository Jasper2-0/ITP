/*

Debug environment for my tiny particle system.

*/

PSParameters psp;
ParticleSystem ps;


void setup() {
  size(640,480,P3D);
  psp = new PSParameters();
  
  psp.pp.mass = 10.0f;
  psp.pp.lifespan = random(40.0f,60.0f);
  
  ps = new ParticleSystem(new PVector(width / 2, height / 2), psp);
      blendMode(ADD);
}

void draw() {
  background(0);
  ps.emit();
  ps.applyForce(new PVector(0,1));
  ps.update();
  ps.draw();
}
