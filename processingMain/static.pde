
Sierpinski makeSierpinski(int levels, float x1, float y1, float x2, float y2, float x3, float y3) {
  return new Sierpinski(levels, x1, y1, x2, y2, x3, y3);
}


Sierpinski makeSierpinski(int maxWidth, int maxHeight, int defaultLevel) {
  float x1, y1, x2, y2, x3, y3;
  // do computations to determine the starting vertices of triangles
  float midWidth = maxWidth / 2;
  float midHeight = maxHeight / 2;
  float margin = midHeight * 0.2;

  x1 = midWidth;
  y1 = margin;

  float[] rotatedCoors = rotate(x1, y1, midWidth, midHeight, 120);

  x2 = rotatedCoors[0];
  y2 = rotatedCoors[1];

  rotatedCoors = rotate(x2, y2, midWidth, midHeight, 120);

  x3 = rotatedCoors[0];
  y3 = rotatedCoors[1];
  
  return new Sierpinski(defaultLevel, x1, y1, x2, y2, x3, y3);
}

/**
 Helper function to determing rotation of a point about another point, given a specific angle
 Rotates (x, y) around (cx, cy) for angle degrees
 */
float[] rotate(float x, float y, float cx, float cy, float angle) {
  // See https://academo.org/demos/rotation-about-point/
  float rangle = radians(angle);

  // declare tmp values to work with so not messing with original arguments
  float nx, ny, tmpx;

  // translate all pts so that cx cy are at origin
  nx = tmpx = x - cx;
  ny = y - cy;
  
  //ny = -ny;
  
  // apply rotation
  nx = nx * cos(rangle) - ny * sin(rangle);
  
  // Here nx is changed already, so use the tmp variable
  ny = ny * cos(rangle) + tmpx * sin(rangle);

  // translate back
  //ny = -ny;
  
  nx += cx;
  ny += cy;

  return new float[] {nx, ny};
}