deviousBacteria[] cheesy;
deviousBacteria loneAlpha;

int minion = 0;
int bacteriaMaxxer = 100;
int lastSpawnTime = 0;
int spawnInterval = 5000;

void setup() {
  size(500, 500);
  background(0, 0, 0);
  cheesy = new deviousBacteria[bacteriaMaxxer];
  
  loneAlpha = new deviousBacteria(width / 2, height / 2, 20);
}

void draw() {
  background(0);
  
  loneAlpha.show();
  loneAlpha.move();
  
  if (millis() - lastSpawnTime > spawnInterval && minion < bacteriaMaxxer) {
    cheesy[minion] = new deviousBacteria();
    minion++;
    lastSpawnTime = millis();
  }

  for (int i = 0; i < minion; i++) {
    cheesy[i].show();
    cheesy[i].move();
  }
}

class deviousBacteria {
  int myX, myY, mySize, myColor;
  int startX, startY, distX, distY;
  boolean isControlled;

  deviousBacteria() {
    myX = (int)(Math.random() * 500);
    myY = (int)(Math.random() * 500);
    mySize = (int)(Math.random() * 10 + 10);
    myColor = color((int)(Math.random() * 255), (int)(Math.random() * 255), (int)(Math.random() * 255));
    isControlled = false;
  }
  
  deviousBacteria(int startX, int startY, int sizeI) {
    myX = startX;
    myY = startY;
    mySize = sizeI;
    myColor = color((int)(Math.random() * 255), (int)(Math.random() * 255), (int)(Math.random() * 255));
    isControlled = true;
  }
  
  void show() {
    fill(myColor);
    ellipse(myX, myY, mySize, mySize);
  }
  
  void move() { 
    distX = loneAlpha.myX - myX;
    distY = loneAlpha.myY - myY;
    if (!isControlled){
      if(distX > 0){
        myX = myX + (int)(Math.random()*5 - 2);
      }else if(distX < 0){
        myX = myX + (int)(Math.random()*5 - 3);
      }else if(distY > 0){
        myY = myY + (int)(Math.random()*5 - 2);
      }else if(distY < 0){
        myY = myY + (int)(Math.random()*5 - 3);
      }
      
      if(distX == 0 && distY == 0){
        fill(255, 255, 255);
        textSize(32);
        textAlign(CENTER);
        text("the sigmas have consumed you", width/2, height/2);
        noLoop();
      }
      
      if(myX > 500){
        myX = 500;
      }else if(myX < 0){
        myX = 0;
      }else if(myY > 500){
        myY = 500;
      }else if(myY < 0){
        myY = 0;
      }
    }
  }
}

void keyPressed() {
  if (key == 'w' || key == 'W') {
    loneAlpha.myY -= 10;
  } else if (key == 'a' || key == 'A') {
    loneAlpha.myX -= 10;
  } else if (key == 's' || key == 'S') {
    loneAlpha.myY += 10;
  } else if (key == 'd' || key == 'D') {
    loneAlpha.myX += 10;
  }
  
  if(loneAlpha.myX > 500){
    loneAlpha.myX = 500;
  }else if(loneAlpha.myX < 0){
    loneAlpha.myX = 0;
  }else if(loneAlpha.myY > 500){
    loneAlpha.myY = 500;
  }else if(loneAlpha.myY < 0){
    loneAlpha.myY = 0;
  }
}
