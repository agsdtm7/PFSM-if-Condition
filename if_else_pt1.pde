int xCloud = 100;
int yCloud = 100;

int xTower = 400;
int yTower = 400;

int towerWidth = 30;
int towerHeight = 150;

int xFan = xTower + towerWidth/2;
int yFan = yTower - towerHeight;

float angle = 0;

void setup(){
// https://processing.org/reference/setup_.html
size(500, 500);

noStroke();
}


void draw(){
//https://processing.org/reference/draw_.html
background(135, 206, 250);

// One way to do the same thing
//if(xCloud - 25 == width){
//  xCloud = -75;
//}else{
//  xCloud++;
//}

if(xCloud < width + 25){
  xCloud++;
}else{
  xCloud = -75;
}


// GREEN FIELD
fill(34, 139, 34);
rect(0, 350, width, 150);

// CLOUD
fill(255);
ellipse(xCloud, yCloud, 50, 50);
ellipse(xCloud + 25, yCloud, 50, 50);
ellipse(xCloud + 50, yCloud, 50, 50);

// WINDMILL
// TOWER
triangle(xTower, yTower, xTower + towerWidth, yTower, xTower + towerWidth/2, yTower - towerHeight);

pushMatrix();
translate(xFan, yFan);
rotate(radians(angle));
// FAN
fill(150);
triangle(0, 0, - 25 - 5,  -25 +5,- 25 + 5, -25 -5);
triangle(0, 0,  25 - 5,  -25 - 5,25 +5,  -25 +5);
triangle(0, 0,  25 + 5,  25 - 5,  25 - 5,  25 + 5);
triangle(0, 0,  - 25 +5,  25 + 5,  -25 -5,  25 -5);
popMatrix();
angle=angle+5;  // angle++; this is a shortcut
}
