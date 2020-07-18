/*BOOP SQUIDWARDS NOSE, EYES, PALMS, AND FEET (hover over star as well). SING A SONG OF SQUIDWARD.*/

//CREATED: MAY 27th

/*as a child, I would exlusively watch spongebob (i know i know, brain damaging or something).
as a young adult, I have started to relate to, and enjoy squidward's cynicism and nihilistic pessimism. 
Squidward's one liners are pure comedic gold. He is the dryest, most ironic sea squid.*/

/*I realized, I do not remember in my mind what the appearance of this icon is like, and so,
I set out to mold squidward from memory. I also asked a favor from some pals if they could draw squidward
for me from their memory——you learn loads from this ...*/


//TECHNICAL ISSUES I NEED TO IMPROVE: how would I have the immage array pause on the last image when 
//it finishes looping and I scroll through?

//i love squidward

import processing.sound.*;
SoundFile file;

int timedelay = 1000;
int nextTime;

int xnose = 650;
int ynose = 224;
int nosewidth = 70;
int noseheight = 70;

int xlight = 1174;
int ylight = 0;
int lightwidth = 106;
int lightheight = 102;

int xpalm = 240;
int ypalm = 531;
int palmwidth = 105;
int palmheight = 81;

int xrpalm = 867;
int yrpalm = 510;
int palmrwidth = 131;
int palmrheight = 58;

int xrfoot = 781;
int yrfoot = 567;
int rfootwidth = 126;
int rfootheight = 60;

int xlfoot = 390;
int ylfoot = 567;
int lfootwidth = 107;
int lfootheight = 71;

int xleye = 570;
int yleye = 102;
int radiusleye = 40;

int xreye = 673;
int yreye = 102;
int radiusreye = 40;

int nPicsstand = 12;
PImage[] squidstand = new PImage[nPicsstand];
int currentImage = 0;
int currentImagea = 7;

int nPicsswing = 20;
PImage[] squidswing = new PImage[nPicsswing];
int currentImagesh = 0;

int nPicsplop = 33;
PImage[] squidplop = new PImage[nPicsplop];
int currentImagepl = 0;

int nPicsded = 20;
PImage[] squidded = new PImage[nPicsded];
int currentImageded = 0;

int nPics3dance = 262;
PImage[] squid3dance = new PImage[nPics3dance];
int currentImage3da = 0;

PImage[] draw = new PImage[6];
int currentImagedraw = 0;

color yellow = color(255, 254, 136, 200);
void setup() {
  size(1280, 720);

  file = new SoundFile(this, "SpongeBob Closing Theme Song.mp3");
  file.play();
  ////frameRate(12);
  //frameRate(24);
  for (int i = 0; i < 12; i++) {
    squidstand[i] = loadImage("squid_curves01" + nf(i+23) + ".png");
  }
  for (int i = 0; i < 20; i++) {
    squidswing[i] = loadImage("squid_curves01" + nf(i+35) + ".png");
  }
  for (int i = 0; i < 20; i++) {
    squidplop[i] = loadImage("squid_curves00" + nf(i+80) + ".png");
  }
  for (int i = 20; i < 33; i++) {
    squidplop[i] = loadImage("squid_curves0" + nf(i+80) + ".png");
  }

  for (int i = 0; i < 20; i++) {
    squidded[i] = loadImage("squid_curves0" + nf(i+161) + ".png");
  }

  for (int i = 0; i < 161; i++) {
    squid3dance[i] = loadImage("front0" + nf(i+101) + ".png");
  }
  for (int i = 0; i < 6; i++) {
    draw[i] = loadImage("draw" + nf(i+1) + ".png");
  }
}

void draw() {

  image(squidstand[3], 0, 0, width, height);
  drawFace();
  noStroke();
  fill(yellow);
  //blend(yellow, 0, 0, 33, 100, 67, 0, 33, 100, ADD);
  star(xlight+25, ylight+lightwidth/2+25, 15, 70, 4); 
}


void drawFace() {
  
  
  if (overImage(xnose, ynose, nosewidth, noseheight) == true) {
    image(squidstand[5], 0, 0, width, height);
  } 
  
  
  else if (overImage(xlight, ylight, lightwidth, lightheight) == true) {
    image(squidstand[currentImagea], 0, 0, width, height);
    currentImagea = (currentImagea + 1);
    if (currentImagea == 11) {
      currentImagea = 7;
      //need to figure out how to make this pause for a moment on this and stay on the last
      //frame
    }
  } 
  
  else if (overImage(xpalm, ypalm, palmwidth, palmheight) == true) {
    image(squidswing[currentImagesh], 0, 0, width, height);
    currentImagesh = (currentImagesh + 1) % 20;
  } 
  
  else if (overImage(xrpalm, yrpalm, palmrwidth, palmrheight) == true) {
    image(squidstand[1], 0, 0, width, height);
  } 
  
  
  else if (overImage(xrfoot, yrfoot, rfootwidth, rfootheight) == true) {
    image(squidplop[currentImagepl], 0, 0, width, height);
    currentImagepl = (currentImagepl + 1) % 32;
  } 
  
  
  else if (overImage(xlfoot, ylfoot, lfootwidth, lfootheight) == true) {
    frameRate(60);
    image(squid3dance[currentImage3da], 0, 0, width, height);
    currentImage3da = (currentImage3da + 1) % 161;
  } 
  
  
  else if (overCircle(xleye, yleye, radiusleye) == true) {
    image(squidded[currentImageded], 0, 0, width, height);
    currentImageded = (currentImageded + 1) % 20;
  }
  
  
  else if (overCircle(xreye, yreye, radiusreye) == true) {

    image(draw[currentImagedraw], width/2, 20, draw[currentImagedraw].width/2.6, draw[currentImagedraw].height/2.6);
    if (millis() > nextTime) {
      currentImagedraw++;
      if (currentImagedraw >= draw.length) {
        currentImagedraw = 0;
      }
      nextTime = millis() + timedelay;
    }
  } 
  
 //default image 
   else {
    image(squidstand[3], 0, 0, width, height);
  }
}


boolean overImage(float x, float y, float w, float h) {
  if (mouseX > x && mouseX < x+w &&
    mouseY > y && mouseY < y+h) {
    return true;
  } else {
    return false;
  }
}

boolean overCircle(float x, float y, float r) {
  // If the (x,y) are inside the circle, return 'true'
  if (dist(mouseX, mouseY, x, y) < r) {
    return true;
  } else {
    return false;
  }
}

void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
