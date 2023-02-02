enum TypeCell {
  EMPTY, WALL, DOT, SUPER_DOT, PACMAN, PATH, RED, BLUE, ORANGE, PINK, BONUS, GATE // others ?
}

class Board {
  TypeCell[][] cells;
  PVector position;
  int nbCellsX;
  int nbCellsY;
  int cellSize; // cells should be square
  int boardX;
  int boardY;

  Board(String[] boardText, int _cellSize) {
    // taille du board par rapport a la taille du txt
    nbCellsX = boardText[1].toCharArray().length;
    nbCellsY = boardText.length;
    cells = new TypeCell[nbCellsY][nbCellsX];

    convertBoard(boardText);
    cellSize = _cellSize;

    boardX = (width/2)-((nbCellsX/2)*cellSize);
    boardY = (height/2)-((nbCellsY/2)*cellSize);
    position = new PVector(boardX, boardY);
  }

  PVector getCellCenter(int i, int j) {
    float posX = boardX+((i+1)*cellSize)-(cellSize/2);
    float posY = boardY+((j+1)*cellSize)-(cellSize/2);
    PVector cellCenter = new PVector(posX, posY);
    return cellCenter;
  }

  void drawIt() {
    for (int y=0; y<nbCellsY; y++) {
      for (int x=0; x<nbCellsX; x++) {
        if (cells[y][x] == TypeCell.WALL) {
          fill(0);
          strokeWeight(2);
          stroke(0, 0, 180);
          rectMode(CORNER);
          square(position.x, position.y, cellSize);
        } else if (cells[y][x] == TypeCell.EMPTY) {
          noFill();
          noStroke();
          rectMode(CORNER);
          square(position.x, position.y, cellSize);
        } else if (cells[y][x] == TypeCell.DOT) {
          fill(255, 200, 100);
          noStroke();
          rectMode(CENTER);
          square(getCellCenter(x, y).x, getCellCenter(x, y).y, cellSize/5.5);
        } else if (cells[y][x] == TypeCell.SUPER_DOT) {
          fill(blink);
          noStroke();
          circle(getCellCenter(x, y).x, getCellCenter(x, y).y, cellSize/2);
        } else if (cells[y][x] == TypeCell.GATE) {
          fill(255, 255, 0);
          stroke(0, 0, 180);
          rectMode(CORNER);
          rect(position.x, position.y, cellSize, cellSize/2.5);
        } else if (cells[y][x] == TypeCell.PACMAN) {
          pacman = new Hero(x, y);
        } else if (cells[y][x] == TypeCell.RED) {
          redGhost = new Ghost(red, x, y);
        } else if (cells[y][x] == TypeCell.BLUE) {
          blueGhost = new Ghost(blue, x, y);
        } else if (cells[y][x] == TypeCell.ORANGE) {
          orangeGhost = new Ghost(orange, x, y);
        } else if (cells[y][x] == TypeCell.PINK) {
          pinkGhost = new Ghost(pink, x, y);
        } else if (cells[y][x] == TypeCell.PATH) {
          fill(0, 0, 0, 0);
          noStroke();
          rectMode(CORNER);
          square(position.x, position.y, cellSize);
        } else if (cells[y][x] == TypeCell.BONUS) {
          fill(30, 30, 100, 100);
          noStroke();
          rectMode(CORNER);
          rect(position.x, position.y, cellSize, cellSize, 100);
          imageMode(CORNER);
          image(cerise, position.x, position.y, cellSize, cellSize);
        }
        position.x += cellSize;
      }
      // saut de ligne
      position.y += cellSize;
      position.x = boardX;
    }
    // reinitialisation des données comme la fonction est appelé dans draw (indirectemt)
    position.x = boardX;
    position.y = boardY;
  }

  void convertBoard(String[] lines) {
    for (int y=1; y<lines.length; y++) {
      // transforme une ligne String en tableau de char
      char[] arrayLine = lines[y].toCharArray();

      for (int x=0; x < arrayLine.length; x++) {
        if (arrayLine[x] == 'x') {
          cells[y][x] = TypeCell.WALL;
        } else if (arrayLine[x] == 'V') {
          cells[y][x] = TypeCell.EMPTY;
        } else if (arrayLine[x] == 'o') {
          nbDots += 1;
          cells[y][x] = TypeCell.DOT;
        } else if (arrayLine[x] == 'O') {
          nbDots += 1;
          cells[y][x] = TypeCell.SUPER_DOT;
        } else if (arrayLine[x] == 'G') {
          nbDots += 1;
          cells[y][x] = TypeCell.GATE;
        } else if (arrayLine[x] == 'P') {
          cells[y][x] = TypeCell.PACMAN;
        } else if (arrayLine[x] == 'R') {
          cells[y][x] = TypeCell.PATH;
        } else if (arrayLine[x] == 'r') {
          cells[y][x] = TypeCell.RED;
        } else if (arrayLine[x] == 'b') {
          cells[y][x] = TypeCell.BLUE;
        } else if (arrayLine[x] == 'g') {
          cells[y][x] = TypeCell.ORANGE;
        } else if (arrayLine[x] == 'p') {
          cells[y][x] = TypeCell.PINK;
        }
      }
    }
  }
}
