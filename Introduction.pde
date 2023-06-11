void introduction()
{
background(0);                                             // Background Position
   fill(255);                                              // Background colour is black
   textSize(70);                                           // Text Size
   text("A Trip to Space and back", 220, 150, 600,10000);  // Text to be displayed
   if(millis() > time_to_end_instructions){                // Condition to display instruction if true
     displayinstruction = false; 
   }
}
