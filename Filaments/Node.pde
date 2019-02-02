class Node {
  PVector position;
  float radius, angle;

  Node(float x, float y, float r, float a) {
    radius = r;
    position = new PVector(x, y);
    angle = a;
  }

  boolean shouldSpawnBranch() {
    return radius > 2 && random(6) < 1;
  }

  void draw() {
    pushStyle();
    noFill();
    strokeWeight(1);
    stroke(120, 100);
    ellipseMode(RADIUS);
    ellipse(position.x, position.y, radius, radius);
    popStyle();
  }
}
