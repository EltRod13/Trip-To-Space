void astronaut_portal(){
    frameRate(15); 
    image(bg[5], -xpos[5], ypos[5]);                      // Draw the background image
    if(xdir[2]<490){
      image(astronautwalkingframes[counter], xdir[2], 0); // Position of the astronaut walking
      counter=(counter+1)%6;
    }
      keyPressedastronautportal();
}
void keyPressedastronautportal() {
  if (key=='a'||key=='A') {                               // Astronaut moves left when "A" is clicked
    xdir[2]=xdir[2] - 4.0;    
  } else   
  if (key=='d'||key=='D') {                               // Astronaut moves left when "D" is clicked
    xdir[2]= xdir[2] + 4.0;  
  }
 if(xdir[2]>930)                                          // This condition is there to make sure that astronaut will not go out of screen  
  xdir[2]=930;
  if(xdir[2]<-30)
   xdir[2]=-30;
    if(xdir[2]>490 && xdir[2]<800){
      if(spaceMusic.isPlaying())
        spaceMusic.pause();
      if(!portalSound.isPlaying())  
      portalSound.play();  
      image(bg[6], -xpos[6], ypos[6]);                    // Draw the background image
      image(bg[6], bg[6].width-xpos[6], ypos[6]);         // with wrap-around.
      xpos[6] = (xpos[6] + rate[6]) % bg[6].width;        // Scrolls at its own rate
      
     } 
}
  
