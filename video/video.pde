import processing.video.*;
Capture video;

int filters = 0;

PImage butterfly;
PImage flower;
PImage rainbow;
PImage dog;

void setup() {
  size(500, 700);
  video = new Capture(this, 480, 680);
  video.start();
  butterfly = loadImage ("butterfly.png");
  flower = loadImage ("flower.png");
  rainbow = loadImage ("rainbow.png");
  dog = loadImage ("dog.png");
}

void draw() {
  background(0);
  image(video, 0, 0);

  image (butterfly, 400, 0, 100, 100);
  image (flower, 400, 100, 100, 100);
  image (rainbow, 400, 200, 100, 100);
  image (dog, 400, 300, 100, 100);

  if (mousePressed) {
    if (mouseX > 400 && mouseX < 500 && mouseY > 0 && mouseY < 100) {
      filters = 1;
    } else if (mouseX > 400 && mouseX < 500 && mouseY > 110 && mouseY < 200) {
      filters = 2;
    } else if (mouseX > 400 && mouseX < 500 && mouseY > 210 && mouseY < 300) {
      filters = 3;
    } else if (mouseX > 400 && mouseX < 500 && mouseY > 310 && mouseY < 400) {
      filters = 4;
    }
  }

  switch(filters) {
  case 1:
    image (butterfly, 150, 20, 220, 220);
    break;
  case 2:
    image (flower, 150, 20, 220, 220);
    break;
  case 3:
    image (rainbow, 100, 250, 300, 450);
    break;
  case 4:
    image (dog, 50, 100, 400, 500);
    break;
  }
}

void keyPressed() {
  if (key== 's') {
    save("image.jpg");
  }
}
void captureEvent(Capture video) {
  video.read();
}