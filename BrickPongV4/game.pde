void game() {
  image(bgImage, width/2, height/2);

  for (int i = 0; i < brickColumns; i++) {
    for (int j = 0; j < brickRows; j++) {
      Brick b = myBricks.get(i*brickRows + j); // Getting brick
      b.x = 64 * i + 32; // Positioning based on I and J
      b.y = 32 * j + 32;
      b.currentBrickImage = brickRows-j-1; // Purple for top row, red for bottom.
      b.show();
      b.act();
    }
  }

  for (int j = 0; j < myPowerups.size(); j++) { // Looping through all powerups
    objectPowerup = myPowerups.get(j);
    objectPowerup.show();
    objectPowerup.act();
    if (objectPowerup.lives == 0) myPowerups.remove(j);
  }


  for (int k = 0; k < myBalls.size(); k++) { // Looping through all balls
    objectBall3 = myBalls.get(k);
    objectBall3.show();
    objectBall3.act();
    if (objectBall3.lives == 0) myBalls.remove(k);
  }

  if (bricksAlive == 0) mode = GAMEDONE;
  if (myBalls.size() == 0) mode = GAMEOVER;

  myPaddle.show();
  myPaddle.act();
}
