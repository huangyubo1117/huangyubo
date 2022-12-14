int MAX_PARTICLES = 170;
 
color[] COLORS = new color[]{ #69D2E7, #FFB6C1,  #8B008B, #F38630, #FA6900, #FF4E50, #F9D423};
 

//ARRAYS
ArrayList<Particle> particles = new ArrayList<Particle>();
ArrayList<Particle> pool = new ArrayList<Particle>();

//VARIABLES
float wander1 = 0.5;
float wander2 = 2.0;
float drag1 = 0.9;
float drag2 = 0.99;
float force1 = 2;
float force2 = 8;
float theta1 = -0.5;
float theta2 = 0.5;
float size1 = 5;
float size2 = 180;
float sizeScalar = 0.97;

int count1 = 0;
// ----------------------------------------
// Particle Functions
// ----------------------------------------
void setup(){
size(1920,1080);
}
class Particle{
 public boolean alive;
  public color c;
 public int size;
 public float wander,theta,drag;
public  PVector location,velocity; 

    
  Particle(float x,float y, int size) {
    this.alive = true;
    this.size = size;
    this.wander = 0.15;
    this.theta = random( TWO_PI );
    this.drag = 0.92;
    this.c = #ffffff;
    this.location = new PVector(x, y);
  this.velocity = new PVector(0.0, 0.0);
}
void move(){
    this.location.add(this.velocity);
    this.velocity.mult(this.drag);
    this.theta += random( theta1, theta2 ) * this.wander;
    this.velocity.x += sin( this.theta ) * 0.1;
    this.velocity.y += cos( this.theta ) * 0.1;
    this.size *= sizeScalar;
    this.alive = this.size > 0.5;
}
void show(){
  //arc( this.location.x, this.location.y, this.size, 0, TWO_PI );
  fill( this.c );
  noStroke();
  ellipse(this.location.x,this.location.y, this.size, this.size);
}
}
void spawn(float x,float y) {
  Particle particle;
    float  theta, force;
    if ( particles.size() >= MAX_PARTICLES ) {
        pool.add( particles.get(0) );
    }
    particle = new Particle(mouseX, mouseY, (int)random(size1,size2));
    particle.wander = random( wander1, wander2 );
    particle.c =COLORS[ (int)random( 0,6 )];
    particle.drag = random( drag1, drag2 );
    theta = random( TWO_PI );
    force = random( force1, force2 );
    particle.velocity.x = sin( theta ) * force;
    particle.velocity.y = cos( theta ) * force;
    particles.add( particle );
}
void update() {
    Particle particle;
    for (int  i = particles.size() - 1; i >= 0; i-- ) {
        particle = particles.get(i);
        if ( particle.alive ) {
          particle.move();
        } else {
          
          particles.remove(i);
          if(particles.size()>=1){
            pool.add( particles.get(0) );
          }
          
        }
    }
}
void moved() {
    int max;
    max = (int)random( 1, 4 );
    for ( int i = 0; i < max; i++ ) {
      spawn( mouseX, mouseY );
    }
}

void mouseMoved(){
moved();
}
// ----------------------------------------
// Runtime
// ----------------------------------------

 
void draw() {
   background(0);
  update();
    //drawingContext.globalCompositeOperation = 'normal';
   
   //drawingContext.globalCompositeOperation = 'lighter';
  for (int i = particles.size() - 1; i >= 0; i--) {
      particles.get(i).show();
    }
    textSize(30);
    
    if(count1<255){
    count1++;
    }else{
    count1 = 0;
    }
    pushStyle();
   fill(255,count1);
    text("From the Singularity to the Big Bang",700,height-100);
    popStyle();
    moved();
}

 

//void touchMoved() {
//    moved();
//}
