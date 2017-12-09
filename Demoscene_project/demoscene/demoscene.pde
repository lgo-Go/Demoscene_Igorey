import processing.sound.*;
SoundFile file;
Amplitude amp;
AudioIn in;



class Circle  {
    float x,y,b,c;
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
  }

Circle[] c_array;

void setup() {
  size(2000,1000);
  background(255);
   
  file = new SoundFile(this, "EOTT.flac");
  file.play(1);
  amp = new Amplitude(this);
  in = new AudioIn(this,0);
  in.start();
  amp.input(file);
  
  float b = random(10,100);
  
  c_array = new Circle[20];
  for(int a = 0; a < 20 ; a++)
  {
  c_array[a] = new Circle(random(width), random(height),b,b);}
  }      

void draw() 
{
  background(255);
  println(amp.analyze());
  
  for(int a = 0; a < 20 ; a++)
  {
   c_array[a].draw();
  }

if(amp.analyze()<0.2)
  {
    ellipse(width/2 ,height/2,amp.analyze()*1000,amp.analyze()*1000);
    fill(10,10,240);
  } 
   if(amp.analyze()>0.2){
    ellipse(width/2 ,height/2,amp.analyze()*1000,amp.analyze()*1000);
    fill(240,10,10);
  }

}