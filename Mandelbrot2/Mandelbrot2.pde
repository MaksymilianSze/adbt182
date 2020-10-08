float minvalX = -1.5;
float minvalY = -1.5;
float maxvalX = 1.5;
float maxvalY = 1.5;
float angle = 0;
float di,dj;
int xPixel,yPixel;






void setup(){
  size(500,500);
  pixelDensity(1);
  colorMode(HSB, 360);

}


void draw() {
  
  float maxLoops = 100;
  loadPixels();

  
  float equationOneOriginal; 
  float equationTwoOriginal; 


  

  

  
  
  for (xPixel = 0; xPixel < width ; xPixel++) {
    for (yPixel = 0; yPixel < height ; yPixel++) {
      
      float a = map(xPixel+di, 0,width, minvalX, maxvalX);
      float b = map(yPixel+dj, 0,height, minvalY, maxvalY);
      
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
      
        pixels[xPixel+yPixel*width] = color(0);
      
      }
      else {
        pixels[xPixel+yPixel*width] = color(n-(int)(n/360)*n, 360, (int)map(n*6, 1, maxLoops, 0, 360));
      
      }
      
    }
  }
  
  updatePixels();
  
}

void mousePressed()
{
  
  if (mouseButton == LEFT) {
    di = di + mouseX - int(width/2);
    dj = dj + mouseY - int(height/2);
    
    minvalX += 0.1;
    maxvalX -= 0.1;
    
    minvalY += 0.1;
    maxvalY -= 0.1;
    
    
   
    
  }
  
  


  
  
}
