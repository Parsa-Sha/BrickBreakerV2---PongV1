class Ball {
  float bx, by, bd;
  int lives;
  PVector bv;
  
  Ball() {
    bx = width/2;
    by = height/2;
    bv = new PVector (random(-1, 1), random(2, 4));
    bd = 16;
  }
  
  Ball(float ballX, float ballY, PVector ballV) {
    bx = ballX;
    by = ballY;
    bv = new PVector (random(-1, 1), random(2, 4));
    bd = 16;
  }
  
  void show() {
    image(ballImage, bx, by);
  }
  
  void act() {
    bx = bx + bv.x; // Acceleration
    by = by + bv.y;
    
    if(bx < bd/2 || bx > width-bd/2){ // Bouncing off walls
      bv.x = -bv.x;
    }
    
    if(by < bd/2){ // Bouncing off ceiling
      bv.y = -bv.y;
    }
    
    if(by > height-bd/2) { // If game has lost
      bx = width/2;
      by = height/2;
      bv.x = 0;
      bv.y = 3;
      lives--;
    }
    
    /*
    
    if (lives == 0) myBalls
    
    */
    
    if(by + bd/2 > myPaddle.y - myPaddle.paddleHeight && by + bd/2 < myPaddle.y && myPaddle.x + myPaddle.paddleWidth >= bx && myPaddle.x - myPaddle.paddleWidth <= bx) { // Paddle bounding
      bv.y = ( (by) - (myPaddle.y) ) * 0.25;
      bv.x = ( (bx) - (myPaddle.x) ) * (0.25 * min(1, max( 0, abs( bx - myPaddle.x ) / (myPaddle.paddleWidth / 2) ) ) ); // Big old formula which calculates angle and speed based on distance to edge of paddle
    }
  }
}
