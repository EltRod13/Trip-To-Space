void Rocket_Flying(){
  frameRate(60);
for(int n = 0; n < 2; n++){
    image(bg[n], -xpos[n], ypos[n]);              // Draw the two background images
    image(bg[n], bg[n].width-xpos[n], ypos[n]);   // With wrap-around.
    xpos[n] = (xpos[n] + rate[n]) % bg[n].width;  // Each plane scrolls at its own rate
  }
  image(Rocket, xdir[0],ydir[0]);
  float newY=pos.y+ydir[0]*yspeed;                // Move character along y direction
  pos.set(pos.x, newY);                           
  keyPressedrocket();
 }
void keyPressedrocket() {
 
  if (key=='w'||key=='W') {                       // Rocket moves upward when "W" is clicked
    ydir[0]=ydir[0] - 2.0;    
  } else   
  if (key=='s'||key=='S') {                       // Rocket moves downward when "S" is clicked
    ydir[0]= ydir[0] + 2.0;  
  }
  if(ydir[0]>230)                                 // This condition is there to make sure that rocket will not go out of screen 
  ydir[0]=230;
  if(ydir[0]<-80)
  ydir[0]=-80;
} 
