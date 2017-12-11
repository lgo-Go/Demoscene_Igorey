import processing.sound.*;
SoundFile file;
Amplitude amp;

int[] x = new int[1];
int[] y = new int[1];
int[] z = new int[1];
int[] v = new int[2500];
int[] b = new int[2500];
int[] c = new int[2500];

class Box {
    float x, m, n, l;
    Box(float l1, float m1, float n1) {
        this.l = l1;
        this.m = m1;
        this.n = n1;
    }

    void draw() {
        box(this.x);
        translate(m, l, n);
        this.x = amp.analyze() * 100;
        if (amp.analyze() < 0.1) {
            fill(255, 255, 0);
            stroke(0);
        } else if (amp.analyze() > 0.1) {
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

    background(0);
    println(amp.analyze());
    translate(width / 2, height / 2, 500);
    
    rotateY(frameCount / 500.0);
    rotateX(frameCount / 500.0);
    for (int i = 0; i < 2500; i++) {
        stroke(255);
        point(v[i], b[i], c[i]);

    }
    for (int i = 0; i < 1; i++) {
        c_array[i].draw();
    }
}