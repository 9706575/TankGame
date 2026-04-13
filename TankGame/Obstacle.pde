class Obstacle {
  // member variables
  float x, y, w, h, speed, health;
  PImage iTankW, iTankA, iTankD, iTankS;
  char idir;

  // constructor
  Obstacle(float x, float y, float w, float h, float speed, float health) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.speed = speed;
    this.health = health;
    idir = 'w';
  }

  void display() {
    fill(127);
    rect(x, y, w, h);
  }

  void move() {
    x=x+speed;
  }
}
