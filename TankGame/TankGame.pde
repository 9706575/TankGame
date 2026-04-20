// Dom Prim | 1 April 2026 | TankGame
Tank t1;
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
Obstacle o1;
Obstacle o2;
Obstacle o3;
PImage bg;
int score;
Timer objTimer;

void setup() {
  size(500, 500);
  score = 0;
  bg = loadImage("Jungle.png");
  t1 = new Tank();
  objTimer = new Timer(1000);
  objTimer.start();
  //obstacles.add(new Obstacle(400, 100, 100, 50, 5, 100));
  //obstacles.add(new Obstacle(400, 300, 100, 50, 5, 100));
  //obstacles.add(new Obstacle(100, 300, 100, 50, 5, 100));
}

void draw() {
  background(bg);

  if (objTimer.isFinished()) {
    obstacles.add(new Obstacle(400, 100, 100, 50, int(random(1, 10)), 100));
    objTimer.start();
  }
  
  
  
  // Render and detect collision
  for (int i = 0; i < projectiles.size(); i++) {
    Projectile p = projectiles.get(i);
    for(int j = 0; j < obstacles.size(); j++) {
      Obstacle o = obstacles.get(j);
      if (p.intersect(o)) {
        score = score + 100;
        projectiles.remove(i);
        obstacles.remove(j);
        continue;
      }
    }
    p.display();
    p.move();
  }
  for (int i = 0; i < obstacles.size(); i++) {
    Obstacle o = obstacles.get(i);
    o.display();
    o.move();
    if (o.reachedEdge()) {
      obstacles.remove(i);
    }
  }
  t1.display();
  scorePanel();
}

void keyPressed() {
  if (key == 'w') {
    t1.move('w');
  } else if (key == 's') {
    t1.move('s');
  } else if (key == 'a') {
    t1.move('a');
  } else if (key == 'd') {
    t1.move('d');
  }
}

void mousePressed() {
  float dx = mouseX - t1.x;
  float dy = mouseY - t1.y;
  float mag = sqrt(dx*dx + dy*dy);

  if (mag > 0) {
    dx /= mag;
    dy /= mag;

    float speed = 5;
    projectiles.add(new Projectile(t1.x, t1.y, dx * speed, dy * speed));
  }
}

void scorePanel() {
  fill(127, 200);
  rectMode(CENTER);
  noStroke();
  rect(width/2, 10, width, 20);
  fill(255);
  text("Score:" + score, width/2, 15);
}
