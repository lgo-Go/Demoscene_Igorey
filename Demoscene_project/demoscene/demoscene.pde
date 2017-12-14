

import processing.sound.*;
SoundFile file;
Amplitude amp;

int[] x = new int[1];
int[] y = new int[1];
int[] z = new int[1];
int[] v = new int[2500];
int[] b = new int[2500];
int[] c = new int[2500];
int t;

class Box {
    float x, m, n, l;
    Box(float l1, float m1, float n1) {
        this.l = l1;
        this.m = m1;
        this.n = n1;
    }

    void draw() {
        sphere(this.x);
        translate(m, l, n);
        this.x = amp.analyze() * 500;
        if (amp.analyze() < 0.1) {
          stroke(240, 10, 10);  
          fill(255, 255, 0);
        } else if (amp.analyze() > 0.1) { 
          stroke(255, 255, 0);
          fill(240, 10, 10);
          }
    }
}

Box[] c_array;

void setup() {
    fullScreen(P3D);
    file = new SoundFile(this, "tiger.mp3");
    file.play(1);
    amp = new Amplitude(this);
    amp.input(file);

    for (int s = 0; s < 2500; s++) {
        v[s] = int(random(-displayWidth, displayWidth));
        b[s] = int(random(-displayHeight, displayHeight));
        c[s] = int(random(-displayHeight, displayHeight));
    }

    c_array = new Box[1];
    for (int a = 0; a < 1; a++) {
        x[a] = int(random(-10, 10));
        y[a] = int(random(-10, 10));
        z[a] = int(random(-10, 10));
        
        c_array[a] = new Box(x[a], y[a], z[a]);
    }
}

void draw() {
    
    t=t+1;
    
    background(0);
    println(amp.analyze());
    translate(width / 2, height / 2, 500);
    
    rotateX(frameCount / 500.0);
    rotateY(frameCount / 500.0);
    
    
       if(t<585){
      pushMatrix();
      translate(100,100,100);
      sphere(amp.analyze()*100);
      popMatrix();
      
      pushMatrix();
      translate(-100,100,100);
      sphere(amp.analyze()*100);
      popMatrix();
      
      pushMatrix();
      translate(-100,100,-100);
      sphere(amp.analyze()*100);
      popMatrix();
      
      pushMatrix();
      translate(100,100,-100);
      sphere(amp.analyze()*100);
      popMatrix();
      
      pushMatrix();
      translate(100,-100,100);
      sphere(amp.analyze()*100);
      popMatrix();
      
      pushMatrix();
      translate(-100,-100,100);
      sphere(amp.analyze()*100);
      popMatrix();
      
      pushMatrix();
      translate(-100,-100,-100);
      sphere(amp.analyze()*100);
      popMatrix();
      
      pushMatrix();
      translate(100,-100,100);
      sphere(amp.analyze()*100);
      popMatrix();
      
    }
    
 for (int i = 0; i < 2500; i++) {
              stroke(255);  
      point(v[i], b[i], c[i]);
      
    }
    for (int i = 0; i < 1; i=i+5) {
        if (amp.analyze() < 0.1) {
          stroke(255, 255, 0);}
          else {stroke(240, 10, 10);}
        c_array[i].draw();
    }
    
    if(t<9000){
      int a=int(random(-100,100));
      int b=int(random(-100,100));
      int c=int(random(-100,100));
      translate(a,b,c);
      sphere(amp.analyze()*100);
      
    }
    

    
}