import java.util.*;

void setup() {
  size(400, 600);
  noStroke();

  HashMap<Integer, RGB> ColorMappings = new HashMap<Integer, RGB>();
  ColorMappings.put(0, new RGB(0, 0, 0));
  ColorMappings.put(1, new RGB(69, 215, 224));
  ColorMappings.put(2, new RGB(198, 117, 245));
  ColorMappings.put(3, new RGB(255, 191, 14));
  ColorMappings.put(4, new RGB(62, 69, 234));
  ColorMappings.put(5, new RGB(254, 103, 132));
  ColorMappings.put(6, new RGB(102, 255, 129));
  ColorMappings.put(7, new RGB(254, 255, 102));

  int[][] grid = new int[10][40];
  for (int[] row : grid) {
    for (int i = 0; i < row.length; i++) {
      row[i] = randInt(0, 7);
    }
  }

  drawArray(grid, ColorMappings);
}

void drawArray(int[][] array, HashMap<Integer, RGB> ColorMappings) {
  float SCALE_FACTOR = 10;

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
