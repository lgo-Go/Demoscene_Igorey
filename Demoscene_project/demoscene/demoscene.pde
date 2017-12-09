import processing.sound.*;
SoundFile file;
Amplitude amp;


class Circle  {
    float x,y,b,c,s,o;
    Circle(float x1, float y1, float b1, float c1)
    {
      this.x = x1;
      this.y = y1;
      this.b = b1;
      this.c = c1;
    }
  
  void draw() 
   {
    ellipse(this.x,this.y,this.b,this.c);
   }
   void rardius()
   {
     this.b=this.c=amp.analyze()*100;
     this.y++;
     
     if(this.y>height){
       this.y=0;
       this.x = random(1,1999);
        if(amp.analyze()<0.2)
        {
          fill(10,10,240);
        } 
          if(amp.analyze()>0.2){
          fill(240,10,10);
        }
      }
    }
  }

Circle[] c_array;

void setup() {
  size(2000,1000);
  background(255);
   
  file = new SoundFile(this, "EOTT.flac");
  file.play(1);
  amp = new Amplitude(this);
  amp.input(file);
  
    float b = random(100,1000);
  
  c_array = new Circle[100];
  for(int a = 0; a < 100 ; a++)
  {
  c_array[a] = new Circle(random(width), random(height),b,b);}
  }      

void draw() 
{
  background(255);
  println(amp.analyze());
  
  for(int a = 0; a < 100 ; a++)
  {
   c_array[a].draw();
   c_array[a].rardius();

  }

}