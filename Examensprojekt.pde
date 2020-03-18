//Deklerer 2D objekt arrayet
Offer [][] verden;

int vB = 136;
int vH = 76;
int p = 2;
boolean started = false;

void setup() {
  size(1366, 768);
  frameRate(60);
  //Sætter størrelsen for verdenen
  verden = new Offer[vB][vH];
  //Initialliserer alle ofre
  for (int i=0; i < vB; i++) {
    for (int j=0; j < vH; j++) {
      verden[i][j] = new Offer();
    }
  }
}

void draw() {
    for (int i=0; i < vB; i++) {
    for (int j=0; j < vH; j++) {
      verden[i][j].display(i,j) ;
    }
  }
  
      for (int i=0; i < vB; i++) {
    for (int j=0; j < vH; j++) {
      verden[i][j].smit(i,j) ;
    }
  }
  if(millis()>3000 & !started){
    verden[int(random(0,vB))][int(random(0,vH))].smittet = true;
    started = true;
  }
 println(started);
 println(frameRate);
}

class Offer {
  int ticket = 0;
  boolean smittet = false;
  //kode der muliggør pæne ofre i fremtiden

  Offer() {
  }

  void smit( int pladsX, int pladsY) {
    if (pladsX+1 < vB){
      if(verden[pladsX+1][pladsY].smittet == true) ticket ++;
    }
    if (pladsY+1 < vH){
      if(verden[pladsX][pladsY+1].smittet == true) ticket ++;
    }
    if (pladsX > 0){
      if(verden[pladsX-1][pladsY].smittet == true)   ticket ++;
    }
    if (pladsY > 0){
      if(verden[pladsX][pladsY-1].smittet == true)   ticket ++;
    }
    
    
    for (; ticket > 0; ticket --) {
      if (testMyLuck() == true) {
        smittet = true;
      }
    }
  }
void display(int pladsX, int pladsY){
  if(smittet){
    fill(#F6FF05); 
  } else{ fill(0);}
  
  rectMode(CENTER);
  noStroke();
  rect((width*pladsX+(width/2))/(vB+1), (height*pladsY+(height/2))/(vH+1),10,10);


}

boolean testMyLuck() {
  return random(1, 100) <= p;
}
}
