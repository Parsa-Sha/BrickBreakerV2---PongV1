class Powerup {
  float x, y;
  float vx, vy;
  float size;
  int powerupType;

  Powerup() {
    x = 0;
    y = 0;
    size = 30;
    powerupType = 0;
  }

  Powerup(float px, float py, int pt) {
    x = px;
    y = py;
    size = 30;
    powerupType = pt;
  }

  void show() {
    image(powerupImages[currentPowerup], x, y);
  }

  void act() {
    x += vx;
    y += vy;

    if (x < size || x > width-size) {
      vx *= -1;
    }
  }
}
