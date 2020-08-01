class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;

  Mover(float m, float x, float y) {
    mass = m;
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    velocity.limit(2);
    acceleration.mult(0);
  }

  void display() {
    stroke(0);
    strokeWeight(2);
    fill(map(relativeB, 0, 1, 255, 0));
    ellipse(location.x, location.y, mass*16, mass*16);
  }

  void checkEdges() {
    if (location.y > height) {
      velocity.y *= -0.6;
      location.y = height;
    }
  }
}
