class Hero {
  // position on screen
  PVector position;
  // position on board
  int cellX, cellY;
  float size;
  PVector dir;

  Hero(int x, int y) {
    cellX = x;
    cellY = y;
    position = new PVector(board.getCellCenter(x, y).x, board.getCellCenter(x, y).y);
    size = board.cellSize;
    dir = new PVector(cellX, cellY);
  }

  void lauchMove() {
    if (appearance == 0) {

      // direction devant
      if (direction == 'f') {
        // si case suivante pas un mur
        if ((board.cells[cellY-1][cellX] != TypeCell.GATE) && (board.cells[cellY-1][cellX] != TypeCell.WALL) && (board.cells[cellY-1][cellX] != TypeCell.EMPTY)) {

          // si case suivante dot ou super dot
          if (board.cells[cellY-1][cellX] == TypeCell.DOT) {
            partie.score += SCORE_DOT;
            nbDots -= 1;
          } else if (board.cells[cellY-1][cellX] == TypeCell.SUPER_DOT) {
            partie.score += SCORE_SUPER_DOT;
            nbDots -= 1;
            boosted = true;
            timer = millis()+5000;
          } else if (board.cells[cellY-1][cellX] == TypeCell.BONUS) {
            // bonus ajoute 500pts et remet un delai de 15s avant qu'un autre apparaisse
            partie.score += SCORE_BONUS;
            tBonus = millis() + 15000;
            bonusX = random(board.nbCellsX);
            bonusY = random(board.nbCellsY);
            posX = int(bonusX);
            posY = int(bonusY);
          }
          dir = new PVector(cellX, cellY-1);
          board.cells[cellY-1][cellX] = TypeCell.PACMAN;
          board.cells[cellY][cellX] = TypeCell.PATH;
        }
      }

      // direction derriere
      else if (direction == 'b') {
        // si case suivante pas un mur
        if ((board.cells[cellY+1][cellX] != TypeCell.GATE) && (board.cells[cellY+1][cellX] != TypeCell.WALL) && (board.cells[cellY+1][cellX] != TypeCell.EMPTY)) {

          // si case suivante dot ou super dot
          if (board.cells[cellY+1][cellX] == TypeCell.DOT) {
            partie.score += SCORE_DOT;
            nbDots -= 1;
          } else if (board.cells[cellY+1][cellX] == TypeCell.SUPER_DOT) {
            partie.score += SCORE_SUPER_DOT;
            nbDots -= 1;
            boosted = true;
            timer = millis()+5000;
          } else if (board.cells[cellY+1][cellX] == TypeCell.BONUS) {
            // bonus ajoute 500pts et remet un delai de 15s avant qu'un autre apparaisse
            partie.score += SCORE_BONUS;
            tBonus = millis() + 15000;
            bonusX = random(board.nbCellsX);
            bonusY = random(board.nbCellsY);
            posX = int(bonusX);
            posY = int(bonusY);
          }
          dir = new PVector(cellX, cellY+1);
          board.cells[cellY+1][cellX] = TypeCell.PACMAN;
          board.cells[cellY][cellX] = TypeCell.PATH;
        }
      }

      // direction gauche
      else if (direction == 'l') {
        if (cellX-1 <0) {
          // si case suivante dot ou super dot
          if (board.cells[cellY][board.nbCellsX-1] == TypeCell.DOT) {
            partie.score += SCORE_DOT;
            nbDots -= 1;
          } else if (board.cells[cellY][board.nbCellsX-1] == TypeCell.SUPER_DOT) {
            partie.score += SCORE_SUPER_DOT;
            nbDots -= 1;
            boosted = true;
            timer = millis()+5000;
          } else if (board.cells[cellY][board.nbCellsX-1] == TypeCell.BONUS) {
            // bonus ajoute 500pts et remet un delai de 15s avant qu'un autre apparaisse
            partie.score += SCORE_BONUS;
            tBonus = millis() + 15000;
            bonusX = random(board.nbCellsX);
            bonusY = random(board.nbCellsY);
            posX = int(bonusX);
            posY = int(bonusY);
          }
          dir = new PVector(board.nbCellsX-1, cellY);
          board.cells[cellY][board.nbCellsX-1] = TypeCell.PACMAN;
          board.cells[cellY][cellX] = TypeCell.PATH;
        }
        // si case suivante pas un mur
        else if ((board.cells[cellY][cellX-1] != TypeCell.GATE) && (board.cells[cellY][cellX-1] != TypeCell.WALL) && (board.cells[cellY][cellX-1] != TypeCell.EMPTY)) {

          // si case suivante dot ou super dot
          if (board.cells[cellY][cellX-1] == TypeCell.DOT) {
            partie.score += SCORE_DOT;
            nbDots -= 1;
          } else if (board.cells[cellY][cellX-1] == TypeCell.SUPER_DOT) {
            partie.score += SCORE_SUPER_DOT;
            nbDots -= 1;
            boosted = true;
            timer = millis()+5000;
          } else if (board.cells[cellY][cellX-1] == TypeCell.BONUS) {
            // bonus ajoute 500pts et remet un delai de 15s avant qu'un autre apparaisse
            partie.score += SCORE_BONUS;
            tBonus = millis() + 15000;
            bonusX = random(board.nbCellsX);
            bonusY = random(board.nbCellsY);
            posX = int(bonusX);
            posY = int(bonusY);
          }
          dir = new PVector(cellX-1, cellY);
          board.cells[cellY][cellX-1] = TypeCell.PACMAN;
          board.cells[cellY][cellX] = TypeCell.PATH;
        }
      }

      // direction droite
      else if (direction == 'r') {
        if (cellX+1 == board.nbCellsX) {
          // si case suivante dot ou super dot
          if (board.cells[cellY][0] == TypeCell.DOT) {
            partie.score += SCORE_DOT;
            nbDots -= 1;
          } else if (board.cells[cellY][0] == TypeCell.SUPER_DOT) {
            partie.score += SCORE_SUPER_DOT;
            nbDots -= 1;
            boosted = true;
            timer = millis()+5000;
          } else if (board.cells[cellY][0] == TypeCell.BONUS) {
            // bonus ajoute 500pts et remet un delai de 15s avant qu'un autre apparaisse
            partie.score += SCORE_BONUS;
            tBonus = millis() + 15000;
            bonusX = random(board.nbCellsX);
            bonusY = random(board.nbCellsY);
            posX = int(bonusX);
            posY = int(bonusY);
          }
          dir = new PVector(0, cellY);
          board.cells[cellY][0] = TypeCell.PACMAN;
          board.cells[cellY][cellX] = TypeCell.PATH;
        }
        // si case suivante pas un mur
        else if ((board.cells[cellY][cellX+1] != TypeCell.GATE) && (board.cells[cellY][cellX+1] != TypeCell.WALL) && (board.cells[cellY][cellX+1] != TypeCell.EMPTY)) {
          // si case suivante dot ou super dot
          if (board.cells[cellY][cellX+1] == TypeCell.DOT) {
            partie.score += SCORE_DOT;
            nbDots -= 1;
          } else if (board.cells[cellY][cellX+1] == TypeCell.SUPER_DOT) {
            partie.score += SCORE_SUPER_DOT;
            nbDots -= 1;
            boosted = true;
            timer = millis()+5000;
          } else if (board.cells[cellY][cellX+1] == TypeCell.BONUS) {
            // bonus ajoute 500pts et remet un delai de 15s avant qu'un autre apparaisse
            partie.score += SCORE_BONUS;
            tBonus = millis() + 15000;
            bonusX = random(board.nbCellsX);
            bonusY = random(board.nbCellsY);
            posX = int(bonusX);
            posY = int(bonusY);
          }
          dir = new PVector(cellX+1, cellY);
          board.cells[cellY][cellX+1] = TypeCell.PACMAN;
          board.cells[cellY][cellX] = TypeCell.PATH;
        }
      }
    }
  }

  void move() {
    // haut
    if ((key == 'Z') || (key == 'z') || (key == CODED && keyCode == UP) && isMenu == false) {
      directionFutur = 1;
    }

    // bas
    else if ((key == 'S') || (key == 's') || (key == CODED && keyCode == DOWN) && isMenu == false) {
      directionFutur = 4;
    }

    // gauche
    else if ((key == 'Q') || (key == 'q') || (key == CODED && keyCode == LEFT) && isMenu == false) {
      directionFutur = 2;
    }

    // droite
    else if ((key == 'D') || (key == 'd') || (key == CODED && keyCode == RIGHT) && isMenu == false) {
      directionFutur = 3;
    }
  }

  void update() {
    if (directionFutur == 1 && (board.cells[cellY-1][cellX] != TypeCell.WALL) && (board.cells[cellY-1][cellX] != TypeCell.EMPTY)) {
      direction = 'f';
    } else if (directionFutur == 4 && (board.cells[cellY+1][cellX] != TypeCell.WALL) && (board.cells[cellY+1][cellX] != TypeCell.EMPTY)) {
      direction = 'b';
    } else if (directionFutur == 2 && cellX-1 <0) {
      direction = 'l';
    } else if (directionFutur == 2 && (board.cells[cellY][cellX-1] != TypeCell.WALL) && (board.cells[cellY][cellX-1] != TypeCell.EMPTY)) {
      direction = 'l';
    } else if (directionFutur == 3 && cellX+1 == board.nbCellsX) {
      direction = 'r';
    } else if (directionFutur == 3 && (board.cells[cellY][cellX+1] != TypeCell.WALL) && (board.cells[cellY][cellX+1] != TypeCell.EMPTY)) {
      direction = 'r';
    }
  }

  void drawIt() {
    imageMode(CENTER);
    if (lost == false) {
      if (direction == 'i') {
        image(pacmanFull, position.x, position.y, size, size);
      } else if (direction == 'l') {
        if (millis() > pacAnim*2) {
          image(pacmanLeftUp, position.x, position.y, size, size);
          if (millis() > (pacAnim*2)+300) {
            pacAnim += 300;
          }
        } else if (millis() > blinkTimer) {
          image(pacmanLeft, position.x, position.y, size, size);
        }
      } else if (direction == 'r') {
        if (millis() > pacAnim*2) {
          image(pacmanRightUp, position.x, position.y, size, size);
          if (millis() > (pacAnim*2)+300) {
            pacAnim += 300;
          }
        } else if (millis() > blinkTimer) {
          image(pacmanRight, position.x, position.y, size, size);
        }
      } else if (direction == 'b') {
        if (millis() > pacAnim*2) {
          image(pacmanDownUp, position.x, position.y, size, size);
          if (millis() > (pacAnim*2)+300) {
            pacAnim += 300;
          }
        } else if (millis() > blinkTimer) {
          image(pacmanDown, position.x, position.y, size, size);
        }
      } else if (direction == 'f') {
        if (millis() > pacAnim*2) {
          image(pacmanUpUp, position.x, position.y, size, size);
          if (millis() > (pacAnim*2)+300) {
            pacAnim += 300;
          }
        } else if (millis() > blinkTimer) {
          image(pacmanUp, position.x, position.y, size, size);
        }
      }
    } else {
      if (appearance > 12) {
      } else if (appearance > 11) {
        image(pac11, position.x, position.y, size, size);
      } else if (appearance > 10) {
        image(pac10, position.x, position.y, size, size);
      } else if (appearance > 9) {
        image(pac9, position.x, position.y, size, size);
      } else if (appearance > 8) {
        image(pac8, position.x, position.y, size, size);
      } else if (appearance > 7) {
        image(pac7, position.x, position.y, size, size);
      } else if (appearance > 6) {
        image(pac6, position.x, position.y, size, size);
      } else if (appearance > 5) {
        image(pac5, position.x, position.y, size, size);
      } else if (appearance > 4) {
        image(pac4, position.x, position.y, size, size);
      } else if (appearance > 3) {
        image(pac3, position.x, position.y, size, size);
      } else if (appearance > 2) {
        image(pac2, position.x, position.y, size, size);
      } else if (appearance > 1) {
        image(pac1, position.x, position.y, size, size);
      }
    }
  }
}
