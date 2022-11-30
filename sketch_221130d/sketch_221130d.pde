void setup()
{
  size(600,400);
  background(random(0,255),random(0,255),random(0,255));
}
void draw()
{

  fill(int(random(2))*255,int(random(2))*255,int(random(2))*255);
  ellipse (random(0,600),random(0,400),30,30);
  rect(random(0,600),random(0,400),random(0,300),random(0,300)); 
  stroke(random(0,255),random(0,255),random(0,255));

}
