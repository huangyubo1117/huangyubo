float L = 2.5;
int Z = 100;
PImage myHead;

void setup() { 
 size(500, 500); 
 //background(circleSize);
 myHead = loadImage("WechatIMG404.jpeg");
 myHead.resize(500,500);
 
 } 
 
void draw() { 
   
  float circleNum = mouseX/10;
  float circleSize = width/circleNum;
   translate(circleSize/2,circleSize/2);
   
   background(255);
   fill(200);
   noStroke();
  
 for(int y=0;y<mouseX;y++){
   for(int x=0;x<mouseX;x++){
     
     color c=myHead.get(int(x*circleSize),int(y*circleSize));
     float realSize = brightness(c);
     float finalSize = map(realSize,0,255,circleSize,50);
 
     
     fill(c);
     noStroke();
     ellipse(x*circleSize,y*circleSize,finalSize,finalSize);
 
  }
 }

  //image(myHead,0,0);
}
