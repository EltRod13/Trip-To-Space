void astronaut_earth(){
 frameRate(13); 
 image(bg[7], -xpos[7], ypos[7]);                         // Draw the background image
 image(bg[7], bg[7].width-xpos[7], ypos[7]);              // with wrap-around.
 
 if(xdir[4]>15){
   if(portalSound.isPlaying())
     portalSound.pause();   
   if(!bgMusic.isPlaying())
     bgMusic.play();
   xpos[7] = (xpos[7] + rate[7]) % bg[7].width;           // Each plane scrolls at its own rate
      image(astronautwalkingframes[counter], xdir[4], 0); // Position of the Astronaut walking
      counter=(counter+1)%6;
    }
      keyPressedastronautearth();
      
}
void keyPressedastronautearth() {
  if (key=='a'||key=='A') {                               // Astronaut moves left when "A" is clicked
    xdir[3]=xdir[3] - 4.0;
    xdir[4]=xdir[4] - 4.0; 
  } else   
  if (key=='d'||key=='D') {                               // Astronaut moves right when "D" is clicked
    xdir[3]= xdir[3] + 4.0; 
    xdir[4]= xdir[4] + 4.0;
  }

   if(xdir[3]>20){
    xdir[3]=30;   
   }
 if(xdir[4]>930)                                          // This condition is there to make sure that astronaut will not go out of screen  
  xdir[4]=930;
  if(xdir[4]<-30)
   xdir[4]=-30;
    if(xdir[3]>10 && xdir[3]<20){
      pauseFrame();  
      image(bg[6], -xpor, ypos[6]);                       // Draw the background image
      image(bg[6], bg[6].width-xpor, ypos[6]);            // with wrap-around.
      xpor = (xpor + rate[6]) % bg[6].width;              // Scrolls at its own rate
  }
  if(frameCount==2550)
  {
   pauseFrame();
  }
}
