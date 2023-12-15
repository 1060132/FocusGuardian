String Title = "Moorhuhn";
int Score;
int[] zielX;
int[] zielY;
int anzahlZiele = 20;

void setup() {
  size(1920,1080);
  
  zielX = new int[anzahlZiele];
  zielY = new int[anzahlZiele];
  
  // Zufällige Initialisierung der Zielkoordinaten
  for (int i = 0; i < anzahlZiele; i++) {
    zielX[i] = (int) random(130,1582.5);
    zielY[i] = (int) random(180,730);
    Score = 0;
  }
}

void draw() {
  background(#D3D3D3);
  fill(#EA2424);
  textSize(100);
  text(Title, 725, 100);
  
  fill(255);
  rect(100, 150, 1612.5,800);
  
  fill(0);
  textSize(40);
  text("Score:",1712, 170);
  text(Score, 1825, 170);
  text("Commands:", 1712, 330);
  text("q - Quit", 1712, 380);
  text("h - halt", 1712, 460);
  text("r - restart", 1712, 540);
  
    for (int i = 0; i < anzahlZiele; i++) {
    drawZiel(zielX[i], zielY[i]);
    }
  
}

void drawZiel(int x, int y) {
  fill(255, 0, 0); // Rote Farbe für die Ziele
  ellipse(x, y, 30, 30);
}


void mousePressed() {
  // Überprüfe, ob Mausklick auf ein Ziel trifft
  for (int i = 0; i < anzahlZiele; i++) {
    float entfernung = dist(mouseX, mouseY, zielX[i], zielY[i]);
    if (entfernung < 15) { // Hier 15 als Radius für Klick-Treffer festgelegt
      despawnZiel(i);
      spawnNeuesZiel(i);
    }
  }
}


void despawnZiel(int index) {
  // Entferne Ziel an der gegebenen Indexposition
  zielX[index] = -100; // Versetze die Koordinaten außerhalb des sichtbaren Bereichs
  zielY[index] = -100;
  Score+=1;
}

void spawnNeuesZiel(int index) {
  // Setze neue zufällige Koordinaten für das neu gespawnte Ziel
  zielX[index] = (int) random(100,1612.5);
  zielY[index] = (int) random(150,800);
}


void keyPressed() {
  switch(key){
    case "q":
      break;
    case "h"
}


void draw_wait_screen(){
  
