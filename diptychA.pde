color[] colours = {#66CCFF, #5D6B70, #59a699, #DEFF69, #B1C2C9, #FFFFFF};
int colourCounter = 0;
int WINDOWSIZE = 450;
boolean started = false;
int opacity = 20;
color COLOUR;


void setup() {
  size(WINDOWSIZE, WINDOWSIZE); 
  frameRate(30);
  strokeWeight(1);
  fill(#FFFFFF, opacity);

  clearBackground();
}

void draw() {
  if(started){
    stainedGlass();
  }
}

void mousePressed() {
  if(!started){
     started = true;
  }
  clearBackground();
}

color getNextColour() {
  colourCounter++;
  colourCounter = colourCounter%colours.length;
  return colours[colourCounter];
}

void clearBackground() {
  background(#000000);
}

int r() {
  return int(random(WINDOWSIZE));
}

void stainedGlass(){
  fill(getNextColour(), 10);

  beginShape();

    vertex(r(), r());

    bezierVertex(r(), r(), r(), r(), r(), r());

    bezierVertex(r(), r(), r(), r(), r(), r());

  endShape();

}
