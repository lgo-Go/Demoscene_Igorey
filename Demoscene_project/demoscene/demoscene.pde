import processing.sound.*;
SoundFile file;
Amplitude amp;
AudioIn in;

void setup() {
  size(2000,1000);
  background(255);
   
  file = new SoundFile(this, "Tiger.mp3");
  file.play(1);
  amp = new Amplitude(this);
  in = new AudioIn(this,0);
  in.start();
  amp.input(file);
}      

void draw() {
  background(255);
  println(amp.analyze());
  if(amp.analyze()<0.2)
  {
    ellipse(width/2 ,height/2,amp.analyze()*1000,amp.analyze()*1000);
    fill(10,10,240);
  } else if(amp.analyze()>0.2){
    ellipse(width/2 ,height/2,amp.analyze()*1000,amp.analyze()*1000);
    fill(240,10,10);
  }
}
  