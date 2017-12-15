import processing.sound.*; 
SoundFile file; 
Amplitude amp; 
int[] y_x = new int[100]; 
int[] y_y = new int[100]; 
int[] y_z = new int[100];
int[] x = new int[1000]; 
int[] y = new int[1000]; 
int[] z = new int[1000]; 
int[] v = new int[2500]; 
int[] b = new int[2500]; 
int[] c = new int[2500]; 
int t; 
int zet = 400;

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



class Yozh {
  float k, l_x, l_y, l_z;
  Yozh(float k, float l_x, float l_y, float l_z) {
    this.k = k;
    this.l_x = l_x; 
    this.l_y = l_y; 
    this.l_z = l_z;
  }

  void igla() {
    pushMatrix();
    rotateY(frameCount / -100.0);
    rotateZ(frameCount / -100.0);
    translate(l_x, l_y, l_z);
    line((1*width)/4, height/2, 0, l_x, l_y, l_z);
    popMatrix();
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
    x[a] = int(random(-100, 100)); 
    y[a] = int(random(-100, 100)); 
    z[a] = int(random(-100, 100)); 
    c_array[a] = new Box(x[a], y[a], z[a]);
  }
  
  y_array = new Yozh[100];
  for (int a = 0; a < 100; a++) { 
    y_x[a] = int(random((width/4) - 30, (width/4 + 30 ))); 
    y_y[a] = int(random((height/4) - 30, (height/4 + 30 ))); 
    y_z[a] = int(random(-30, 30)); 
    y_array[a] = new Yozh(y_x[a], y_y[a], y_z[a]);
  }
  
} 

void draw() { 

  t = t + 1; 
  if (zet > -300 && t > 760) {
    zet-=10;
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

  if (t < 650) { 

    fill(255, 255, 10); 
    stroke(255, 10, 10); 
    sphere(amp.analyze()*300); 

    Sphere Unit0 = new Sphere(t/5, t/5, t/5); 
    Unit0.draw(); 
    Sphere Unit1 = new Sphere(-t/5, t/5, t/5); 
    Unit1.draw(); 
    Sphere Unit2 = new Sphere(t/5, -t/5, t/5); 
    Unit2.draw(); 
    Sphere Unit3 = new Sphere(t/5, t/5, -t/5); 
    Unit3.draw(); 
    Sphere Unit4 = new Sphere(-t/5, -t/5, t/5); 
    Unit4.draw(); 
    Sphere Unit5 = new Sphere(t/5, -t/5, -t/5); 
    Unit5.draw(); 
    Sphere Unit6 = new Sphere(-t/5, t/5, -t/5); 
    Unit6.draw(); 
    Sphere Unit7 = new Sphere(-t/5, -t/5, -t/5); 
    Unit7.draw();
  } 
  if (500<t&t<4600) { 
    for (int i = 0; i < 100; i++) { 
      if (amp.analyze() < 0.1) { 
        stroke(255, 0, 0);
      } else { 
        stroke(240, 10, 10);
      } 
      c_array[i].draw();
    }
  }
  
if (t>1000) { 
    for (int i = 0; i < 100; i++) { 
      if (amp.analyze() < 0.1) { 
        stroke(255, 0, 0);
      } else { 
        stroke(240, 10, 10);
      } 
      y_array[i].igla();
    }
  }
  
  if (t>2760) { 
    fill(255, 10, 10); 
    sphere(amp.analyze()*300);
  } 
  if (t<4600) { 
    for (int i = 0; i < 100; i++) { 
      if (amp.analyze() < 0.1) { 
        stroke(255, 10, 0);
      } else { 
        stroke(240, 250, 10);
      } 
      c_array[i].draw();
    }
  }
}