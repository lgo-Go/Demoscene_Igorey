import processing.sound.*;
SoundFile file;
Amplitude amp;


class Box {
  float m, n, l, x;
  Box(Float m1, Float n1, Float l1, float x1) {
    this.m = m1;
    this.n = n1;
    this.l = l1;
    this.x = x1;
  }

  void draw() {

    translate(this.m, this.n, this.l);
    box(this.x);
    if (amp.analyze() < 0.1) {
      fill(255, 255, 0);
      stroke(200);
    } else if (amp.analyze() > 0.1) {
      fill(240, 10, 10);
    }
  }
}
void zvezda() {
  int[] p_ar = new int[2000]; 
  for (int i = 1; i < 2000; i++) for (int j = 1; j < 2000; j++) for (int k = 1; k < 2000; k++) {
    p_ar[i] = int (random(-width, width));
    p_ar[j] = int (random(-height, height));
    p_ar[k] = int (random(-height, height));
    stroke(255);  
    point(p_ar[i], p_ar[j], p_ar[k]);
  }
  return;
}

Box[] b_array;



void setup() {
  fullScreen(P3D);
  file = new SoundFile(this, "tiger.mp3");
  file.play(1);
  amp = new Amplitude(this);
  amp.input(file);





  b_array = new Box[15];
  for (int i = 0; i < 15; i++) {
    b_array[i] = new Box( random(width/2-15, width/2+15), random(width/2-15, width/2+15), 200.0, amp.analyze() * 200);
  }
}

void draw() {

  background(0);
  println(amp.analyze());

  zvezda();

  rotateY(20);
  rotateX(20);
  for (int i = 0; i < 15; i++) {
    b_array[i].draw();
  }
}