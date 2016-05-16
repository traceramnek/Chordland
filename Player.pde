/**
  * Player.pde    
  * Christopher Menedes, Kwan Holloway, Renee Esses
  * Game Design
  * Professor Kletenik
  */

class Player {
    PImage playerImg;  
    PVector pos; // position of player
    Guitar guitar; // guitar of the player
    int sizeWid = 45;
    int sizeHgt = 95;
    int speed = 5;
    int vel = 5;
    boolean moveLeft = false;
    boolean moveRight = false;
    
    //constructor set player position to bottom center of screen, 
    // creates a guitar at the bottom center of itself
    Player(){
      pos = new PVector(width/2 - sizeWid, height -sizeHgt); 
      guitar = new Guitar(new PVector(getCenterX(), getCenterY()));  
      playerImg = loadImage("KazukiChordland.png");
    }
    
    //Sets Velocity based on conditional statements
    void setVelocity(){
      //set velocity
      if(moveLeft && !moveRight){
        vel = -speed;
      }
      else if(moveRight && !moveLeft){
        vel = speed;      
      }
      else{
        vel = 0;
      }
    }
    
    void updatePos(){ // updates the position of the player
      //move by velocity
      pos.x += vel;
      //clamp to screen boundary
      pos.x = max(pos.x, 0);
      pos.x = min(pos.x, width - sizeWid);
    }
    
    float getCenterX(){ // gets center x value of player
      //println(pos.x + "is posx");
      return pos.x + sizeWid/2;
    }
    
    float getCenterY(){ // gets center y value of player
      return pos.y + sizeHgt/2;
    }

    //shoots a bullet in the direction of the guitar
    void shoot(){ 
      bullets.add(new Bullet(guitar.getEndX(), guitar.getEndY(), guitar.direction.x, guitar.direction.y));
    }
    
    //draws the player and updates its position based on value of moveLeft and moveRight
    void draw() {
      setVelocity();
      updatePos();
      //draw
      imageMode(CORNER);
      image(playerImg,pos.x,pos.y,sizeWid, sizeHgt);
      guitar.draw();
    } // end of draw()
    
}