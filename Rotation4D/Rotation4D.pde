P4Vector[] tesseract = {
  new P4Vector(-1, -1, -1, 1),
  new P4Vector(1, -1, -1, 1),
  new P4Vector(1, 1, -1, 1),
  new P4Vector(-1, 1, -1, 1),
  new P4Vector(-1, -1, 1, 1),
  new P4Vector(1, -1, 1, 1),
  new P4Vector(1, 1, 1, 1),
  new P4Vector(-1, 1, 1, 1),
  new P4Vector(-1, -1, -1, -1),
  new P4Vector(1, -1, -1, -1),
  new P4Vector(1, 1, -1, -1),
  new P4Vector(-1, 1, -1, -1),
  new P4Vector(-1, -1, 1, -1),
  new P4Vector(1, -1, 1, -1),
  new P4Vector(1, 1, 1, -1),
  new P4Vector(-1, 1, 1, -1)
};

float angle = 0;

void setup() {
  size(600, 400, P3D);
}

void draw() {
  background(0);
  translate(width/2, height/2);
  rotateX(-PI/2);
  stroke(255);
  strokeWeight(16);
  
  P4Vector[] rotationXY = {
    new P4Vector(cos(angle), -sin(angle), 0, 0),
    new P4Vector(sin(angle), cos(angle), 0, 0),
    new P4Vector(0, 0, 1, 0),
    new P4Vector(0, 0, 0, 1)
  };
  
  P4Vector[] rotationYZ = {
    new P4Vector(1, 0, 0, 0),
    new P4Vector(0, cos(angle), -sin(angle), 0),
    new P4Vector(0, sin(angle), cos(angle), 0),
    new P4Vector(0, 0, 0, 1)
  };
  
  P4Vector[] rotationXW = {
    new P4Vector(cos(angle), 0, 0, -sin(angle)),
    new P4Vector(0, 1, 0, 0),
    new P4Vector(0, 0, 1, 0),
    new P4Vector(sin(angle), 0, 0, cos(angle))
  };
  
  P4Vector[] rotationZW = {
    new P4Vector(1, 0, 0, 0),
    new P4Vector(0, 1, 0, 0),
    new P4Vector(0, 0, cos(angle), sin(angle)),
    new P4Vector(0, 0, -sin(angle), cos(angle))
  };
  
  PVector[] projected = new PVector[tesseract.length];

  for (int i = 0; i < tesseract.length; i++) {
    P4Vector v = tesseract[i];
    
    P4Vector rotated = matrixMult(rotationXY, v);
    rotated = matrixMult(rotationZW, rotated);
    //P4Vector rotated = matrixMult(rotationYZ, v);
    //rotated = matrixMult(rotationXW, v);
    //EDIT ROTATION AXIS S.T => Rz(x): rotate on Z clockwise
    
    float distance = 2;
    float d = 1 / (distance - rotated.w);

    PVector[] projection = {
      new PVector(d, 0, 0),
      new PVector(0, d, 0),
      new PVector(0, 0, d),
    };
    
    PVector project = matrixMult(projection, rotated.toPVector());
    project.mult(75);
    projected[i] = project;
    
    point(project.x, project.y, project.z);
  }

  for (int i = 0; i < 4; i++) {
    connect((i + 1) % 4, i, 0, projected);
    connect(((i + 1) % 4) + 4, i + 4, 0, projected);
    connect(i + 4, i, 0, projected);
  }

  for (int i = 0; i < 4; i++) {
    connect((i + 1) % 4, i, 8, projected);
    connect(((i + 1) % 4) + 4, i + 4, 8, projected);
    connect(i + 4, i, 8, projected);
  }

  for (int i = 0; i < 8; i++) {
    connect(i + 8, i, 0, projected);
  }
  
  angle += 0.02;
}

void connect(int i, int j, int offset, PVector[] points) {
  PVector a = points[i + offset];
  PVector b = points[j + offset];
  strokeWeight(2);
  stroke(255);
  line(a.x, a.y, a.z, b.x, b.y, b.z);
}
