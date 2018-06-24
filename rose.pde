float r = 200;
float a = 0;
float aAcc = 0.0;
float aVel = 0.9;
float k = sqrt(2)/2;
float x = r * cos(a);
float y = r * sin(a);
float xP;
float yP;
float cx, cy;
float c1,c2,c3;
float massa = 20;
PGraphics canvas;
void setup(){
  size(640,640);
  cx = width/2;
  cy = 200;
  canvas = createGraphics(width, height);
  canvas.beginDraw();
  canvas.background(0);
  canvas.endDraw();
}
void draw(){
  
  background(40);
  c1 = (a*r)/a;
  c2 = (a*x+a)/a;
  c3 = (a*y+a)/a;
  imageMode(CORNER);
  image(canvas, 0, 0, width, height);
   if(k%2 != 0){
     k = k;
   }else{
     k *= k;
   }
  stroke(20,20,20,150);
  line(0,height/2,width,height/2);
  line(height/2,0,height/2,height);
  translate(width/2, height/2);
  
  fill(0);
 
  stroke(c1,c2,c3);
  
  strokeWeight(4);
  //line(0,0,x,y);
  ellipse(x,y,massa,massa);
  
  a += aVel;
  aVel += aAcc;
  aVel = constrain(aVel,0,0.009);
  
  x = r * cos(k*a) * cos(a);
  y = r * cos(k*a) * sin(a);  
  canvas.beginDraw();
  //canvas.background(0, 1);
  canvas.translate(width/2, height/2);
  canvas.stroke(c1,c2,c3,160);
  canvas.strokeWeight(massa/3);
  if (frameCount > 1) {
    canvas.line(xP, yP, x, y);
  }
  canvas.endDraw();
  
  xP = x;
  yP = y;
  
}
