class Tower
{
  PVector location;
  float h; // height
  float w; // width
  float d; // depth
  float angle;
  float direction;
  color bodyColor;
  
  Tower(PVector l, float size, float a)
  {
    location = l.copy();
    h = 30;
    w = size;
    d = size * 1.5;
    angle = a;
    bodyColor = color(a / 360 * 255, 255, 255);
   }
    
  void update(float h_)
  {
    h = h_;
  }
  
  void display()
  {
    pushMatrix();
    translate(location.x, location.y - h / 2, location.z);
    rotateY(radians(angle));
    fill(bodyColor);
    stroke(32, 128);
    box(w, h, d);
    /*
    translate(0, -h, 0);
    fill(bodyColor);
    noStroke();
    sphere(size);
    */
    popMatrix();
  }
}