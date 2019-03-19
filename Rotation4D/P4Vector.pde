class P4Vector {
 float x, y, z, w;
 
 P4Vector(float x, float y, float z, float w) {
   this.x = x;
   this.y = y;
   this.z = z;
   this.w = w;
 }
 
 P4Vector() {
   x = 0;
   y = 0;
   z = 0;
   w = 0;
 }
 
 /*float getAt(int idx) {
   if (idx == 0) return x;
   if (idx == 1) return y;
   if (idx == 2) return z;
   if (idx == 3) return w;
   println("P4VECTOR: ERROR OUT OF BOUNDS at index " + idx);
   return -1;
 }*/
 
 void mult(float factor) {
   x *= factor;
   y *= factor;
   z *= factor;
   w *= factor;
 }
 
 PVector toPVector(){
   return new PVector(x, y, z);
 }

}
