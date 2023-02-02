class Game {
  Board board;
  Hero hero;

  Game(Board _board, Hero _hero) {
    board = _board;
    hero = _hero;
  }

  void loadGame(String[] toConvert) {
    nbDots = 1;
    board.convertBoard(toConvert);
    nbDots -= 1;
    direction = 'i';
    appearance = 0;
    win = false;
    lost = false;
  }

  void newGame() {
    nbDots = 1;
    board.convertBoard(lines);
    redOut = false;
    blueOut = false;
    orangeOut = false;
    pinkOut = false;
    nbDots -= 1;
    direction = 'i';
    directionFutur = 1;
    partie.score = 0;
    appearance = 0;
    nbVies = 2;
    nbPtVieSupp = 1000;
    win = false;
    lost = false;
    tSortie = millis();
    redBecome = false;
    blueBecome = false;
    pinkBecome = false;
    orangeBecome = false;
    utile = 0;
    // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    highestScores = loadStrings("./data/scores.txt");
    sortedScores = new Score[highestScores.length];
    for (int i=0; i<highestScores.length; i++) {
      String[] scoreActuel = split(highestScores[i], " ");
      Score s = new Score(int(scoreActuel[0]), scoreActuel[1]);
      sortedScores[i] = s;
    }
    sortedScores = insertionSort(sortedScores);
  }

  void update() {
    board.cells[pacman.cellY][pacman.cellX] = TypeCell.PATH;
    board.cells[redGhost.cellY][redGhost.cellX] = TypeCell.PATH;
    board.cells[orangeGhost.cellY][orangeGhost.cellX] = TypeCell.PATH;
    board.cells[pinkGhost.cellY][pinkGhost.cellX] = TypeCell.PATH;
    board.cells[blueGhost.cellY][blueGhost.cellX] = TypeCell.PATH;
    board.cells[11][11] = TypeCell.RED;
    board.cells[11][10] = TypeCell.PINK;
    board.cells[11][12] = TypeCell.BLUE;
    board.cells[11][13] = TypeCell.ORANGE;
    board.cells[17][11] = TypeCell.PACMAN;

    direction = 'i';
    redBecome = false;
    blueBecome = false;
    orangeBecome = false;
    pinkBecome = false;
    tSortie = millis();
    redOut = false;
    blueOut = false;
    orangeOut = false;
    pinkOut = false;
  }

  void drawIt() {
    if (win == true) {
      String dataGame = partie.score + " " + partie.nom;
      highestScores = append(highestScores, dataGame);
      saveStrings("./data/scores.txt", highestScores);
      fill(255, 255, 0);
      textAlign(CENTER, CENTER);
      text("YOU WON", width/2, height/2);
      text("Press enter to play again", width/2+10, height/1.3);
      noLoop();
    } else if (lost == true) {
      board.drawIt();
      pacman.drawIt();
      redGhost.drawIt();
      blueGhost.drawIt();
      orangeGhost.drawIt();
      pinkGhost.drawIt();
      // effet de mort de pacman
      utile += 1;
      if (utile == 10) {
        println(partie.score);
        String dataGame = partie.score + " " + partie.nom;
        highestScores = append(highestScores, dataGame);
        saveStrings("./data/scores.txt", highestScores);
      }
      if (appearance < 13) {
        if (appearance >= 11) {
          appearance += 0.05;
        } else {
          appearance += 0.15;
        }
      } else {
        textFont(f, 16);
        fill(255);
        text("Press enter to play again", width/2+10, height/1.1);
      }
      textFont(f, 12);
      fill(255, 50, 50);
      textAlign(CENTER, CENTER);
      PVector pos = board.getCellCenter(board.nbCellsX/2, 13);
      text("Game Over !", pos.x, pos.y-2);
    } else {
      loop();
      // affichage du Ready!
      if (askName == false && millis() - tempsJeu < 2000) {
        textFont(f, 12);
        fill(255, 255, 0);
        textAlign(CENTER, CENTER);
        PVector pos = board.getCellCenter(board.nbCellsX/2, 13);
        text("Ready !", pos.x, pos.y-2);
      }
      // score
      textFont(f, 16);
      fill(255);
      textAlign(LEFT, UP);
      text(partie.score, board.boardX, height/4.5);
      textAlign(CENTER, UP);
      text("High Score", width/2+CELL_SIZE/2, height/5.5);
      
      // !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
      highScore = sortedScores[0].score;
      text(highScore, width/2+CELL_SIZE/2, height/4.5);

      // affichage des vies
      for (int i=0; i<nbVies; i++) {
        image(pacmanLeft, (width/4)+(i*45), height/1.2, 27, 27);
      }

      // affichage du board
      board.drawIt();
      pacman.drawIt();
      redGhost.drawIt();
      blueGhost.drawIt();
      orangeGhost.drawIt();
      pinkGhost.drawIt();

      pacman.update();

      // delais de sortie des fantomes
      if(askName == false && isMenu == false){
        if (millis() - tSortie > 15000) {
          if(orangeOut == false && (millis() - tSortie > 15000 && millis() - tSortie < 16000)){
            board.cells[10][11] = TypeCell.PATH;
            board.cells[9][11] = TypeCell.ORANGE;
            board.cells[11][13] = TypeCell.PATH;
          }
          board.cells[10][11] = TypeCell.GATE; 
          orangeOut = true;
          tSortie += 17000;
        } else if (millis() - tSortie > 12000) {
          if(pinkOut == false && (millis() - tSortie > 12000 && millis() - tSortie < 13000)){
            board.cells[10][11] = TypeCell.PATH;
            board.cells[9][11] = TypeCell.PINK;
            board.cells[11][10] = TypeCell.PATH; 
          }
          board.cells[10][11] = TypeCell.GATE; 
          pinkOut = true;
        } else if (millis() - tSortie > 6000) {
          if(blueOut == false && (millis() - tSortie > 6000 && millis() - tSortie < 7000)){
            board.cells[10][11] = TypeCell.PATH;
            board.cells[9][11] = TypeCell.BLUE;
            board.cells[11][12] = TypeCell.PATH;
          }
          board.cells[10][11] = TypeCell.GATE; 
          blueOut = true;
        } else if (millis() - tSortie > 2000) {
          if(redOut == false && (millis() - tSortie > 2000 && millis() - tSortie < 3000)){
            board.cells[10][11] = TypeCell.PATH;
            board.cells[9][11] = TypeCell.RED;
            board.cells[11][11] = TypeCell.PATH;
          }
          board.cells[10][11] = TypeCell.GATE;
          redOut = true;   
        }
      }

      // confrontations
      if (redGhost.cellX == pacman.cellX && redGhost.cellY == pacman.cellY && redOut == true) {
        confrontation(redGhost);
      }
      if (blueGhost.cellX == pacman.cellX && blueGhost.cellY == pacman.cellY && blueOut == true) {
        confrontation(blueGhost);
      }
      if (orangeGhost.cellX == pacman.cellX && orangeGhost.cellY == pacman.cellY && orangeOut == true) {
        confrontation(orangeGhost);
      }
      if (pinkGhost.cellX == pacman.cellX && pinkGhost.cellY == pacman.cellY && pinkOut == true) {
        confrontation(pinkGhost);
      }

      // deplacement de pacman
      if (millis() - temps > 170 && win == false && lost == false) {
        if (isMenu == false && askName == false) {
          pacman.lauchMove();
        }
        temps += 170;
      }
      
      // deplacement des fantomes
      if(boosted == false){
        if (millis() - tempsF > 220 && win == false && lost == false) {
          if (isMenu == false && askName == false) {
            if (redOut == true) {
              redGhost.move(redBecome);
            }
            if (blueOut == true) {
              blueGhost.move(blueBecome);
            }
            if (pinkOut == true) {
              pinkGhost.move(pinkBecome);
            }
            if (orangeOut == true) {
              orangeGhost.move(orangeBecome);
            }
          }
          tempsF += 220;
        }
      } else {
        if (millis() - tempsF > 400 && win == false && lost == false) {
          if (isMenu == false && askName == false) {
            if (redOut == true) {
              redGhost.move(redBecome);
            }
            if (blueOut == true) {
              blueGhost.move(blueBecome);
            }
            if (pinkOut == true) {
              pinkGhost.move(pinkBecome);
            }
            if (orangeOut == true) {
              orangeGhost.move(orangeBecome);
            }
          }
          tempsF += 400;
        }
      }
      

      // permet de faire clignoter les super dots
      if (millis() > blinkTimer*2) {
        blink = color(255, 200, 100);
        if (millis() > (blinkTimer*2)+500) {
          blinkTimer += 500;
        }
      } else if (millis() > blinkTimer) {
        blink = color(0, 0, 0, 255);
      }

      if (nbVies < 2) {
        if (partie.score >= nbPtVieSupp) {
          nbVies += 1;
          nbPtVieSupp += 1000;
        }
      } else {
        if (partie.score >= nbPtVieSupp) {
          nbPtVieSupp += 1000;
        }
      }

      if (millis() > timer) {
        boosted = false;
      }

      // gestion du bonus ( n'apparaissent qu'apres 15s de jeu
      if (millis() > tBonus) {
        if (posY > 1 && board.cells[posY][posX] != TypeCell.WALL &&
          board.cells[posY][posX] != TypeCell.RED &&
          board.cells[posY][posX] != TypeCell.ORANGE &&
          board.cells[posY][posX] != TypeCell.PINK &&
          board.cells[posY][posX] != TypeCell.BLUE &&
          board.cells[posY][posX] != TypeCell.PACMAN &&
          board.cells[posY][posX] != TypeCell.EMPTY) {
          if (board.cells[posY][posX] == TypeCell.DOT || board.cells[posY][posX] == TypeCell.SUPER_DOT) {
            nbDots -= 1;
          }
          board.cells[posY][posX] = TypeCell.BONUS;
        } else {
          bonusX = random(board.nbCellsX);
          bonusY = random(board.nbCellsY);
          posX = int(bonusX);
          posY = int(bonusY);
        }
      }
    }
    // condition de victoire
    if(hasWon(board) == true){
      win = true;
    }
    if (nbVies < 0) {
      lost = true;
    }
  }
  
  boolean hasWon(Board board){
    for(int i=0; i<board.cells.length; i++){    
      for(int j=0; j<board.cells[i].length; j++){
        if(board.cells[i][j] == TypeCell.DOT || board.cells[i][j] == TypeCell.SUPER_DOT){
          return false;
        }
      }
    }
    return true;
  }

  void confrontation(Ghost fantome) {
    if (boosted == false) {
      superScore = 200;
      nbVies -= 1;
      if (nbVies >= 0) {
        game.update();
      } else {
        board.cells[9][11] = fantome.self;
        fantome.cellX = 11;
        fantome.cellY = 9;
        board.cells[pacman.cellY][pacman.cellX] = TypeCell.PACMAN;
        lost = true;
      }
    } else {
      if (fantome.cellX == pacman.cellX && fantome.cellY == pacman.cellY) {
        if(fantome == redGhost){
          board.cells[11][11] = fantome.self;
          redOut = false;
        }
        if(fantome == blueGhost){
          board.cells[11][12] = fantome.self;
          blueOut = false;
        }
        if(fantome == orangeGhost){
          board.cells[11][13] = fantome.self;
          orangeOut = false;
        }
        if(fantome == pinkGhost){
          board.cells[11][10] = fantome.self;
          pinkOut = false;
        }
        tSortie = millis();
        partie.score += superScore;
        if (superScore < 800) {
          superScore *= 2;
        }
      }
    }
  }

  void saveGame() {
    // le fichier liste va permettre de connaitre le nombre de sauvegardes
    // et le nom de chaques sauvegardes
    String[] liste = loadStrings("./data/liste.txt");

    String[] newTxt = new String[0];
    TypeCell[][] c = board.cells;
    // pour nommer les sauvegardes
    int d = day();
    int mo = month();
    int h = hour();
    int m = minute();
    int s = second();
    for (int i=-1; i<c.length; i++) {
      String line = "";
      if (i < 0) {
        line = d+"_"+mo+"_"+h+"h"+m+"."+s+" "+partie.score+" "+nbVies;
      } else {
        for (int j=0; j<c[i].length; j++) {
          if (c[i][j] == TypeCell.WALL) {
            line += "x";
          } else if (c[i][j] == TypeCell.EMPTY) {
            line += "V";
          } else if (c[i][j] == TypeCell.GATE) {
            line += "G";
          } else if (c[i][j] == TypeCell.RED) {
            line += "r";
          } else if (c[i][j] == TypeCell.ORANGE) {
            line += "g";
          } else if (c[i][j] == TypeCell.PINK) {
            line += "p";
          } else if (c[i][j] == TypeCell.BLUE) {
            line += "b";
          } else if (c[i][j] == TypeCell.PACMAN) {
            line += "P";
          } else if (c[i][j] == TypeCell.DOT) {
            line += "o";
          } else if (c[i][j] == TypeCell.SUPER_DOT) {
            line += "O";
          } else if (c[i][j] == TypeCell.PATH) {
            line += "R";
          } else if (c[i][j] == TypeCell.BONUS) {
            line += "R";
          }
        }
      }
      if (i != 0) {
        newTxt = append(newTxt, line);
      }
    }
    liste = append(liste, newTxt[0]);
    saveStrings("./data/liste.txt", liste);
    saveStrings("./levels/"+d+"_"+mo+"_"+h+"h"+m+"."+s+".txt", newTxt);
  }
}
