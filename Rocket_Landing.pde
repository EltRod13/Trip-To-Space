void Rocket_Landing(){
    image(bg[2], -xpos[2], ypos[2]);              // Draw the background image
    image(bg[2], bg[2].width-xpos[2], ypos[2]);   // with wrap-around.
    xpos[2] = (xpos[2] + rate[2]) % bg[2].width;  // Which scrolls at its own rate

 if(frameCount>1600)
 {
  frameRate(7);
  offset = offset + 1;                            
  if(offset<13)
   {
    image(rocketLandingframes[offset], 0, 0);     // Draw animated walking cat sprite
     offset = offset%13;
   }
    else
    pauseFrame();
      
 }
}  
