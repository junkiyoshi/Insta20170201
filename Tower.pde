class Tower
{
  PVector location;
  float h; // height
  float w; // width
  float d; // depth
  float angle;
  float direction;
  color bodyColor;
  float my_noise;
  
  Tower(PVector l, float size, float a, float n)
  {
    location = l.copy();
    h = 0;
    w = size;
    d = size * 1.5;
    angle = a;
    bodyColor = color(a / 360 * 255, 255, 255);
    my_noise = n;
   }
    
  void update()
  {
    h = map(noise(my_noise), 0, 1, -1024, 1536);
    my_noise += 0.08;
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