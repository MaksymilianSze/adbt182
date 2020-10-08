float minvalX = -1.5;
float minvalY = -1.5;
float maxvalX = 1.5;
float maxvalY = 1.5;
float angle = 0;
float di,dj;
int xPixel,yPixel;
float a,b;
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
      
      a = map(xPixel, 0,canvas.width, minvalX, maxvalX);
      b = map(yPixel, 0,canvas.height, minvalY, maxvalY);
      
      equationOneOriginal = a;
      equationTwoOriginal = b;
      
      float n = 1;
      
      while (n < maxLoops) {
        
        float equationOne  = a*a - b*b; //First part of the equation 
        float equationTwo  = 2 * a * b; //Second part of the equation
        
        a = equationOne  + equationOneOriginal;
        b = equationTwo  + equationTwoOriginal;
        
        if (abs(a+b) > 16) {
          break;
        }
        
        n++;
      }
      

      
      if (n == maxLoops) {
      
        canvas.pixels[xPixel+yPixel*canvas.width] = color(0); //If it reaches the max loops then it is not coloured 
      
      }
      else {
        canvas.pixels[xPixel+yPixel*canvas.width] = color(n-(int)(n/360)*n, 360, (int)map(n*6, 1, maxLoops, 0, 360)); //If i doesnt reach max loops then it is coloured
      
      }
      
    }
  }
  
  canvas.updatePixels();
  
}

void mousePressed()
{
  
  if (mouseButton == LEFT) {
    //di = di + mouseX - int(width/2);
    //dj = dj + mouseY - int(height/2);
    
    //minvalX += 0.1;
    //maxvalX -= 0.1;
    
    //minvalY += 0.1;
    //maxvalY -= 0.1;
    
    //float cx = (minvalX + maxvalX)/2;
    //float cy = (minvalY + maxvalY)/2;
    
    //a = cx + (xPixel/width - 1.5)*maxvalX;

    //b = cy + (yPixel/width - 1.5)*maxvalY;
    
   float zoomDistance = abs( (maxvalX*0.99)/2 );
   float mx = map(mouseX, 0, canvas.width, minvalX, maxvalX);
   float my = map(mouseY, 0, canvas.height, minvalY, maxvalY);
   
   println(minvalX, maxvalX);
   println(minvalY, maxvalY);
   
   minvalX = mx - zoomDistance;
   minvalY = my - zoomDistance;
   maxvalX = mx + zoomDistance;
   maxvalY = my + zoomDistance;
   
   println(" ");
   
   println(minvalX, maxvalX);
   println(minvalY, maxvalY);
  }
  
  


  
  
}
