ArrayList<Tower> towers;
float noise_value;
float radius, size;

void setup()
{
  size(512, 512, P3D);
  frameRate(15);
  colorMode(HSB);
  
  towers = new ArrayList<Tower>();
  noise_value = random(10);
  radius = 500;
  size = 30;

  for(int i = 0; i < 360; i += 5)
  {
     float point_x = radius * cos(radians(i));
     float point_z = radius * sin(radians(i));
     towers.add(new Tower(new PVector(point_x, height - 30, point_z), size, 360 - i));
  }
}

void draw()
{
  background(0);
  translate(width / 2, height / 2, -1000);
  rotateX(radians(-60));
  
  float tmp_noise_value = noise_value;
  for(int i = towers.size(); i > 0; i -= 1)
  {
    float h = map(noise(noise_value), 0, 1, -1024, 1024);
    towers.get(i - 1).update(h);
    towers.get(i - 1).display();
    noise_value += 0.05;
  }
  //noise_value = tmp_noise_value + 0.05;
  
  /*
  println(frameCount);
  saveFrame("screen-#####.png");
  if(frameCount > 1800)
  {
     exit();
  }
  */
}