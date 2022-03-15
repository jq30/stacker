import java.util.*;

Tetromino uwu = new Tetromino(5, 5, 2);
HashMap<Integer, RGB> ColorMappings;
int[][] grid;
float SCALE_FACTOR;
int time = 0;

void setup() {
  size(400, 600);
  noStroke();

  SCALE_FACTOR = 10;

  ColorMappings = new HashMap<Integer, RGB>();
  ColorMappings.put(0, new RGB(0, 0, 0));
  ColorMappings.put(1, new RGB(69, 215, 224));
  ColorMappings.put(2, new RGB(198, 117, 245));
  ColorMappings.put(3, new RGB(255, 191, 14));
  ColorMappings.put(4, new RGB(62, 69, 234));
  ColorMappings.put(5, new RGB(254, 103, 132));
  ColorMappings.put(6, new RGB(102, 255, 129));
  ColorMappings.put(7, new RGB(254, 255, 102));

  grid = new int[10][40];
  drawArray(grid);
}

void drawArray(int[][] array) {
  for (int i = 0; i < array.length; i++) {
    for (int k = 0; k < array[i].length; k++) {
      RGB fillColor = ColorMappings.get(array[i][k]);
      fill(fillColor.R, fillColor.G, fillColor.B);
      rect(i * SCALE_FACTOR, k * SCALE_FACTOR, SCALE_FACTOR, SCALE_FACTOR);
    }
  }
}

int randInt(int lower, int upper) {
  return (int)(Math.random() * (upper - lower + 1));
}

class RGB {
  public int R, G, B;
  RGB(int r, int g, int b) {
    this.R = r;
    this.G = g;
    this.B = b;
  }
}

class Tetromino {
  int x, y, value;
  Tetromino(int x, int y, int value) {
    this.x = x;
    this.y = y;
    this.value = value;
  }
  void render() {
    RGB fillColor = ColorMappings.get(value);
    fill(fillColor.R, fillColor.G, fillColor.B);
    rect(x * SCALE_FACTOR, y * SCALE_FACTOR, SCALE_FACTOR, SCALE_FACTOR);
  }
  void advance() {
    y++;
  }
}

void draw() {
  drawArray(grid);
  uwu.render();

  if (millis() > time) {
    uwu.advance();
    time += 200;
  }
}
