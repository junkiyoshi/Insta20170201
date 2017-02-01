ArrayList<Tower> towers;
float noise_value;
float radius, size;

void setup()
{
  size(512, 512, P3D);
  frameRate(30);
  colorMode(HSB);
  
  towers = new ArrayList<Tower>();
  noise_value = random(10);
  size = 30;

  for(int r = 0; r < 4; r += 1)
  {
    radius = 250 + r * 150;
    for(int i = 0; i < 360; i += 5)
    {
       float point_x = radius * cos(radians(i));
       float point_z = radius * sin(radians(i));
       towers.add(new Tower(new PVector(point_x, height - 30, point_z), size, 360 - i, noise_value));
   
       noise_value += 0.05;
    }
  }
}

void draw()
{
  background(255);
  translate(width / 2, height / 2, -1000);
  rotateX(radians(-60));
  
  for(int i = towers.size(); i > 0; i -= 1)
  {
    float h = map(noise(noise_value), 0, 1, -1024, 1536);
    towers.get(i - 1).update();
    towers.get(i - 1).display();
  }
  
  /*
  println(frameCount);
  saveFrame("screen-#####.png");
  if(frameCount > 1800)
  {
     exit();
  }
  */
}