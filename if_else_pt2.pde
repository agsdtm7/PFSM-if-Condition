int xCloud = 100;
int yCloud = 100;

int xTower = 400;
int yTower = 400;

int towerWidth = 30;
int towerHeight = 150;

int xFan = xTower + towerWidth/2;
int yFan = yTower - towerHeight;

int red, green, blue;
boolean rain = false;
int cloudTrack = 0; // we create a variable cloudTrack
int cloudColor = 255;
int angle = 0;
int angleSpd = 5;
void setup() {
  size(500, 500);
  red = 135;
  green = 206;
  blue = 250;
  background(red, green, blue);
}

void draw() {
  background(red, green, blue);
  if (xCloud - 25 < width) {
    xCloud++;
  } else {
    cloudTrack++; // increment cloudTrack by 1 each time the cloud reaches the width 
    xCloud = -75;
  }
  // condition to change the value of rain
  if (cloudTrack %2 !=0) {
    rain = true;  // if cloudTrack modulo 2 IS NOT equal to 0 then change the value of rain to true
  } else {
    rain = false; // if cloudTrack modulo 2 IS equal to 0 then change the value of rain to false
  }
  
  // GREEN FIELD
  noStroke();
  fill(34, 139, 34);
  rect(0, 350, width, 150);

  // CLOUD
  fill(cloudColor);
  ellipse(xCloud, yCloud, 50, 50);
  ellipse(xCloud + 25, yCloud, 50, 50);
  ellipse(xCloud + 50, yCloud, 50, 50);

  // WINDMILL
  // TOWER
  triangle(xTower, yTower, xTower + towerWidth, yTower, xTower + towerWidth/2, yTower - towerHeight);

  // FAN
  fill(50);
  // ROTATING THE FAN USING pushMatrix, translate, rotate, and popMatrix
  pushMatrix();
  translate(xFan, yFan); // every coordinate will be shifted right by xFan pixels and down by yFan pixels
  rotate(radians(angle)); // each targeted coordinate will be rotated by the angle
  triangle(0, 0, - 25 - 5, -25 +5, - 25 + 5, -25 -5);
  triangle(0, 0, 25 - 5, -25 - 5, 25 +5, -25 +5);
  triangle(0, 0, 25 + 5, 25 - 5, 25 - 5, 25 + 5);
  triangle(0, 0, - 25 +5, 25 + 5, -25 -5, 25 -5);
  popMatrix();
  angle+= angleSpd; // angle will be incremented by 5 by default
  // END OF ROTATION

  // CONDITION TO TRIGGER THE RAIN -- when the value of rain is true then start the rain
  if (rain == true) {
    cloudColor = 200;
    angleSpd = 10;
    red = 150;
    green = 150;
    blue = 150;
    // RAIN
    stroke(1);
    float xRain = random(width);
    float yRain = random(height);
    float xRain2 = random(width);
    float yRain2 = random(height);
    float xRain3 = random(width);
    float yRain3 = random(height);
    line(xRain, yRain, xRain +10, yRain +10);
    line(xRain2, yRain2, xRain2 +10, yRain2 +10);
    line(xRain3, yRain3, xRain3 +10, yRain3 +10);
  }else{
    angleSpd = 5;
    cloudColor = 255;
    red = 135;
    green = 206;
    blue = 250;

  }
}
