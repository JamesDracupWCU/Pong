float x,y,w,h,sx,sy,paddlex,paddley,paddlex1,paddley1,paddlew,paddleh,paddles1,paddles2;
boolean upL,downL,upR,downR;
int scorel=0,scorer=0,winscore=5;
void setup(){
  size(600,500);
  background(255);
  x=width/2;
  y=height/2;
  w=30; h=30; sx=3; sy=3;
  paddlex=width/2-280; 
  paddley=height/2;
  paddlew=20; paddleh=50; paddles1=5; paddles2=5;
  paddlex1=width/2+260; 
  paddley1=height/2; 
  noStroke();
  textSize(40);
  frameRate(50);
}
void draw(){
  background(255);
  fill(255,0,0);
  ellipse(x,y,w,h);
  x=x+sx;
  y=y+sy;
  if (x+w/2>width){
    x=width/2;
    y=height/2;
    sx=-sx;
    sy=-sy;
    scorel=scorel+1;
  }
   else if (x-w/2<0){
    x=width/2;
    y=height/2;
    sx=-sx;
    scorer=scorer+1;
  }     
  if ((y>height-h/2)||(y<0+h/2)){ 
      sy=-sy;   
  }
//Paddle 1 && Paddle2
 fill(0,255,0);
 rect(paddlex,paddley,paddlew,paddleh);
 fill(0,0,255);
 rect(paddlex1,paddley1,paddlew,paddleh);
 if(upL){
   paddley=paddley-paddles1;
 }else if(downL){
    paddley=paddley+paddles1;
   } 
   if (upR){
     paddley1=paddley1-paddles2;
     } else if (downR){
       paddley1=paddley1+paddles2;
       }
     if (paddley<0){
       paddley=paddley+paddles1;
     } else if (paddley>height-50){
         paddley=paddley-paddles1;
       } if (paddley1<0){
           paddley1=paddley1+paddles2;
         } else if (paddley1>height-50){
             paddley1=paddley1-paddles2;
           }
//Contact between paddles & ball
 if(x-(w/2)<paddlex+paddlew && y-(h/2)<paddley+paddleh && y-(h+5)>paddley-paddleh){
   //if (sx<0){                
     sx=-sx+.25;
     paddles1=paddles1+.25;
     paddles2=paddles2+.25;    
  // }
 }
   if(x-(w/2)>paddlex1-w && y-(h/2)<paddley1+paddleh && y-(h+5)>paddley1-paddleh){
     //if (sx>0){
      sx=-sx-.25;
     paddles1=paddles1+.25;
     paddles2=paddles2+.25; 
     //}
   }
//Gameover && Reset
 fill(0);
 text(scorer,width/2+100,50);
 text(scorel,width/2-100,50);
 textAlign(CENTER,CENTER);
 if(scorel==winscore){
   fill(0);
   text("Game Over",width/2,height/2-150);
   text("Click to play again",width/2,height/2-50);
   fill(0,255,0);
   text("Green Wins!",width/2,height/2-100);
   sx=0;
   sy=0;
 } else if(scorer==winscore){
   fill(0);
   text("Game Over",width/2,height/2-150);
   text("Click to play again",width/2,height/2-50);
   fill(0,0,255);
   text("Blue Wins!",width/2,height/2-100);
   sx=0;
   sy=0;
 }
 if(mousePressed){
   scorel=0;
   scorer=0;
   sx=3;
   sy=2;
   paddley=paddleh+200;
   paddley1=paddleh+200;
 }
}
void mousePressed(){
}
void keyPressed(){
  if (key=='w' || key=='W'){
    upL=true;
 }
     if (key=='s' || key=='S'){
        downL=true;
     }
     if (key=='i' || key=='I'){
        upR=true;
     }
    if (key=='j' || key=='J'){
         downR=true;
     }
}
void keyReleased(){
  if (key=='w' || key=='W'){
    upL=false;
  }
   if (key=='s' || key=='S'){
      downL=false;
   }
   if (key=='i' || key=='I'){
      upR=false;
   }
   if (key=='j' || key=='J'){
      downR=false;
   }
}
