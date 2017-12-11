import processing.sound.*;
SoundFile file;
Amplitude amp;

int[] x = new int[1000];
int[] y = new int[1000];
int[] z = new int[1000];
int[] v = new int[2000];
int[] b = new int[2000];
int[] c = new int[2000];

class Box {
    float x, m, n, l;
    Box(float l1, float m1, float n1) {
        this.l = l1;
        this.m = m1;
        this.n = n1;
    }

    void draw() {
        box(this.x);
        if (amp.analyze() < 0.2) {
            fill(255, 255, 0);
            stroke(0);
        } else if (amp.analyze() > 0.2) {
            fill(240, 10, 10);
        }
    }
    void rardius() {
        translate(m, l, n);
        this.x = amp.analyze() * 100;


    }
}

Box[] c_array;

void setup() {
    size(displayWidth, displayHeight, P3D);
    background(255);

    file = new SoundFile(this, "EOTT.flac");
    file.play(1);
    amp = new Amplitude(this);
    amp.input(file);


    for (int s = 0; s < 1000; s++) {
        v[s] = int(random(-displayWidth, displayWidth));
        b[s] = int(random(-displayHeight, displayHeight));
        c[s] = int(random(-displayHeight, displayHeight));
    }


    c_array = new Box[200];
    for (int a = 0; a < 200; a++) {
        x[a] = int(random(-10,10));
        y[a] = int(random(-10,10));
        z[a] = int(random(-10,10));
        c_array[a] = new Box(x[a], y[a], z[a]);
    }
}

void draw() {

    background(0);
    println(amp.analyze());
    translate(width / 2, height / 2);
    noFill();
    rotateY(frameCount / 100.0);
    rotateX(frameCount / 100.0);


    sphere(200);



    for (int i = 0; i < 2000; i++) {
        stroke(255, 255, 0);
        point(v[i], b[i], c[i]);

    }
    for (int i = 0; i < 100; i++) {
        c_array[i].draw();
        c_array[i].rardius();
    }
}