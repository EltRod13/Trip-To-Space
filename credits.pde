void credits(int fCount){
frameRate(35);                               //Adjusts the frame rate of the credits scene
  background(150,0,255);                     //Background colour
  fill(255,255,255);                         //Text colour
  textSize(35);
  textAlign(CENTER,CENTER);                  //Aligning the text to appear in the center of the screen
  for(int n=0; n<credits.length; n++) 
   text(credits[n],width/2,610-fCount+80*n); //Display the credits
}
