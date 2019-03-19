P4Vector matrixMult(P4Vector[] a, P4Vector b) {
  return matrixToVector(matrixMult(a, vectorToMatrix(b)));
}

P4Vector[] matrixMult(P4Vector[] a, P4Vector[] b) {
  P4Vector[] result = instantiateMatrix(new P4Vector[4]);
  P4Vector[] _b = transpose(b);
  for (int i = 0; i < a.length; i++) {
    float x = dotProduct(a[i], _b[0]);
    float y = dotProduct(a[i], _b[1]);
    float z = dotProduct(a[i], _b[2]);
    float w = dotProduct(a[i], _b[3]);
    result[i] = new P4Vector(x, y, z, w);
  }
  return result;
}

P4Vector[] transpose(P4Vector[] a) {
  P4Vector[] result = a;
  float buffer = result[0].y;
  result[0].y = result[1].x;
  result[1].x = buffer;
  
  buffer = result[0].z;
  result[0].z = result[2].x;
  result[2].x = buffer;
  
  buffer = result[0].w;
  result[0].w = result[3].x;
  result[3].x = buffer;
  
  buffer = result[1].z;
  result[1].z = result[2].y;
  result[2].y = buffer;
  
  buffer = result[1].w;
  result[1].w = result[3].y;
  result[3].y = buffer;
  
  buffer = result[2].w;
  result[2].w = result[3].z;
  result[3].z = buffer;
  
  return result;
}

float dotProduct(P4Vector a, P4Vector b) {
  return (a.x * b.x) + (a.y * b.y) + (a.z * b.z) + (a.w * b.w);
}

PVector matrixMult(PVector[] a, PVector b) {
  return matrixToVector(matrixMult(a, vectorToMatrix(b)));
}

PVector[] matrixMult(PVector[] a, PVector[] b) {
  PVector[] result = instantiateMatrix(new PVector[3]);
  PVector[] _b = transpose(b);
  for (int i = 0; i < a.length; i++) {
    float x = dotProduct(a[i], _b[0]);
    float y = dotProduct(a[i], _b[1]);
    float z = dotProduct(a[i], _b[2]);
    result[i] = new PVector(x, y, z);
  }
  return result;
}

PVector[] transpose(PVector[] a) {
  PVector[] result = a;
  float buffer = result[0].y;
  result[0].y = result[1].x;
  result[1].x = buffer;
  
  buffer = result[0].z;
  result[0].z = result[2].x;
  result[2].x = buffer;
  
  buffer = result[1].z;
  result[1].z = result[2].y;
  result[2].y = buffer;
  
  return result;
}

float dotProduct(PVector a, PVector b) {
  return (a.x * b.x) + (a.y * b.y) + (a.z * b.z);
}

PVector[] vectorToMatrix(PVector a) {
  PVector result[] = instantiateMatrix(new PVector[3]);
  result[0].x = a.x;
  result[1].x = a.y;
  result[2].x = a.z;
  return result;
}

PVector matrixToVector(PVector a[]) {
  return new PVector(a[0].x, a[1].x, a[2].x);
}

PVector[] instantiateMatrix(PVector[] a) {
  for (int i = 0; i < a.length; i++){
    a[i] = new PVector(0, 0, 0);
  }
  return a;
}

P4Vector[] vectorToMatrix(P4Vector a) {
  P4Vector result[] = instantiateMatrix(new P4Vector[4]);
  result[0].x = a.x;
  result[1].x = a.y;
  result[2].x = a.z;
  result[3].x = a.w;
  return result;
}

P4Vector matrixToVector(P4Vector a[]) {
  return new P4Vector(a[0].x, a[1].x, a[2].x, a[3].x);
}

P4Vector[] instantiateMatrix(P4Vector[] a) {
  for (int i = 0; i < a.length; i++){
    a[i] = new P4Vector();
  }
  return a;
}

void printMatrix(P4Vector a[]) {
  for(int i = 0; i < a.length; i++) {
    println(a[i].x, a[i].y, a[i].z, a[i].w);
  }
}

void printVector(P4Vector a) {
  println(a.x);
  println(a.y);
  println(a.z);
  println(a.w);
}
