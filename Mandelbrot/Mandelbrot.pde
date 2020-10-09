float minvalX = -1.5;
float minvalY = -1.5;
float maxvalX = 1.5;
float maxvalY = 1.5;
float angle = 0;
float di,dj;
int xPixel,yPixel;
PImage canvas;



void setup(){
  size(500,500);
  pixelDensity(1);
  colorMode(HSB, 360);
  
  canvas = createImage(width, height, RGB);

}


void draw() {
  
   
  image(canvas,0,0);
  float maxLoops = 100;
  canvas.loadPixels();

  
  float equationOneOriginal; 
  float equationTwoOriginal; 
  
  
  for (xPixel = 0; xPixel < canvas.width ; xPixel++) {
    for (yPixel = 0; yPixel < canvas.height ; yPixel++) {
      
      float a = map(xPixel, 0,canvas.width, minvalX, maxvalX);
      float b = map(yPixel, 0,canvas.height, minvalY, maxvalY);
      
      equationOneOriginal = a;
      equationTwoOriginal = b;
      
      float n = 1;
      
      while (n < maxLoops) {
        
        float equationOne  = a*a - b*b; //First part of the equation 
        float equationTwo  = 2 * a * b; //Second part of the equation
        
        a = equationOne  + equationOneOriginal;
        b = equationTwo  + equationTwoOriginal;
        
        if (abs(a+b) > 16) { //Testing to see if it ends towards infinity. If the number is greater that 16 it is likely it tends to infinity.
          break;
        }
        
        n++;
      }
      
      
      if (n == maxLoops) { //Testing to see if it ends towards infinity by checking if it reached the max loops. 
      
        canvas.pixels[xPixel+yPixel*canvas.width] = color(0); //If it reaches the max loops (doesn't tend to infinity) then it is coloured black as it is in the set.
      
      }
      else {
        canvas.pixels[xPixel+yPixel*canvas.width] = color(n-(int)(n/360)*n, 360, (int)map(n*6, 1, maxLoops, 0, 360)); //If i doesnt reach max loops (tends to infinity) then it is coloured
      
      }
      
    }
  }
  
  canvas.updatePixels();
  
}

void mousePressed()
{
  
  if (mouseButton == LEFT) {
    
   float zoomDistance = abs( (maxvalX*0.99)/2 );
   float newX = map(mouseX, 0, canvas.width, minvalX, maxvalX);
   float newY = map(mouseY, 0, canvas.height, minvalY, maxvalY);
   
   println(minvalX, maxvalX);
   println(minvalY, maxvalY);
   
   minvalX = newX - zoomDistance;
   minvalY = newY - zoomDistance;
   maxvalX = newX + zoomDistance;
   maxvalY = newY + zoomDistance;
   
   
   println(minvalX, maxvalX);
   println(" ");
   println(minvalY, maxvalY);
  }
  
  
}
