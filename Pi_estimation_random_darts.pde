//Pi estimation using 'random darts'

int r = 45;
int i = 0;
int ii = 0;
double x = 0;
double y = 0;
double d = 0;
int outC = 0;
int inC = 0;
int tot = 0;
double piEst = 0;
double xx = 0;
double yy = 0;

void settings() {
  size(2*r, 2*r);
}

void setup() {
  frameRate(10000);
  background(255, 0, 0);
  stroke(0, 255, 0);
  fill(0, 255, 0);
  ellipse(r, r, r*2, r*2);
}

void draw() {

  // noFill();
  // stroke(0);
  // ellipse(r, r, r*2, r*2);


  /*  
   if(ii == r*2+1){
   stop();
   }
   if(i == r*2+1){
   ii++;
   i = 0;
   }
   x = Math.abs(r - i);
   y = Math.abs(r - ii);
   */

  x = random(0, 2*r);
  y = random(0, 2*r);
  xx = Math.abs(r - (x));
  yy = Math.abs(r - (y));


  d = sqrt((float)xx*(float)xx + (float)yy*(float)yy);


  if (d > r && (tot/40000)%2 == 0) {
    stroke(0, 255, 0);
    //point(i, ii);
    point((float)x, (float)y);
    outC++;
  }
  if (d > r && (tot/40000)%2 != 0) {
    stroke(255, 0, 0);
    point(i, ii);
    point((float)x, (float)y);
    outC++;
  }
  if (d < r && (tot/40000)%2 == 0) {
    stroke(255, 0, 0);
    //point(i, ii);
    point((float)x, (float)y);
    inC++;
  }
  if (d < r && (tot/40000%2 != 0)) {
    stroke(0, 255, 0);
    point(i, ii);
    point((float)x, (float)y);
    inC++;
  }

  if (tot%40000 == 0) {

    background(0, 255, 0);
    stroke(255, 255, 0);
    fill(255, 0, 0);
    ellipse(r, r, r*2, r*2);
  }
  if (tot%80000 == 0) {
    background(255, 0, 0);
    stroke(0, 255, 0);
    fill(0, 255, 0);
    ellipse(r, r, r*2, r*2);
  }


  i++;

  tot = inC + outC;
  piEst = 4*((double)inC/(double)tot);

  if (tot%5000 == 0) {
    println("\r\n\r\n\r\n");
    println("Dots per second:         " + frameRate);
    println("Dots outside of circle:  " + outC);
    println("Dots inside of circle:   " + inC);
    println("Dots in total:           " + tot);
    println("Estimation of pi:        " + piEst);
  }
}
