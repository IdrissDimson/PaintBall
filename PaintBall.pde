int screenh=540;
int screenw=360;
int points=0;
int choice=0;
float ballsize;
int clk=0;
int clrv;
float Timer=0;
float sc=1;
PImage a;
PImage b;
PImage c;
PImage d;
PImage e;
boolean randomClrGen=false;
boolean bd=false;
boolean dead=false;
color bclr;
String mode="Menu";
class menuButton {
  float x,y,w,h;
  String txt,loc,dm;
  color clr,fntclr;
  menuButton(int x, int y, int w, int h, String txt, String loc, color clr, color fntclr,String dm){
    this.x=x;
    this.y=y;
    this.w=w;
    this.h=h;
    this.txt=txt;
    this.loc=loc;
    this.clr=clr;
    this.fntclr=fntclr;
    this.dm=dm;
    
  }
  boolean checkpressed(){
     if(mouseX>this.x&&mouseY>this.y&&mouseX<this.x+w&&mouseY<this.y+h){
       return true;
     } else {
       return false;
     }
 }
  
  
  
  void draw(){
    frameRate(0);
 
  fill(this.clr);
  rect(this.x,this.y,this.w,this.h);
  fill(this.fntclr);
  textAlign(CENTER,CENTER);
  textSize(0.5*h);
  text(this.txt,this.x,this.y,this.w,this.h);
  }
  
  
  void update(){
    //print(this.x+" ");
    //print(clk);
  if(mouseX>this.x&&mouseY>this.y&&mouseX<this.x+w&&mouseY<this.y+h&&clk!=0&&this.dm==mode){
    mode=this.loc;
    clk=0;
    print(3);
 }
  }

}
menuButton play;
menuButton options;
menuButton retry;

void setup(){//run once
  size(screenw,screenh);
  ballsize=10;
  points=0;
  a=loadImage("Blue1.png");
  b=loadImage("Red1.png");
  c=loadImage("Yellow1.png");
  d=loadImage("Green1.png");
  e=loadImage("Background.png");
  play = new menuButton(100,100,100,100,"Play","Menu",color(0,255,0),255,mode);
}

void draw(){
  play.update();  
  
if(mode=="Menu"){
  image(e,0,0);
  play.draw();

}
if(mode=="GS"){
  image(e,0,0);
  dead=false;
  randomClrGen=false;
  bd=false;
  points=0;
  sc=1;
  clk=0;
  choice=0;
  mode="Game";
}
if(mode=="Game"){
 // frameRate(10);
image(e,0,0); 
image(a,315,0);
image(b,0,0);
image(c,0,0);
image(d,0,495);
if(randomClrGen==false){
  clrv=round(random(1,4));
  randomClrGen=true;
}
if(clrv==1){
  bclr=color(255,80,64);
}
if(clrv==2){
  bclr=color(42,216,158);
}
if(clrv==3){
  bclr=color(77,166,255);
}
if(clrv==4){
  bclr=color(229,230,50);
}
if(bd==false){
  fill(bclr);
  ellipse(screenw/2,screenh/2,ballsize,ballsize);

}
if(dead==false){
ballsize=ballsize+sc;
}
if(ballsize+10>=(sc+19)*5){
dead=true;
mode="Menu";
}
fill(255);
textSize(20);
text("Score:"+points,screenw/2-40,40);
if(mouseX<45&&mouseY>45&&mouseY<495&&clk==1&&clrv==4){
  choice=4;
  clk=0;
}
if(mouseX>45&&mouseY<45&&mouseX<315&&clk==1&&clrv==1){
  choice=1;
  clk=0;
}
if(mouseX>315&&mouseY>45&&mouseY<495&&clk==1&&clrv==3){
  choice=3;
  clk=0;
}
if(mouseX>45&&mouseY>495&&mouseX<315&&clk==1&&clrv==2){
  choice=2;
  clk=0;
}
if(choice>0&&choice==clrv){
  Timer=0;
  ballsize=10;
  clk=0;
  points=points+1;
  print(points);
  sc=sc+1;
  randomClrGen=false;
  choice=0;
}
if(choice>0&&choice!=clrv){
  mode="Menu";
  dead=true;
}
}
loop();
}

void mouseClicked(){
clk=1;
};
