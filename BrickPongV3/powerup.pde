class Powerup {
  float x, y;
  float vx, vy;
  float size;
  int powerupType, lives;

  Powerup() {
    x = 0;
    y = 0;
    vx = 0;
    vy = 3;
    size = 30;
    powerupType = 0;
    lives = 1;
  }

  Powerup(float px, float py, int pt) {
    x = px;
    y = py;
    vx = 0;
    vy = 3;
    size = 30;
    powerupType = pt;
    lives = 1;
  }

  void show() {
    fill(255);
    strokeWeight(1);
    ellipse(x, y, size, size);
    // image(powerupImages[powerupType], x, y, size, size);
  }

  void act() {
    x += vx;
    y += vy;

    if (x < size || x > width-size) vx *= -1;
    
    if (y > height - size) lives--;

    if (dist(x, y, myPaddle.x, myPaddle.y) < size/2) {
      switch(powerupType) {
      case 0: // Three Split code
        for (int i = 0; i < myBalls.size(); i++) { // Loop through all the balls
          objectBall2 = myBalls.get(i);
          // rotate(objectBall2.bv, -0.2);
          myBalls.add(new Ball(objectBall2.bx, objectBall2.by, objectBall2.bv));
          // rotate(objectBall2.bv, 0.4);
          myBalls.add(new Ball(objectBall2.bx, objectBall2.by, objectBall2.bv));
        }
        break;
        
      case 1: // Multiball code
        myBalls.add(new Ball());
        myBalls.add(new Ball());
        break;
        
      case 2: // Paddle Widen code
        myPaddle.paddleWidth *= 4/3;
        break;
        
      case 3: // Paddle Shorten code
        myPaddle.paddleWidth *= 3/4;
        break;
        
      default: // If all else fails
        println("ERROR: UNIDENTIFIED POWERUP TYPE: " + powerupType);
      }

      lives--;
    }
  }
}
