import processing.sound.*; 
SoundFile file; 
Amplitude amp; 

int[] l_x1 = new int[100]; 
int[] l_y1 = new int[100]; 
int[] l_z1 = new int[100]; 
int[] x = new int[1000]; 
int[] y = new int[1000]; 
int[] z = new int[1000]; 
int[] v = new int[2500]; 
int[] b = new int[2500]; 
int[] c = new int[2500]; 
int t; 
int zet = 400;


class Box { 
  float x, m, n, l; 
  Box(float l1, float m1, float n1) { 
    this.l = l1; 
    this.m = m1; 
    this.n = n1;
  } 

  void draw() { 
    pushMatrix(); 
    rotateY(frameCount / -100.0); 
    rotateX(frameCount / -100.0);
    translate(m, l, n); 
    box(this.x); 
    popMatrix(); 
    this.x = amp.analyze() * 100; 
    if (amp.analyze() < 0.1) { 
      stroke(240, 10, 10); 
      fill(255, 255, 0);
    } else if (amp.analyze() > 0.1) { 
      stroke(255, 255, 0); 
      fill(240, 10, 10);
    }
  }
} 

class Sphere { 
  float S1, S2, S3; 
  Sphere(float S_1, float S_2, float S_3) { 
    this.S1 = S_1; 
    this.S2 = S_2; 
    this.S3 = S_3;
  } 

  void draw() { 
    pushMatrix(); 
    stroke(255, 255, 0); 
    translate(S1, S2, S3); 
    fill(255, 12, 0); 
    sphere(amp.analyze() * 250); 
    popMatrix();
  }
} 

class Yozh { 
  float l_x1, l_y1, l_z1; 
  Yozh(float l_x, float l_y, float l_z) { 
    this.l_x1 = l_x; 
    this.l_y1 = l_y; 
    this.l_z1 = l_z;
  } 

  void igla() { 
    pushMatrix();
    rotateY(frameCount / -100.0);
    rotateX(frameCount / -100.0);
    line(0, 0, 0, amp.analyze()*10*l_x1, amp.analyze()*10*l_y1, amp.analyze()*10*l_z1); 
    popMatrix();
  }
} 

Box[] c_array; 
Yozh[] y_array; 

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

  c_array = new Box[1000]; 
  for (int a = 0; a < 1000; a++) { 
    x[a] = int(random(-250, 250)); 
    y[a] = int(random(-250, 250)); 
    z[a] = int(random(-250, 250)); 
    c_array[a] = new Box(x[a], y[a], z[a]);
  } 

  y_array = new Yozh[100]; 
  for (int i = 0; i < 100; i++) { 
    l_x1[i]=int(random(-500, 500)); 
    l_y1[i]=int(random(-500, 500)); 
    l_z1[i]=int(random(-500, 500)); 
    y_array[i] = new Yozh(l_x1[i], l_y1[i], l_z1[i]);
  }
} 

void draw() { 

  t = t + 1;
  if(t > 650 && zet > 0) {
     zet-=30; 
  }

  background(0); 
  println(amp.analyze(), t); 
  translate(width / 2, height / 2, zet); 

  rotateX(frameCount / 500.0); 
  rotateY(frameCount / 500.0); 

  for (int i = 0; i < 2500; i++) { 
    stroke(255); 
    point(v[i], b[i], c[i]);
  } 

  if (t < 1880) { 
    if (amp.analyze() < 0.1) { 
      fill(255, 255, 10); 
      stroke(255, 10, 10); 
      sphere(amp.analyze() * 300);
    } else { 
      fill(255, 10, 10); 
      stroke(255, 255, 10); 
      sphere(amp.analyze() * 300);
    } 


    int l = int(amp.analyze() * 1000); 
    Sphere Unit0 = new Sphere(l, l, l); 
    Unit0.draw(); 
    Sphere Unit1 = new Sphere(-l, l, l); 
    Unit1.draw(); 
    Sphere Unit2 = new Sphere(l, -l, l); 
    Unit2.draw(); 
    Sphere Unit3 = new Sphere(l, l, -l); 
    Unit3.draw(); 
    Sphere Unit4 = new Sphere(-l, -l, l); 
    Unit4.draw(); 
    Sphere Unit5 = new Sphere(l, -l, -l); 
    Unit5.draw(); 
    Sphere Unit6 = new Sphere(-l, l, -l); 
    Unit6.draw(); 
    Sphere Unit7 = new Sphere(-l, -l, -l); 
    Unit7.draw();
  } else { 
    stroke(255, 10, 10); 
    sphere(amp.analyze() * 400);
  } 

  for (int i = 0; i < 100; i++) { 
    if (amp.analyze() < 0.1) { 
      stroke(255, 0, 0);
    } else { 
      stroke(240, 10, 10);
    } 
    c_array[i].draw(); 
    y_array[i].igla();
  } 
  if (t>20000) { 
    noLoop();
  }
  
  if(t > 3800) {
      zet-=10; 
  }
}