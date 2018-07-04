import processing.serial.*;

Serial port;

String keysDown = "";

void setup() {
  size(100, 1000);
  port = new Serial(this, "/dev/rfcomm1", 9600);
}
void draw() {
  background(51);
  textSize(98);
  text(keysDown, 0, 0, 100, 1000);
  if(port.available() > 0) {
    println(port.read());
  }
}
void keyPressed() {
  if(!keysDown.contains("" + key)) {
    port.write(key);
    keysDown += key;
  }
}
void keyReleased() {
  if(keysDown.contains("" + key)) {
    port.write((int) key - 32);
    keysDown = keysDown.replace("" + key, "");
  }
}
