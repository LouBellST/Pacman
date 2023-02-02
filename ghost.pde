class Ghost {
  PVector position;
  // si le fantome est sorti de la cage ou pas
  float size;
  PImage col;
  int cellX, cellY;
  TypeCell self;

  Ghost(PImage _col, int x, int y) {
    col = _col;
    size = board.cellSize/1.2;
    position = new PVector(board.getCellCenter(x, y).x, board.getCellCenter(x, y).y);
    cellX = x;
    cellY = y;

    if (col == blue) {
      self = TypeCell.BLUE;
    } else if (col == red) {
      self = TypeCell.RED;
    } else if (col == orange) {
      self = TypeCell.ORANGE;
    } else if (col == pink) {
      self = TypeCell.PINK;
    }
  }

  void move(boolean become) {
    int targetX = pacman.cellX;
    int targetY = pacman.cellY;
    if (boosted == false) {
      // si le fantome est moins loin que pacman
      if (cellX < targetX) {
        // si le fantome est moins haut que pacman
        if (cellY < targetY) {
          if (board.cells[cellY+1][cellX] == TypeCell.DOT || board.cells[cellY+1][cellX] == TypeCell.SUPER_DOT
            || board.cells[cellY+1][cellX] == TypeCell.BONUS || board.cells[cellY+1][cellX] == TypeCell.PATH
            || board.cells[cellY+1][cellX] == TypeCell.PACMAN) {
            if (board.cells[cellY+1][cellX] != TypeCell.PACMAN) {
              if (board.cells[cellY+1][cellX] == TypeCell.DOT) {
                become = true;
              } else {
                become = false;
              }
            }
            if (become == true) {
              board.cells[cellY][cellX] = TypeCell.DOT;
            } else {
              board.cells[cellY][cellX] = TypeCell.PATH;
            }
            board.cells[cellY+1][cellX] = self;
          } else if (board.cells[cellY][cellX+1] == TypeCell.DOT || board.cells[cellY][cellX+1] == TypeCell.SUPER_DOT
            || board.cells[cellY][cellX+1] == TypeCell.BONUS || board.cells[cellY][cellX+1] == TypeCell.PATH
            || board.cells[cellY][cellX+1] == TypeCell.PACMAN) {

            if (board.cells[cellY][cellX+1] != TypeCell.PACMAN) {
              if (board.cells[cellY][cellX+1] == TypeCell.DOT) {
                become = true;
              } else {
                become = false;
              }
            }
            if (become == true) {
              board.cells[cellY][cellX] = TypeCell.DOT;
            } else {
              board.cells[cellY][cellX] = TypeCell.PATH;
            }

            board.cells[cellY][cellX+1] = self;
          } else if (board.cells[cellY-1][cellX] == TypeCell.DOT || board.cells[cellY-1][cellX] == TypeCell.SUPER_DOT
            || board.cells[cellY-1][cellX] == TypeCell.BONUS || board.cells[cellY-1][cellX] == TypeCell.PATH
            || board.cells[cellY-1][cellX] == TypeCell.PACMAN) {

            if (board.cells[cellY-1][cellX] != TypeCell.PACMAN) {
              if (board.cells[cellY-1][cellX] == TypeCell.DOT) {
                become = true;
              } else {
                become = false;
              }
            }
            if (become == true) {
              board.cells[cellY][cellX] = TypeCell.DOT;
            } else {
              board.cells[cellY][cellX] = TypeCell.PATH;
            }

            board.cells[cellY-1][cellX] = self;
          }
        }
        // si le fantome est plus haut que pacman
        else if (cellY > targetY) {
          if (board.cells[cellY-1][cellX] == TypeCell.DOT || board.cells[cellY-1][cellX] == TypeCell.SUPER_DOT
            || board.cells[cellY-1][cellX] == TypeCell.BONUS || board.cells[cellY-1][cellX] == TypeCell.PATH
            || board.cells[cellY-1][cellX] == TypeCell.PACMAN) {

            if (board.cells[cellY-1][cellX] != TypeCell.PACMAN) {
              if (board.cells[cellY-1][cellX] == TypeCell.DOT) {
                become = true;
              } else {
                become = false;
              }
            }
            if (become == true) {
              board.cells[cellY][cellX] = TypeCell.DOT;
            } else {
              board.cells[cellY][cellX] = TypeCell.PATH;
            }

            board.cells[cellY-1][cellX] = self;
          } else if (board.cells[cellY][cellX+1] == TypeCell.DOT || board.cells[cellY][cellX+1] == TypeCell.SUPER_DOT
            || board.cells[cellY][cellX+1] == TypeCell.BONUS || board.cells[cellY][cellX+1] == TypeCell.PATH
            || board.cells[cellY][cellX+1] == TypeCell.PACMAN) {

            if (board.cells[cellY][cellX+1] != TypeCell.PACMAN) {
              if (board.cells[cellY][cellX+1] == TypeCell.DOT) {
                become = true;
              } else {
                become = false;
              }
            }
            if (become == true) {
              board.cells[cellY][cellX] = TypeCell.DOT;
            } else {
              board.cells[cellY][cellX] = TypeCell.PATH;
            }

            board.cells[cellY][cellX+1] = self;
          } else if (board.cells[cellY+1][cellX] == TypeCell.DOT || board.cells[cellY+1][cellX] == TypeCell.SUPER_DOT
            || board.cells[cellY+1][cellX] == TypeCell.BONUS || board.cells[cellY+1][cellX] == TypeCell.PATH
            || board.cells[cellY+1][cellX] == TypeCell.PACMAN) {

            if (board.cells[cellY+1][cellX] != TypeCell.PACMAN) {
              if (board.cells[cellY+1][cellX] == TypeCell.DOT) {
                become = true;
              } else {
                become = false;
              }
            }
            if (become == true) {
              board.cells[cellY][cellX] = TypeCell.DOT;
            } else {
              board.cells[cellY][cellX] = TypeCell.PATH;
            }

            board.cells[cellY+1][cellX] = self;
          }
        }
        // si le fantome est aussi haut que pacman
        else if (cellY == targetY) {
          if (board.cells[cellY][cellX+1] == TypeCell.DOT || board.cells[cellY][cellX+1] == TypeCell.SUPER_DOT
            || board.cells[cellY][cellX+1] == TypeCell.BONUS || board.cells[cellY][cellX+1] == TypeCell.PATH
            || board.cells[cellY][cellX+1] == TypeCell.PACMAN) {

            if (board.cells[cellY][cellX+1] != TypeCell.PACMAN) {
              if (board.cells[cellY][cellX+1] == TypeCell.DOT) {
                become = true;
              } else {
                become = false;
              }
            }
            if (become == true) {
              board.cells[cellY][cellX] = TypeCell.DOT;
            } else {
              board.cells[cellY][cellX] = TypeCell.PATH;
            }

            board.cells[cellY][cellX+1] = self;
          } else if (board.cells[cellY-1][cellX] == TypeCell.DOT || board.cells[cellY-1][cellX] == TypeCell.SUPER_DOT
            || board.cells[cellY-1][cellX] == TypeCell.BONUS || board.cells[cellY-1][cellX] == TypeCell.PATH
            || board.cells[cellY-1][cellX] == TypeCell.PACMAN) {

            if (board.cells[cellY-1][cellX] != TypeCell.PACMAN) {
              if (board.cells[cellY-1][cellX] == TypeCell.DOT) {
                become = true;
              } else {
                become = false;
              }
            }
            if (become == true) {
              board.cells[cellY][cellX] = TypeCell.DOT;
            } else {
              board.cells[cellY][cellX] = TypeCell.PATH;
            }

            board.cells[cellY-1][cellX] = self;
          } else if (board.cells[cellY][cellX-1] == TypeCell.DOT || board.cells[cellY][cellX-1] == TypeCell.SUPER_DOT
            || board.cells[cellY][cellX-1] == TypeCell.BONUS || board.cells[cellY][cellX-1] == TypeCell.PATH
            || board.cells[cellY][cellX-1] == TypeCell.PACMAN) {

            if (board.cells[cellY][cellX-1] != TypeCell.PACMAN) {
              if (board.cells[cellY][cellX-1] == TypeCell.DOT) {
                become = true;
              } else {
                become = false;
              }
            }
            if (become == true) {
              board.cells[cellY][cellX] = TypeCell.DOT;
            } else {
              board.cells[cellY][cellX] = TypeCell.PATH;
            }

            board.cells[cellY][cellX-1] = self;
          } else if (board.cells[cellY+1][cellX] == TypeCell.DOT || board.cells[cellY+1][cellX] == TypeCell.SUPER_DOT
            || board.cells[cellY+1][cellX] == TypeCell.BONUS || board.cells[cellY+1][cellX] == TypeCell.PATH
            || board.cells[cellY+1][cellX] == TypeCell.PACMAN) {

            if (board.cells[cellY+1][cellX] != TypeCell.PACMAN) {
              if (board.cells[cellY+1][cellX] == TypeCell.DOT) {
                become = true;
              } else {
                become = false;
              }
            }
            if (become == true) {
              board.cells[cellY][cellX] = TypeCell.DOT;
            } else {
              board.cells[cellY][cellX] = TypeCell.PATH;
            }

            board.cells[cellY+1][cellX] = self;
          }
        }
      }
      // si le fantome est plus loin que pacman
      else if (cellX > targetX) {
        // si le fantome est moins haut que pacman
        if (cellY < targetY) {
          if (board.cells[cellY+1][cellX] == TypeCell.DOT || board.cells[cellY+1][cellX] == TypeCell.SUPER_DOT
            || board.cells[cellY+1][cellX] == TypeCell.BONUS || board.cells[cellY+1][cellX] == TypeCell.PATH
            | board.cells[cellY+1][cellX] == TypeCell.PACMAN) {

            if (board.cells[cellY+1][cellX] != TypeCell.PACMAN) {
              if (board.cells[cellY+1][cellX] == TypeCell.DOT) {
                become = true;
              } else {
                become = false;
              }
            }
            if (become == true) {
              board.cells[cellY][cellX] = TypeCell.DOT;
            } else {
              board.cells[cellY][cellX] = TypeCell.PATH;
            }

            board.cells[cellY+1][cellX] = self;
          } else if (board.cells[cellY][cellX-1] == TypeCell.DOT || board.cells[cellY][cellX-1] == TypeCell.SUPER_DOT
            || board.cells[cellY][cellX-1] == TypeCell.BONUS || board.cells[cellY][cellX-1] == TypeCell.PATH
            || board.cells[cellY][cellX-1] == TypeCell.PACMAN) {

            if (board.cells[cellY][cellX-1] != TypeCell.PACMAN) {
              if (board.cells[cellY][cellX-1] == TypeCell.DOT) {
                become = true;
              } else {
                become = false;
              }
            }
            if (become == true) {
              board.cells[cellY][cellX] = TypeCell.DOT;
            } else {
              board.cells[cellY][cellX] = TypeCell.PATH;
            }

            board.cells[cellY][cellX-1] = self;
          } else if (board.cells[cellY-1][cellX] == TypeCell.DOT || board.cells[cellY-1][cellX] == TypeCell.SUPER_DOT
            || board.cells[cellY-1][cellX] == TypeCell.BONUS || board.cells[cellY-1][cellX] == TypeCell.PATH
            || board.cells[cellY-1][cellX] == TypeCell.PACMAN) {

            if (board.cells[cellY-1][cellX] != TypeCell.PACMAN) {
              if (board.cells[cellY-1][cellX] == TypeCell.DOT) {
                become = true;
              } else {
                become = false;
              }
            }
            if (become == true) {
              board.cells[cellY][cellX] = TypeCell.DOT;
            } else {
              board.cells[cellY][cellX] = TypeCell.PATH;
            }

            board.cells[cellY-1][cellX] = self;
          }
        }
        // si le fantome est plus haut que pacman
        else if (cellY > targetY) {
          if (board.cells[cellY-1][cellX] == TypeCell.DOT || board.cells[cellY-1][cellX] == TypeCell.SUPER_DOT
            || board.cells[cellY-1][cellX] == TypeCell.BONUS || board.cells[cellY-1][cellX] == TypeCell.PATH
            || board.cells[cellY-1][cellX] == TypeCell.PACMAN) {

            if (board.cells[cellY-1][cellX] != TypeCell.PACMAN) {
              if (board.cells[cellY-1][cellX] == TypeCell.DOT) {
                become = true;
              } else {
                become = false;
              }
            }
            if (become == true) {
              board.cells[cellY][cellX] = TypeCell.DOT;
            } else {
              board.cells[cellY][cellX] = TypeCell.PATH;
            }

            board.cells[cellY-1][cellX] = self;
          } else if (board.cells[cellY][cellX-1] == TypeCell.DOT || board.cells[cellY][cellX-1] == TypeCell.SUPER_DOT
            || board.cells[cellY][cellX-1] == TypeCell.BONUS || board.cells[cellY][cellX-1] == TypeCell.PATH
            || board.cells[cellY][cellX-1] == TypeCell.PACMAN) {

            if (board.cells[cellY][cellX-1] != TypeCell.PACMAN) {
              if (board.cells[cellY][cellX-1] == TypeCell.DOT) {
                become = true;
              } else {
                become = false;
              }
            }
            if (become == true) {
              board.cells[cellY][cellX] = TypeCell.DOT;
            } else {
              board.cells[cellY][cellX] = TypeCell.PATH;
            }

            board.cells[cellY][cellX-1] = self;
          } else if (board.cells[cellY+1][cellX] == TypeCell.DOT || board.cells[cellY+1][cellX] == TypeCell.SUPER_DOT
            || board.cells[cellY+1][cellX] == TypeCell.BONUS || board.cells[cellY+1][cellX] == TypeCell.PATH
            || board.cells[cellY+1][cellX] == TypeCell.PACMAN) {

            if (board.cells[cellY+1][cellX] != TypeCell.PACMAN) {
              if (board.cells[cellY+1][cellX] == TypeCell.DOT) {
                become = true;
              } else {
                become = false;
              }
            }
            if (become == true) {
              board.cells[cellY][cellX] = TypeCell.DOT;
            } else {
              board.cells[cellY][cellX] = TypeCell.PATH;
            }

            board.cells[cellY+1][cellX] = self;
          }
        }
        // si le fantome est aussi haut que pacman
        else if (cellY == targetY) {
          if (board.cells[cellY][cellX-1] == TypeCell.DOT || board.cells[cellY][cellX-1] == TypeCell.SUPER_DOT
            || board.cells[cellY][cellX-1] == TypeCell.BONUS || board.cells[cellY][cellX-1] == TypeCell.PATH
            || board.cells[cellY][cellX-1] == TypeCell.PACMAN) {

            if (board.cells[cellY][cellX-1] != TypeCell.PACMAN) {
              if (board.cells[cellY][cellX-1] == TypeCell.DOT) {
                become = true;
              } else {
                become = false;
              }
            }
            if (become == true) {
              board.cells[cellY][cellX] = TypeCell.DOT;
            } else {
              board.cells[cellY][cellX] = TypeCell.PATH;
            }

            board.cells[cellY][cellX-1] = self;
          } else if (board.cells[cellY-1][cellX] == TypeCell.DOT || board.cells[cellY-1][cellX] == TypeCell.SUPER_DOT
            || board.cells[cellY-1][cellX] == TypeCell.BONUS || board.cells[cellY-1][cellX] == TypeCell.PATH
            || board.cells[cellY-1][cellX] == TypeCell.PACMAN) {

            if (board.cells[cellY-1][cellX] != TypeCell.PACMAN) {
              if (board.cells[cellY-1][cellX] == TypeCell.DOT) {
                become = true;
              } else {
                become = false;
              }
            }
            if (become == true) {
              board.cells[cellY][cellX] = TypeCell.DOT;
            } else {
              board.cells[cellY][cellX] = TypeCell.PATH;
            }

            board.cells[cellY-1][cellX] = self;
          } else if (board.cells[cellY][cellX+1] == TypeCell.DOT || board.cells[cellY][cellX+1] == TypeCell.SUPER_DOT
            || board.cells[cellY][cellX+1] == TypeCell.BONUS || board.cells[cellY][cellX+1] == TypeCell.PATH
            || board.cells[cellY][cellX+1] == TypeCell.PACMAN) {

            if (board.cells[cellY][cellX+1] != TypeCell.PACMAN) {
              if (board.cells[cellY][cellX+1] == TypeCell.DOT) {
                become = true;
              } else {
                become = false;
              }
            }
            if (become == true) {
              board.cells[cellY][cellX] = TypeCell.DOT;
            } else {
              board.cells[cellY][cellX] = TypeCell.PATH;
            }

            board.cells[cellY][cellX+1] = self;
          } else if (board.cells[cellY+1][cellX] == TypeCell.DOT || board.cells[cellY+1][cellX] == TypeCell.SUPER_DOT
            || board.cells[cellY+1][cellX] == TypeCell.BONUS || board.cells[cellY+1][cellX] == TypeCell.PATH
            || board.cells[cellY+1][cellX] == TypeCell.PACMAN) {

            if (board.cells[cellY+1][cellX] != TypeCell.PACMAN) {
              if (board.cells[cellY+1][cellX] == TypeCell.DOT) {
                become = true;
              } else {
                become = false;
              }
            }
            if (become == true) {
              board.cells[cellY][cellX] = TypeCell.DOT;
            } else {
              board.cells[cellY][cellX] = TypeCell.PATH;
            }

            board.cells[cellY+1][cellX] = self;
          }
        }
      }
      // si le fantome est sur la meme colonne que pacman
      else if (cellX == targetX) {
        // si le fantome est moins haut que pacman
        if (cellY < targetY) {
          if (board.cells[cellY+1][cellX] == TypeCell.DOT || board.cells[cellY+1][cellX] == TypeCell.SUPER_DOT
            || board.cells[cellY+1][cellX] == TypeCell.BONUS || board.cells[cellY+1][cellX] == TypeCell.PATH
            || board.cells[cellY+1][cellX] == TypeCell.PACMAN) {

            if (board.cells[cellY+1][cellX] != TypeCell.PACMAN) {
              if (board.cells[cellY+1][cellX] == TypeCell.DOT) {
                become = true;
              } else {
                become = false;
              }
            }
            if (become == true) {
              board.cells[cellY][cellX] = TypeCell.DOT;
            } else {
              board.cells[cellY][cellX] = TypeCell.PATH;
            }

            board.cells[cellY+1][cellX] = self;
          } else if (board.cells[cellY][cellX-1] == TypeCell.DOT || board.cells[cellY][cellX-1] == TypeCell.SUPER_DOT
            || board.cells[cellY][cellX-1] == TypeCell.BONUS || board.cells[cellY][cellX-1] == TypeCell.PATH
            || board.cells[cellY][cellX-1] == TypeCell.PACMAN) {
            if (board.cells[cellY][cellX-1] != TypeCell.PACMAN) {
              if (board.cells[cellY][cellX-1] == TypeCell.DOT) {
                become = true;
              } else {
                become = false;
              }
            }
            if (become == true) {
              board.cells[cellY][cellX] = TypeCell.DOT;
            } else {
              board.cells[cellY][cellX] = TypeCell.PATH;
            }

            board.cells[cellY][cellX-1] = self;
          } else if (board.cells[cellY-1][cellX] == TypeCell.DOT || board.cells[cellY-1][cellX] == TypeCell.SUPER_DOT
            || board.cells[cellY-1][cellX] == TypeCell.BONUS || board.cells[cellY-1][cellX] == TypeCell.PATH
            || board.cells[cellY-1][cellX] == TypeCell.PACMAN) {
            if (board.cells[cellY-1][cellX] != TypeCell.PACMAN) {
              if (board.cells[cellY-1][cellX] == TypeCell.DOT) {
                become = true;
              } else {
                become = false;
              }
            }
            if (become == true) {
              board.cells[cellY][cellX] = TypeCell.DOT;
            } else {
              board.cells[cellY][cellX] = TypeCell.PATH;
            }
            board.cells[cellY-1][cellX] = self;
          } else if (board.cells[cellY][cellX+1] == TypeCell.DOT || board.cells[cellY][cellX+1] == TypeCell.SUPER_DOT
            || board.cells[cellY][cellX+1] == TypeCell.BONUS || board.cells[cellY][cellX+1] == TypeCell.PATH
            || board.cells[cellY][cellX+1] == TypeCell.PACMAN) {
            if (board.cells[cellY][cellX+1] != TypeCell.PACMAN) {
              if (board.cells[cellY][cellX+1] == TypeCell.DOT) {
                become = true;
              } else {
                become = false;
              }
            }
            if (become == true) {
              board.cells[cellY][cellX] = TypeCell.DOT;
            } else {
              board.cells[cellY][cellX] = TypeCell.PATH;
            }
            board.cells[cellY][cellX+1] = self;
          }
        }
        // si le fantome est plus haut que pacman
        else if (cellY > targetY) {
          if (board.cells[cellY-1][cellX] == TypeCell.DOT || board.cells[cellY-1][cellX] == TypeCell.SUPER_DOT
            || board.cells[cellY-1][cellX] == TypeCell.BONUS || board.cells[cellY-1][cellX] == TypeCell.PATH
            || board.cells[cellY-1][cellX] == TypeCell.PACMAN) {
            if (board.cells[cellY-1][cellX] != TypeCell.PACMAN) {
              if (board.cells[cellY-1][cellX] == TypeCell.DOT) {
                become = true;
              } else {
                become = false;
              }
            }
            if (become == true) {
              board.cells[cellY][cellX] = TypeCell.DOT;
            } else {
              board.cells[cellY][cellX] = TypeCell.PATH;
            }
            board.cells[cellY-1][cellX] = self;
          } else if (board.cells[cellY][cellX-1] == TypeCell.DOT || board.cells[cellY][cellX-1] == TypeCell.SUPER_DOT
            || board.cells[cellY][cellX-1] == TypeCell.BONUS || board.cells[cellY][cellX-1] == TypeCell.PATH
            || board.cells[cellY][cellX-1] == TypeCell.PACMAN) {
            if (board.cells[cellY][cellX-1] != TypeCell.PACMAN) {
              if (board.cells[cellY][cellX-1] == TypeCell.DOT) {
                become = true;
              } else {
                become = false;
              }
            }
            if (become == true) {
              board.cells[cellY][cellX] = TypeCell.DOT;
            } else {
              board.cells[cellY][cellX] = TypeCell.PATH;
            }
            board.cells[cellY][cellX-1] = self;
          } else if (board.cells[cellY+1][cellX] == TypeCell.DOT || board.cells[cellY+1][cellX] == TypeCell.SUPER_DOT
            || board.cells[cellY+1][cellX] == TypeCell.BONUS || board.cells[cellY+1][cellX] == TypeCell.PATH
            || board.cells[cellY+1][cellX] == TypeCell.PACMAN) {
            if (board.cells[cellY+1][cellX] != TypeCell.PACMAN) {
              if (board.cells[cellY+1][cellX] == TypeCell.DOT) {
                become = true;
              } else {
                become = false;
              }
            }
            if (become == true) {
              board.cells[cellY][cellX] = TypeCell.DOT;
            } else {
              board.cells[cellY][cellX] = TypeCell.PATH;
            }
            board.cells[cellY+1][cellX] = self;
          } else if (board.cells[cellY][cellX+1] == TypeCell.DOT || board.cells[cellY][cellX+1] == TypeCell.SUPER_DOT
            || board.cells[cellY][cellX+1] == TypeCell.BONUS || board.cells[cellY][cellX+1] == TypeCell.PATH
            || board.cells[cellY][cellX+1] == TypeCell.PACMAN) {
            if (board.cells[cellY][cellX+1] != TypeCell.PACMAN) {
              if (board.cells[cellY][cellX=1] == TypeCell.DOT) {
                become = true;
              } else {
                become = false;
              }
            }
            if (become == true) {
              board.cells[cellY][cellX] = TypeCell.DOT;
            } else {
              board.cells[cellY][cellX] = TypeCell.PATH;
            }
            board.cells[cellY][cellX+1] = self;
          }
        }
        // si le fantome va touche pacman
        else if (cellY == targetY) {
          game.confrontation(this);
        }
      }
    } else {
      if (cellX < targetX) {
        // si le fantome est moins haut que pacman
        if (cellY < targetY) {
          if (board.cells[cellY-1][cellX] == TypeCell.DOT || board.cells[cellY-1][cellX] == TypeCell.SUPER_DOT
            || board.cells[cellY-1][cellX] == TypeCell.BONUS || board.cells[cellY-1][cellX] == TypeCell.PATH
            || board.cells[cellY-1][cellX] == TypeCell.PACMAN) {
            if (board.cells[cellY-1][cellX] != TypeCell.PACMAN) {
              if (board.cells[cellY-1][cellX] == TypeCell.DOT) {
                become = true;
              } else {
                become = false;
              }
            }
            if (become == true) {
              board.cells[cellY][cellX] = TypeCell.DOT;
            } else {
              board.cells[cellY][cellX] = TypeCell.PATH;
            }
            board.cells[cellY-1][cellX] = self;
          } else if (board.cells[cellY][cellX-1] == TypeCell.DOT || board.cells[cellY][cellX-1] == TypeCell.SUPER_DOT
            || board.cells[cellY][cellX-1] == TypeCell.BONUS || board.cells[cellY][cellX-1] == TypeCell.PATH
            || board.cells[cellY][cellX-1] == TypeCell.PACMAN) {
            if (board.cells[cellY][cellX-1] != TypeCell.PACMAN) {
              if (board.cells[cellY][cellX-1] == TypeCell.DOT) {
                become = true;
              } else {
                become = false;
              }
            }
            if (become == true) {
              board.cells[cellY][cellX] = TypeCell.DOT;
            } else {
              board.cells[cellY][cellX] = TypeCell.PATH;
            }
            board.cells[cellY][cellX-1] = self;
          } else if (board.cells[cellY+1][cellX] == TypeCell.DOT || board.cells[cellY+1][cellX] == TypeCell.SUPER_DOT
            || board.cells[cellY+1][cellX] == TypeCell.BONUS || board.cells[cellY+1][cellX] == TypeCell.PATH
            || board.cells[cellY+1][cellX] == TypeCell.PACMAN) {
            if (board.cells[cellY+1][cellX] != TypeCell.PACMAN) {
              if (board.cells[cellY+1][cellX] == TypeCell.DOT) {
                become = true;
              } else {
                become = false;
              }
            }
            if (become == true) {
              board.cells[cellY][cellX] = TypeCell.DOT;
            } else {
              board.cells[cellY][cellX] = TypeCell.PATH;
            }
            board.cells[cellY+1][cellX] = self;
          }
        }
        // si le fantome est plus haut que pacman
        else if (cellY > targetY) {
          if (board.cells[cellY+1][cellX] == TypeCell.DOT || board.cells[cellY+1][cellX] == TypeCell.SUPER_DOT
            || board.cells[cellY+1][cellX] == TypeCell.BONUS || board.cells[cellY+1][cellX] == TypeCell.PATH
            || board.cells[cellY+1][cellX] == TypeCell.PACMAN) {
            if (board.cells[cellY+1][cellX] != TypeCell.PACMAN) {
              if (board.cells[cellY+1][cellX] == TypeCell.DOT) {
                become = true;
              } else {
                become = false;
              }
            }
            if (become == true) {
              board.cells[cellY][cellX] = TypeCell.DOT;
            } else {
              board.cells[cellY][cellX] = TypeCell.PATH;
            }
            board.cells[cellY+1][cellX] = self;
          } else if (board.cells[cellY][cellX-1] == TypeCell.DOT || board.cells[cellY][cellX-1] == TypeCell.SUPER_DOT
            || board.cells[cellY][cellX-1] == TypeCell.BONUS || board.cells[cellY][cellX-1] == TypeCell.PATH
            || board.cells[cellY][cellX-1] == TypeCell.PACMAN) {
            if (board.cells[cellY][cellX-1] != TypeCell.PACMAN) {
              if (board.cells[cellY][cellX-1] == TypeCell.DOT) {
                become = true;
              } else {
                become = false;
              }
            }
            if (become == true) {
              board.cells[cellY][cellX] = TypeCell.DOT;
            } else {
              board.cells[cellY][cellX] = TypeCell.PATH;
            }
            board.cells[cellY][cellX-1] = self;
          } else if (board.cells[cellY-1][cellX] == TypeCell.DOT || board.cells[cellY-1][cellX] == TypeCell.SUPER_DOT
            || board.cells[cellY-1][cellX] == TypeCell.BONUS || board.cells[cellY-1][cellX] == TypeCell.PATH
            || board.cells[cellY-1][cellX] == TypeCell.PACMAN) {
            if (board.cells[cellY-1][cellX] != TypeCell.PACMAN) {
              if (board.cells[cellY-1][cellX] == TypeCell.DOT) {
                become = true;
              } else {
                become = false;
              }
            }
            if (become == true) {
              board.cells[cellY][cellX] = TypeCell.DOT;
            } else {
              board.cells[cellY][cellX] = TypeCell.PATH;
            }
            board.cells[cellY-1][cellX] = self;
          }
        }
        // si le fantome est aussi haut que pacman
        else if (cellY == targetY) {
          if (board.cells[cellY][cellX-1] == TypeCell.DOT || board.cells[cellY][cellX-1] == TypeCell.SUPER_DOT
            || board.cells[cellY][cellX-1] == TypeCell.BONUS || board.cells[cellY][cellX-1] == TypeCell.PATH
            || board.cells[cellY][cellX-1] == TypeCell.PACMAN) {
            if (board.cells[cellY][cellX-1] != TypeCell.PACMAN) {
              if (board.cells[cellY][cellX-1] == TypeCell.DOT) {
                become = true;
              } else {
                become = false;
              }
            }
            if (become == true) {
              board.cells[cellY][cellX] = TypeCell.DOT;
            } else {
              board.cells[cellY][cellX] = TypeCell.PATH;
            }
            board.cells[cellY][cellX-1] = self;
          } else if (board.cells[cellY+1][cellX] == TypeCell.DOT || board.cells[cellY+1][cellX] == TypeCell.SUPER_DOT
            || board.cells[cellY+1][cellX] == TypeCell.BONUS || board.cells[cellY+1][cellX] == TypeCell.PATH
            || board.cells[cellY+1][cellX] == TypeCell.PACMAN) {
            if (board.cells[cellY+1][cellX] != TypeCell.PACMAN) {
              if (board.cells[cellY+1][cellX] == TypeCell.DOT) {
                become = true;
              } else {
                become = false;
              }
            }
            if (become == true) {
              board.cells[cellY][cellX] = TypeCell.DOT;
            } else {
              board.cells[cellY][cellX] = TypeCell.PATH;
            }
            board.cells[cellY+1][cellX] = self;
          } else if (board.cells[cellY][cellX+1] == TypeCell.DOT || board.cells[cellY][cellX+1] == TypeCell.SUPER_DOT
            || board.cells[cellY][cellX+1] == TypeCell.BONUS || board.cells[cellY][cellX+1] == TypeCell.PATH
            || board.cells[cellY][cellX+1] == TypeCell.PACMAN) {
            if (board.cells[cellY][cellX+1] != TypeCell.PACMAN) {
              if (board.cells[cellY][cellX+1] == TypeCell.DOT) {
                become = true;
              } else {
                become = false;
              }
            }
            if (become == true) {
              board.cells[cellY][cellX] = TypeCell.DOT;
            } else {
              board.cells[cellY][cellX] = TypeCell.PATH;
            }
            board.cells[cellY][cellX+1] = self;
          } else if (board.cells[cellY-1][cellX] == TypeCell.DOT || board.cells[cellY-1][cellX] == TypeCell.SUPER_DOT
            || board.cells[cellY-1][cellX] == TypeCell.BONUS || board.cells[cellY-1][cellX] == TypeCell.PATH
            || board.cells[cellY-1][cellX] == TypeCell.PACMAN) {
            if (board.cells[cellY-1][cellX] != TypeCell.PACMAN) {
              if (board.cells[cellY-1][cellX] == TypeCell.DOT) {
                become = true;
              } else {
                become = false;
              }
            }
            if (become == true) {
              board.cells[cellY][cellX] = TypeCell.DOT;
            } else {
              board.cells[cellY][cellX] = TypeCell.PATH;
            }
            board.cells[cellY+1][cellX] = self;
          }
        }
      }
      // si le fantome est plus loin que pacman
      else if (cellX > targetX) {
        // si le fantome est moins haut que pacman
        if (cellY < targetY) {
          if (board.cells[cellY-1][cellX] == TypeCell.DOT || board.cells[cellY-1][cellX] == TypeCell.SUPER_DOT
            || board.cells[cellY-1][cellX] == TypeCell.BONUS || board.cells[cellY-1][cellX] == TypeCell.PATH
            | board.cells[cellY-1][cellX] == TypeCell.PACMAN) {
            if (board.cells[cellY-1][cellX] != TypeCell.PACMAN) {
              if (board.cells[cellY-1][cellX] == TypeCell.DOT) {
                become = true;
              } else {
                become = false;
              }
            }
            if (become == true) {
              board.cells[cellY][cellX] = TypeCell.DOT;
            } else {
              board.cells[cellY][cellX] = TypeCell.PATH;
            }
            board.cells[cellY-1][cellX] = self;
          } else if (board.cells[cellY][cellX+1] == TypeCell.DOT || board.cells[cellY][cellX+1] == TypeCell.SUPER_DOT
            || board.cells[cellY][cellX+1] == TypeCell.BONUS || board.cells[cellY][cellX+1] == TypeCell.PATH
            || board.cells[cellY][cellX+1] == TypeCell.PACMAN) {
            if (board.cells[cellY][cellX+1] != TypeCell.PACMAN) {
              if (board.cells[cellY][cellX+1] == TypeCell.DOT) {
                become = true;
              } else {
                become = false;
              }
            }
            if (become == true) {
              board.cells[cellY][cellX] = TypeCell.DOT;
            } else {
              board.cells[cellY][cellX] = TypeCell.PATH;
            }
            board.cells[cellY][cellX+1] = self;
          } else if (board.cells[cellY+1][cellX] == TypeCell.DOT || board.cells[cellY+1][cellX] == TypeCell.SUPER_DOT
            || board.cells[cellY+1][cellX] == TypeCell.BONUS || board.cells[cellY+1][cellX] == TypeCell.PATH
            || board.cells[cellY+1][cellX] == TypeCell.PACMAN) {
            if (board.cells[cellY+1][cellX] != TypeCell.PACMAN) {
              if (board.cells[cellY+1][cellX] == TypeCell.DOT) {
                become = true;
              } else {
                become = false;
              }
            }
            if (become == true) {
              board.cells[cellY][cellX] = TypeCell.DOT;
            } else {
              board.cells[cellY][cellX] = TypeCell.PATH;
            }
            board.cells[cellY+1][cellX] = self;
          }
        }
        // si le fantome est plus haut que pacman
        else if (cellY > targetY) {
          if (board.cells[cellY+1][cellX] == TypeCell.DOT || board.cells[cellY+1][cellX] == TypeCell.SUPER_DOT
            || board.cells[cellY+1][cellX] == TypeCell.BONUS || board.cells[cellY+1][cellX] == TypeCell.PATH
            || board.cells[cellY+1][cellX] == TypeCell.PACMAN) {
            if (board.cells[cellY+1][cellX] != TypeCell.PACMAN) {
              if (board.cells[cellY+1][cellX] == TypeCell.DOT) {
                become = true;
              } else {
                become = false;
              }
            }
            if (become == true) {
              board.cells[cellY][cellX] = TypeCell.DOT;
            } else {
              board.cells[cellY][cellX] = TypeCell.PATH;
            }
            board.cells[cellY+1][cellX] = self;
          } else if (board.cells[cellY][cellX+1] == TypeCell.DOT || board.cells[cellY][cellX+1] == TypeCell.SUPER_DOT
            || board.cells[cellY][cellX+1] == TypeCell.BONUS || board.cells[cellY][cellX+1] == TypeCell.PATH
            || board.cells[cellY][cellX+1] == TypeCell.PACMAN) {
            if (board.cells[cellY][cellX+1] != TypeCell.PACMAN) {
              if (board.cells[cellY][cellX+1] == TypeCell.DOT) {
                become = true;
              } else {
                become = false;
              }
            }
            if (become == true) {
              board.cells[cellY][cellX] = TypeCell.DOT;
            } else {
              board.cells[cellY][cellX] = TypeCell.PATH;
            }
            board.cells[cellY][cellX+1] = self;
          } else if (board.cells[cellY-1][cellX] == TypeCell.DOT || board.cells[cellY-1][cellX] == TypeCell.SUPER_DOT
            || board.cells[cellY-1][cellX] == TypeCell.BONUS || board.cells[cellY-1][cellX] == TypeCell.PATH
            || board.cells[cellY-1][cellX] == TypeCell.PACMAN) {
            if (board.cells[cellY-1][cellX] != TypeCell.PACMAN) {
              if (board.cells[cellY-1][cellX] == TypeCell.DOT) {
                become = true;
              } else {
                become = false;
              }
            }
            if (become == true) {
              board.cells[cellY][cellX] = TypeCell.DOT;
            } else {
              board.cells[cellY][cellX] = TypeCell.PATH;
            }
            board.cells[cellY-1][cellX] = self;
          }
        }
        // si le fantome est aussi haut que pacman
        else if (cellY == targetY) {
          if (board.cells[cellY][cellX+1] == TypeCell.DOT || board.cells[cellY][cellX+1] == TypeCell.SUPER_DOT
            || board.cells[cellY][cellX+1] == TypeCell.BONUS || board.cells[cellY][cellX+1] == TypeCell.PATH
            || board.cells[cellY][cellX+1] == TypeCell.PACMAN) {
            if (board.cells[cellY][cellX+1] != TypeCell.PACMAN) {
              if (board.cells[cellY][cellX+1] == TypeCell.DOT) {
                become = true;
              } else {
                become = false;
              }
            }
            if (become == true) {
              board.cells[cellY][cellX] = TypeCell.DOT;
            } else {
              board.cells[cellY][cellX] = TypeCell.PATH;
            }
            board.cells[cellY][cellX+1] = self;
          } else if (board.cells[cellY+1][cellX] == TypeCell.DOT || board.cells[cellY+1][cellX] == TypeCell.SUPER_DOT
            || board.cells[cellY+1][cellX] == TypeCell.BONUS || board.cells[cellY+1][cellX] == TypeCell.PATH
            || board.cells[cellY+1][cellX] == TypeCell.PACMAN) {
            if (board.cells[cellY+1][cellX] != TypeCell.PACMAN) {
              if (board.cells[cellY+1][cellX] == TypeCell.DOT) {
                become = true;
              } else {
                become = false;
              }
            }
            if (become == true) {
              board.cells[cellY][cellX] = TypeCell.DOT;
            } else {
              board.cells[cellY][cellX] = TypeCell.PATH;
            }
            board.cells[cellY+1][cellX] = self;
          } else if (board.cells[cellY][cellX-1] == TypeCell.DOT || board.cells[cellY][cellX-1] == TypeCell.SUPER_DOT
            || board.cells[cellY][cellX-1] == TypeCell.BONUS || board.cells[cellY][cellX-1] == TypeCell.PATH
            || board.cells[cellY][cellX-1] == TypeCell.PACMAN) {
            if (board.cells[cellY][cellX-1] != TypeCell.PACMAN) {
              if (board.cells[cellY][cellX-1] == TypeCell.DOT) {
                become = true;
              } else {
                become = false;
              }
            }
            if (become == true) {
              board.cells[cellY][cellX] = TypeCell.DOT;
            } else {
              board.cells[cellY][cellX] = TypeCell.PATH;
            }
            board.cells[cellY][cellX-1] = self;
          } else if (board.cells[cellY-1][cellX] == TypeCell.DOT || board.cells[cellY-1][cellX] == TypeCell.SUPER_DOT
            || board.cells[cellY-1][cellX] == TypeCell.BONUS || board.cells[cellY-1][cellX] == TypeCell.PATH
            || board.cells[cellY-1][cellX] == TypeCell.PACMAN) {
            if (board.cells[cellY-1][cellX] != TypeCell.PACMAN) {
              if (board.cells[cellY-1][cellX] == TypeCell.DOT) {
                become = true;
              } else {
                become = false;
              }
            }
            if (become == true) {
              board.cells[cellY][cellX] = TypeCell.DOT;
            } else {
              board.cells[cellY][cellX] = TypeCell.PATH;
            }
            board.cells[cellY-1][cellX] = self;
          }
        }
      }
      // si le fantome est sur la meme colonne que pacman
      else if (cellX == targetX) {
        // si le fantome est moins haut que pacman
        if (cellY < targetY) {
          if (board.cells[cellY-1][cellX] == TypeCell.DOT || board.cells[cellY-1][cellX] == TypeCell.SUPER_DOT
            || board.cells[cellY-1][cellX] == TypeCell.BONUS || board.cells[cellY-1][cellX] == TypeCell.PATH
            || board.cells[cellY-1][cellX] == TypeCell.PACMAN) {
            if (board.cells[cellY-1][cellX] != TypeCell.PACMAN) {
              if (board.cells[cellY-1][cellX] == TypeCell.DOT) {
                become = true;
              } else {
                become = false;
              }
            }
            if (become == true) {
              board.cells[cellY][cellX] = TypeCell.DOT;
            } else {
              board.cells[cellY][cellX] = TypeCell.PATH;
            }
            board.cells[cellY-1][cellX] = self;
          } else if (board.cells[cellY][cellX+1] == TypeCell.DOT || board.cells[cellY][cellX+1] == TypeCell.SUPER_DOT
            || board.cells[cellY][cellX+1] == TypeCell.BONUS || board.cells[cellY][cellX+1] == TypeCell.PATH
            || board.cells[cellY][cellX+1] == TypeCell.PACMAN) {
            if (board.cells[cellY][cellX+1] != TypeCell.PACMAN) {
              if (board.cells[cellY][cellX+1] == TypeCell.DOT) {
                become = true;
              } else {
                become = false;
              }
            }
            if (become == true) {
              board.cells[cellY][cellX] = TypeCell.DOT;
            } else {
              board.cells[cellY][cellX] = TypeCell.PATH;
            }
            board.cells[cellY][cellX+1] = self;
          } else if (board.cells[cellY+1][cellX] == TypeCell.DOT || board.cells[cellY+1][cellX] == TypeCell.SUPER_DOT
            || board.cells[cellY+1][cellX] == TypeCell.BONUS || board.cells[cellY+1][cellX] == TypeCell.PATH
            || board.cells[cellY+1][cellX] == TypeCell.PACMAN) {
            if (board.cells[cellY+1][cellX] != TypeCell.PACMAN) {
              if (board.cells[cellY+1][cellX] == TypeCell.DOT) {
                become = true;
              } else {
                become = false;
              }
            }
            if (become == true) {
              board.cells[cellY][cellX] = TypeCell.DOT;
            } else {
              board.cells[cellY][cellX] = TypeCell.PATH;
            }
            board.cells[cellY+1][cellX] = self;
          } else if (board.cells[cellY][cellX-1] == TypeCell.DOT || board.cells[cellY][cellX-1] == TypeCell.SUPER_DOT
            || board.cells[cellY][cellX-1] == TypeCell.BONUS || board.cells[cellY][cellX-1] == TypeCell.PATH
            || board.cells[cellY][cellX-1] == TypeCell.PACMAN) {
            if (board.cells[cellY][cellX-1] != TypeCell.PACMAN) {
              if (board.cells[cellY][cellX-1] == TypeCell.DOT) {
                become = true;
              } else {
                become = false;
              }
            }
            if (become == true) {
              board.cells[cellY][cellX] = TypeCell.DOT;
            } else {
              board.cells[cellY][cellX] = TypeCell.PATH;
            }
            board.cells[cellY][cellX-1] = self;
          }
        }
        // si le fantome est plus haut que pacman
        else if (cellY > targetY) {
          if (board.cells[cellY+1][cellX] == TypeCell.DOT || board.cells[cellY+1][cellX] == TypeCell.SUPER_DOT
            || board.cells[cellY+1][cellX] == TypeCell.BONUS || board.cells[cellY+1][cellX] == TypeCell.PATH
            || board.cells[cellY+1][cellX] == TypeCell.PACMAN) {
            if (board.cells[cellY+1][cellX] != TypeCell.PACMAN) {
              if (board.cells[cellY+1][cellX] == TypeCell.DOT) {
                become = true;
              } else {
                become = false;
              }
            }
            if (become == true) {
              board.cells[cellY][cellX] = TypeCell.DOT;
            } else {
              board.cells[cellY][cellX] = TypeCell.PATH;
            }
            board.cells[cellY+1][cellX] = self;
          } else if (board.cells[cellY][cellX+1] == TypeCell.DOT || board.cells[cellY][cellX+1] == TypeCell.SUPER_DOT
            || board.cells[cellY][cellX+1] == TypeCell.BONUS || board.cells[cellY][cellX+1] == TypeCell.PATH
            || board.cells[cellY][cellX+1] == TypeCell.PACMAN) {
            if (board.cells[cellY][cellX+1] != TypeCell.PACMAN) {
              if (board.cells[cellY][cellX+1] == TypeCell.DOT) {
                become = true;
              } else {
                become = false;
              }
            }
            if (become == true) {
              board.cells[cellY][cellX] = TypeCell.DOT;
            } else {
              board.cells[cellY][cellX] = TypeCell.PATH;
            }
            board.cells[cellY][cellX+1] = self;
          } else if (board.cells[cellY-1][cellX] == TypeCell.DOT || board.cells[cellY-1][cellX] == TypeCell.SUPER_DOT
            || board.cells[cellY-1][cellX] == TypeCell.BONUS || board.cells[cellY-1][cellX] == TypeCell.PATH
            || board.cells[cellY-1][cellX] == TypeCell.PACMAN) {
            if (board.cells[cellY-1][cellX] != TypeCell.PACMAN) {
              if (board.cells[cellY-1][cellX] == TypeCell.DOT) {
                become = true;
              } else {
                become = false;
              }
            }
            if (become == true) {
              board.cells[cellY][cellX] = TypeCell.DOT;
            } else {
              board.cells[cellY][cellX] = TypeCell.PATH;
            }
            board.cells[cellY-1][cellX] = self;
          } else if (board.cells[cellY][cellX-1] == TypeCell.DOT || board.cells[cellY][cellX-1] == TypeCell.SUPER_DOT
            || board.cells[cellY][cellX-1] == TypeCell.BONUS || board.cells[cellY][cellX-1] == TypeCell.PATH
            || board.cells[cellY][cellX-1] == TypeCell.PACMAN) {
            if (become == true) {
              board.cells[cellY][cellX] = TypeCell.DOT;
            } else {
              board.cells[cellY][cellX] = TypeCell.PATH;
            }
            if (board.cells[cellY][cellX-1] != TypeCell.PACMAN) {
              if (board.cells[cellY][cellX-1] == TypeCell.DOT) {
                become = true;
              } else {
                become = false;
              }
            }
            board.cells[cellY][cellX-1] = self;
          }
        }
        // si le fantome va touche pacman
        else if (cellY == targetY) {
          game.confrontation(this);
        }
      }
    }
  }

  void drawIt() {
    imageMode(CENTER);
    if (boosted == true) {
      if (self == TypeCell.RED || self == TypeCell.ORANGE) {
        image(wGhost, position.x, position.y, size, size);
      } else if (self == TypeCell.BLUE || self == TypeCell.PINK) {
        image(bGhost, position.x, position.y, size, size);
      }
    } else {
      image(col, position.x, position.y, size, size);
    }
  }
}
