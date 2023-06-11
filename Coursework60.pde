///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Student Number: 20021113                                                                                                /
//3D animation made using Processing based on the topic "Keele in Space"                                                  /
// The sketch uses a total of thirteen image files in the data folder:                                                    /
//    astronaut.png is a sprite sheet of  6 linear astronaut walking poses                                                /
//    portal.png is the drawing of a portal                                                                               / 
//    rocket.png is the drawing of a rocket                                                                               /
//    rocketlanding.png is a sprite sheet which animates a rocket landing                                                 /    
//    stars.png are scrolling stars which covers the whole screen                                                         /
//    starstrimmed.png are scrolling stars which are trimmed in order to show the planet properly                         / 
// Backgrounds:                                                                                                           / 
// backgroundnostars.png is a basic night sky background                                                                  /
// backgroundplanet.png is a background which has a planet as its base on which the astronaut walks                       /
// backgroundplanetflag.png is a background which has a tree planted by a representative from Keele University            /
// backgroundplanetstars.png is a background with stationary stars                                                        /
// backgroundrocket.png is a background which has a stationary rocket                                                     /
// keelebackground.png is the background of the astronaut back on Earth                                                   /
// keelebackgroundzoomed.png is the zoomed background of Earth                                                            /
// Background music used in this animation is Space Ambient Music and Relaxing music found through non-copyright sources  /
// Sound files used are rocket flying sound, rocket landing sound and Portal sound                                        /
// Credit file titled credit.txt is included in the data folder                                                           /
// Introduction is the introduction that plays at the start                                                               /
// Rocket_Flying is the scene of rocket flying through space                                                              /
// Rocket_Landing is the scene of rocket landing on the planet                                                            /
// astronaut_Walking is the scene of the astronaut walking                                                                /
// astronaut_earth is the scene of the astronaut on earth                                                                 /
// astronaut_portal is the scene of the astronaut walking into the portal                                                 /
// credits is the scene which has scrolling credits                                                                       /
// The sketch animates the stickman walking while layers of the background scroll at different speeds                     /                        
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

import processing.sound.*;                                // SoundFile is imported
SoundFile spaceMusic;                                     // Background music for the main animation
SoundFile bgMusic;                                        // Music played while the credits scroll
SoundFile rocketFly;                                      // Music played while the credits scroll
SoundFile rocketLand;                                     // Music played while the credits scroll
SoundFile portalSound;                                    // Music played while the credits scroll
PVector pos;                                              // Object to describe a two dimensional object and store position variables
float[] xdir= new float[5];                               // Movable direction given by x-y coordinates
float[] ydir= new float[5];                               // 
float yspeed=2;                                           // Speed of the y coordinate
int offset=0;                                             // array counter for the rocket landing sprite sheet
int counter=0;                                            // array counter for the astronaut walking sprite sheet
int DELAY = 5 * 1000;                                     // Time to freeze a specific frame on scree
int xpor;                                                 //
boolean displayinstruction;
int time_to_end_instructions;
String [] credits;
int[] xpos = new int[9];                                  // x-y coordinates of each background image
int[] ypos = new int[9];                                  //
int[] rate = new int[9];                                  // rate of each frame
PImage[] bg = new PImage[9];                              // To add the 9 backgrounds
PImage Rocket, rocketLanding, astronautwalking;
PImage[] rocketLandingframes= new PImage[13];
PImage[] astronautwalkingframes= new PImage[6];

void setup() {
  size(1000,500);
  time_to_end_instructions = millis() + 10000;            // To count the amount of time to end the instruction screen 
  credits = loadStrings("credit.txt");                    // Load credits
  spaceMusic = new SoundFile(this,"spacemusic.mp3");      // Load music that plays while the astronaut is in space
  bgMusic = new SoundFile(this,"earthmusic.mp3");         // Load music that plays while the astronaut is in Earth
  rocketFly = new SoundFile(this,"rocket.mp3");           // Load music that plays for the rocket flying
  rocketLand = new SoundFile(this,"rocketlanding.mp3");   // Load music that plays for the rocket landing
  portalSound = new SoundFile(this,"portalsound.mp3");    // Load music that plays when the astronaut enters the portal
  Rocket=loadImage("Rocket.png");                         // Load image of the rocket
  rocketLanding=loadImage("rocketlanding.png");           // Load sprite of the rocket landing
  astronautwalking=loadImage("astronaut.png");            // Load sprite of the astronaut walking
  bg[0] = loadImage("backgroundnostars.png");             // Load the eight backgrounds
  bg[1] = loadImage("stars.png");
  bg[2] = loadImage("backgroundplanetstars.png");
  bg[3] = loadImage("backgroundrocket.png");
  bg[4] = loadImage("starstrimmed.png");
  bg[5] = loadImage("backgroundplanetflag.png");
  bg[6] = loadImage("portal.png");
  bg[7] = loadImage("keelebackground.png");
  bg[8] = loadImage("keelebackgroundzoomed.png");
  ypos[0] = 0; rate[0] = 0;                               // Set y positions and scrolling rates
  ypos[1] = 10; rate[1] = 4;
  ypos[2] = 0; rate[2] = 0;
  ypos[3] = 0; rate[3] = 7;
  ypos[4] = 10; rate[4] = 9;
  ypos[5] = 0; rate[5] = 0; 
  ypos[6] = 60; rate[6] = 0; xpos[6]=850; xpor=50;        // Set x position
  ypos[7] = 0; rate[7] = 5; 
  ypos[8] = 0; rate[8] = 0;
  pos=new PVector(width/2, height/2);
  for(int n=0;n<13;n++){
    rocketLandingframes[n]=rocketLanding.get(n*rocketLanding.width/13,0,rocketLanding.width/13,rocketLanding.height);
  }                                                       // Divides the rocket landing sprite sheet to thirteen parts
  for(int m=0;m<6;m++){
    astronautwalkingframes[m]=astronautwalking.get(m*astronautwalking.width/6,0,astronautwalking.width/6,astronautwalking.height);
  }                                                       // Divides the rocket landing sprite sheet to thirteen parts
}

void pauseFrame() {
 delay(DELAY);                                            // To pause a specific frame                 
}

void draw(){ 
if(frameCount<300)  
 introduction();                                          // Introduction is called
 else
  if(frameCount<1300) 
  {
    if(!rocketFly.isPlaying())                            // If Rocket flying music is not playing, play rocket flying music
    rocketFly.play();
    Rocket_Flying();
  }
  else
   if(frameCount<1614)
   {
    if(rocketFly.isPlaying())                             // If Rocket flying music is playing, pause rocket flying music
     rocketFly.pause();
    if(!rocketLand.isPlaying())                           // If Rocket landing music is not playing, play rocket landing music
    rocketLand.play(); 
     Rocket_Landing();
   }
    else
     if(frameCount<1903)
     {
       if(rocketLand.isPlaying())                         // If Rocket landing music is playing, pause rocket landing music
         rocketLand.pause();
       if(!spaceMusic.isPlaying())                        // If space music is not playing, play space music  
        spaceMusic.play(); 
      astronaut_Walking();
     }
      else 
        if(frameCount<2200)
          astronaut_portal();                             
          else 
           
           if(frameCount<2551)
           {          
            astronaut_earth();
           }
            else
            if(frameCount<2553)
             {
              image(bg[8], -xpos[8], ypos[8]);  
              pauseFrame();
             }
             else
              credits(frameCount-2553);
   
}
