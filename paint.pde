int SIZE = 450;
boolean started = false;
Brush brush;

void setup() {
  size(SIZE, SIZE);
  strokeCap(SQUARE);
  clearBackground();
  strokeWeight(12);
  brush = new Brush(random(SIZE), 20);
}

void draw() {
    if(started){
        brush.paint();
    }
}

class Brush {
  float x1, y1, x2, y2;
  int mobility;
  color colour;
  color[] colours = {#FF8E64, #FF581A,#FF733F,#FFAD8E,#FFD3C3,#FFBC64,#FFE5C3,#FFCE8E};
  int cindex;
  int tr;
  int baset = 5;
  int tvar = 5;

  Brush(float y1, int m) {
    this.x1 = 0;
    this.y1 = y1;
    this.mobility = m;
    this.tr = baset + int(random(-tvar, tvar));
    this.cindex = 0;
    getNextColour();
  }
  
  void getNextColour() {
    cindex++;
    cindex = cindex % colours.length;
    colour = colours[cindex]; 
  }
  
  void move() {
    y1 = y2;
    y2 = y1 + random(-mobility, mobility);

    if(switchSides()) {
      x1 = SIZE - x1;
      getNextColour();
    }
    
    if(y2 >= SIZE || y2 <= 0) { //stop it from jumping off canvas
      y2 = random(0, SIZE);
    }
  }
  
  void setTransparency() {
    tr = baset + int(random(-tvar, tvar));
    stroke(colour, tr);
  }
  
  void paint() {
    setTransparency();
    move();
    drawLine();
  }

  void drawLine() {

    float n = 20.0;
    float xmid;
    x2 = random(0, SIZE);

    for(int i = 0; i < n; i++) {
      xmid = x1 + ((1+i)*(x2-x1)/n);
      line(x1, y1, xmid, y1);
    }
  }
  
}

boolean switchSides() {
  return random(100) > 99;
}

void clearBackground() {
  background(#101010);
}

void mousePressed() {
  clearBackground();
  started = true;
}
