import java.util.*;

void setup() {
  size(400, 600);
  noStroke();

  HashMap<Integer, RGB> ColorMappings = new HashMap<Integer, RGB>();
  ColorMappings.put(0, new RGB(0, 0, 0));

  int[][] grid = new int[10][40];
  grid[3][5] = 3;

  drawArray(grid, ColorMappings);
}

void drawArray(int[][] array, HashMap<Integer, RGB> ColorMappings) {
  float SCALE_FACTOR = 10;

  for (int i = 0; i < array.length; i++) {
    for (int k = 0; k < array[i].length; k++) {
      if (array[i][k] == 0) {fill(0, 0, 0);} else {fill(255, 255, 255);}
      rect(i * SCALE_FACTOR, k * SCALE_FACTOR, SCALE_FACTOR, SCALE_FACTOR);
    }
  }
}

// void rect(int x, int y, int w, int h, RGB color) {
//   fill(color.R, color.G, color.B);
//   rect(x, y, w, h);
// }

class RGB {
  int R, G, B;
  RGB(int r, int g, int b) {
    R = r;
    G = g;
    B = b;
  }
}
