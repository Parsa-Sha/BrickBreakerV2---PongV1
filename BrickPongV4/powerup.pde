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
    image(powerupImages[powerupType], x, y, size, size);
  }

  void act() {
    x += vx;
    y += vy;

    if (x < size || x > width-size) vx *= -1;

    if (y > height - size) lives--;

    if (dist(x, y, myPaddle.x, myPaddle.y) < size/2 + (myPaddle.paddleWidth + myPaddle.paddleHeight)/4) {

      switch(powerupType) {
      case 0: // Three Split code
        for (int i = myBalls.size()-1; i > -1; i--) { // Loop through all the balls
          objectBall2 = myBalls.get(i);
          
          objectBall2.bv.rotate(-0.2);
          myBalls.add(new Ball(objectBall2.bx, objectBall2.by, objectBall2.bv));
          
          objectBall2.bv.rotate(0.4);
          myBalls.add(new Ball(objectBall2.bx, objectBall2.by, objectBall2.bv));

          objectBall2.bv.rotate(-0.2);
        }
        break; // NOW WORKS :D

      case 1: // Multiball code
        myBalls.add(new Ball());
        myBalls.add(new Ball());
        break; // THIS WORKS :D

      case 2: // Paddle Widen code
        myPaddle.paddleWidth *= 4.0/3;
        break; // Paddle Widen works

      case 3: // Paddle Shorten code
        myPaddle.paddleWidth *= 3.0/4;
        break; // Paddle Shorten works

      default: // If all else fails
        println("ERROR: UNIDENTIFIED POWERUP TYPE: " + powerupType);
      }

      lives--;
    }
  }
}
