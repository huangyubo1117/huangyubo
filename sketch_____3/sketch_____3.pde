void setup() { 
 size(950, 800); 
 } 
 void draw() { 
 background(255); 
 int number=5; 
 for (int i=0; i<number; i++) { 
 line(30+i*300, 0, 30+i*300, 1000); 
 line(0, 25, 1000, 25); 
 rect(330, 30, 300, 25); 
 fill(255, 250, 0); 
 stroke(0); 
 strokeWeight(10); 
 rect(30, 200, 300, 400); 
 fill(255, 250, 0); 
 rect(330, 350, 300, 400); 
 fill(255, 0, 0); 
 rect(330, 300, 150, 450); 
 fill(150, 150, 150); 
 rect(630, 600, 700, 600); 
 fill(0,0,0);
 rect(630, 250, 800, 200); 
 fill(0,0, 255); 
 rect(480, 250, 480, 300); 
 fill(0,0, 255); 
 rect(0, 400, 30, 200); 
 fill(0); 
 rect(330, 400, 150, 200); 
 fill(150, 150, 150); 

 } 
 } 
