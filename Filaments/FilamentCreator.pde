class Creator {
  ArrayList<Node> nodes;
  float r, angle;
  
  private int i = 0;

  Creator(PVector initialPosition, float initialRadius, float a) {
    nodes = new ArrayList<Node>();
    r = initialRadius;
    Node n0 = new Node(initialPosition.x, initialPosition.y, initialRadius, a);
    nodes.add(n0);
  }

  void update() {
    Node parentNode = nodes.get(i);

    r = parentNode.radius;

    if (r > 0.5 && checkLimits(parentNode.position)) {
      r -= 0.33;

      float newAngle;
      PVector newPosition;

      int attempts = 0;
      do {
        newAngle = parentNode.angle + random(-PI/6, PI/6);
        newPosition = PVector.fromAngle(newAngle).mult(r);
        newPosition.add(parentNode.position);
        attempts++;
        if (attempts > 50) r--;
      } while (!checkCollision(parentNode.position) && attempts < 100 && checkLimits2(newPosition));

      Node newNode = new Node(newPosition.x, newPosition.y, r, newAngle);

      nodes.add(newNode);

      parentNode = newNode;
      i++;
    }
  }
  
  boolean checkLimits(PVector position){
    return (position.x - r > 0 && position.x + r < width && position.y - r > 0 && position.y + r < height);
  }
  
   boolean checkLimits2(PVector position){
    return (position.x - r <= 0 || position.x + r >= width || position.y - r <= 0 || position.y + r >= height);
  }

  boolean checkCollision(PVector p) {
    boolean hasCollided = false;
    for (Node n : nodes) {
      hasCollided = n.radius > dist(p.x, p.y, n.position.x, n.position.y);
      if (hasCollided)break;
    }
    return hasCollided;
  }

  boolean hasFinished() {
    int s = nodes.size() - 1;
    PVector p = nodes.get(s).position;
    println("position: " + p);
    return r <= 0.5 || p.x - r <= 0 || p.x + r >= width || p.y - r<= 0 || p.y + r >= height;
  }

  void draw() {
    beginShape();
    strokeWeight(1);
    stroke(220, 7);
    ellipseMode(RADIUS);
    fill(220, 7);
    ellipse(nodes.get(0).position.x, nodes.get(0).position.y, 1, 1);
    noFill();
    curveVertex(nodes.get(0).position.x, nodes.get(0).position.y);
    for (Node node : nodes) {
      curveVertex(node.position.x, node.position.y);
      //node.draw();
    }
    int s = nodes.size() - 1;
    curveVertex(nodes.get(s).position.x, nodes.get(s).position.y);
    endShape();
  }
}
