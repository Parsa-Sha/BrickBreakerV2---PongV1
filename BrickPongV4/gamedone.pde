void gamedone() {
  background(2, 70, 115);
  for (int i = 0; i < totalBricks; i++) { // Reset health of all bricks
    Brick b = myBricks.get(i);
    b.reset();
  }
  
  for (int j = 0; j < myPowerups.size(); j++) myPowerups.remove(j);
  
  fill(81, 211, 210);
  textSize(100);
  text("VICTORY!", width/2, height/2);
  textSize(40);
  text("PRESS ANYWHERE TO PLAY AGAIN", width/2, height/2 + 100);
  
  newGame = true;
  
  if (mousePressed) mode = INTRO;
}
