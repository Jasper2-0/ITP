/*

Debug environment for my tiny particle system.

*/

PSParameters psp;
ParticleSystem ps;


void setup() {
  size(1280,720,P3D);
  
  psp = new PSParameters();
  
  psp.emitFor   = 5;
  psp.emitRate  = 50;
  psp.reset     = true;
  
  psp.pp.mass       = 1.0f;
  psp.pp.friction   = 0.985f;
  psp.pp.lifespan   = 60.0f;
  psp.pp.startColor = #ff4020;
  psp.pp.endColor   = #000000;
  
  ps = new ParticleSystem(new PVector(width / 2, height / 2), psp);
  
  blendMode(ADD);
  
  background(0);
}

void draw() {
  background(0);
  ps.emit();
  ps.update();
  ps.draw();
}
