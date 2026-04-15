class Obstacle {
  // member variables
  float x, y, w, h, speed, health;
  PImage obs1;
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
    obs1 = loadImage ("Obstacle1.png");
  }

  void display() {
    fill(127);
    imageMode(CENTER);
    image(obs1, x, y);
  }

  void move() {
    x=x+5;
    if (x>width) {
      x = 0;
    }
  }
}
