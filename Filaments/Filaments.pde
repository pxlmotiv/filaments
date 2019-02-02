Creator hy0;
Creator hy1;
Creator hy2;

float i = 0;
float j = 0;
float k = 0;

void setup() {
  size(1080, 1080);
  smooth(8);
  curveDetail(30);
  hy0 = new Creator(new PVector(0, (height/4.0) * 1), 40, PI);
  hy1 = new Creator(new PVector(0, (height/4.0) * 2), 60, PI);
  hy2 = new Creator(new PVector(0, (height/4.0) * 3), 80, PI);
  background(20);
}

void draw() {
  if (hy0.hasFinished()) {
      float h = sin(map(i, 0, height, PI/2, TWO_PI*2.5 + PI/2)) * height/10;
      hy0 = new Creator(new PVector(i, (height/4.0)*1 + h), 60, 3*PI/2);
      i+=1;
      if(i >= width)i=0;
  }
  if (hy1.hasFinished()) {
      float h = sin(map(j, 0, height, PI/2, TWO_PI*2.5 + PI/2)) * height/10;
      hy1 = new Creator(new PVector(j, (height/4.0)*2 + h), 80, PI);
      j+=1;
      if(j >= width)j=0;
  }
  if (hy2.hasFinished()) {
      float h = sin(map(k, 0, height, PI/2, TWO_PI*2.5 + PI/2)) * height/10;
      hy2 = new Creator(new PVector(k, (height/4.0)*3 + h), 60, PI/2);
      k+=1;
      if(k >= width)k=0;
  }
  hy0.update();
  hy1.update();
  hy2.update();
  hy0.draw();
  hy1.draw();
  hy2.draw();
}

void mouseClicked() {
  saveFrame("frames/saved-##.png");
}
