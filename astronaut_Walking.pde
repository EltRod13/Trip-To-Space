void astronaut_Walking(){
    frameRate(15);
    for(int n = 3; n < 5; n++){
    image(bg[n], -xpos[n], ypos[n]);                    // Draw the four background images
    image(bg[n], bg[n].width-xpos[n], ypos[n]);         // with wrap-around.
    xpos[n] = (xpos[n] + rate[n]) % bg[n].width;        // Each plane scrolls at its own rate
  }  
    image(astronautwalkingframes[counter], xdir[1], 0); // Size of the astronaut walking
    counter=(counter+1)%6;
    keyPressedastronaut();
}

void keyPressedastronaut() {
  
  if (key=='a'||key=='A') {                              // Astronaut moves left when "A" is clicked
    xdir[1]=xdir[1] - 4.0;    
  } else   
  if (key=='d'||key=='D') {                              // Astronaut moves right when "D" is clicked
    xdir[1]= xdir[1] + 4.0;  
  }
  if(xdir[1]>930)                                        // This condition is there to make sure that astronaut will not go out of screen 
  xdir[1]=930;
  if(xdir[1]<-30)
  xdir[1]=-30;
} 
