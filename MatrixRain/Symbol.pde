class Symbol {
 int x;
 int length;
 int d, v, T;
 int minV = 3;
 int maxV = 7;
 char chars[];
 char charSet[] = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '+', '-', ':', '='};
 int font = 20;
 String fontFamily = "HiraKakuProN-W3";
 color head = color(188, 255, 196);
 color tail = color(0, 181, 36);
 int minLength = (height / font) / 2;
 int maxLength = minLength + (minLength / 2);
 
 Symbol(int x) {
   this.x = x;
   for (int i = 0; i < 26; i++) {
    charSet = (char[])append(charSet, char(65 + i)); //Add Alphabet
   }
   for (int i = 0; i < 88; i++) {
    charSet = (char[])append(charSet, char(12450 + i)); //Add Katakana characters
   }
   textFont(createFont(fontFamily, font, true, charSet));
   
   length = int(random(minLength, maxLength));
   chars = new char[length];
   for (int i = 0; i < length; i++) {
     chars[i] = charSet[int(random(charSet.length))];
   }
   d = int(random(-length * 2, -length));
   v = int(random(minV, maxV));
   T = int(random(1, 3));
 }
 
 int getFont() {
   return font;
 }
 
 void update(float fc) {
   if (fc % v == 0) {
     d++;
     for (int i = 0; i < length - 1; i++) {
       chars[i] = chars[i + 1];
       if (int(random(10)) == T) {
         chars[i] = charSet[int(random(charSet.length))];
       }
     }
     chars[length - 1] = charSet[int(random(charSet.length))];
   }
 }
 
 void show() {
   fill(tail);
   for (int i = 0; i < length - 1; i++) {
     pushMatrix();
     int y = ((d + i) * font) % height;
     translate(x, y);
     scale(-1, 1);
     text(chars[i], 0, 0);
     popMatrix();
   }
   
   fill(head);
   pushMatrix();
   int y = ((d + length - 1) * font) % height;
   translate(x, y);
   scale(-1, 1);
   text(chars[length - 1], 0, 0);
   popMatrix();
 }
}
