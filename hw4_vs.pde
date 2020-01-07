int count = 0;
PFont mono;
Drop[] drops = new Drop[700];
void setup() {
  size(750, 750);
  smooth();
  background(0);
  for (int i = 0; i < drops.length; i++){
    drops[i] = new Drop(); 
  }
}

void draw() {
  mono = loadFont("Jaapokkisubtract-Regular-48.vlw");
  background(0);
  for (int i = 0; i < drops.length; i++){
     count = int(random(0,2));
     drops[i].fall();
     drops[i].show(i,count);
  } //<>//
}

class Drop{
  float x = random(width); 
  float y = random(-500,-50); 
  float z = random(0,20);
  float len = map(z,0,20,10,20); 
  float yspeed = map(z,0,20,4,10); 

  void fall(){
    y = y+ yspeed;
    float grav = map(z, 0,20,0,0.05);
    yspeed = yspeed + grav;  
    
    if (y > height) {
      y = random(-200,-100); 
      yspeed = map(z,0,20,4,10);
    }
  }
  
  void show(int i,int count) {
    float thick = map(z,0,50,1,3); 
    strokeWeight(thick);
    textFont(mono, 15);
    if(count == 0 ){
      fill(96, 229, 159);
    }else{
      fill(28, 166, 66);
    }
    if(i%2 == 0 ){
      text("1\n0", x, y); 
    }else{
      text("0\n1", x, y); 
    }


  }
}
