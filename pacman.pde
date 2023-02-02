// temps de jeu
int temps;
int tempsF;
// direction dans laquelle va pacman
char direction = 'i';
boolean win;
boolean lost;
// nb de dots pour savoir quand le joueur a gagné
int nbDots;
// nb de vies du joueur
int nbVies;
// nb de points necessaires pour gagner une vie
int nbPtVieSupp = 1000;
// mange un super dot
boolean boosted;
int timer;
int superScore;
// pour le clignotement des super dots
int blinkTimer = 500;
color blink;
// plus haut score
Score[] sortedScores;
int highScore;
float appearance = 0;
// apparition des bonus toutes les 10s avec 10s d'intervalles
int tBonus = 15000;
// position de base du bonus
float bonusX;
float bonusY;
int posX;
int posY;
// menu
boolean isMenu = false;
boolean showBestScores = false;
boolean showSavedLvl = false;
// timer pour enlever le menu quelques secondes et save le board pour les sauvegardes
String[] listeSauvegardes;
// pour le deplacement fluide
boolean animate = false;
float posPX;
float posPY;
float intervalle = CELL_SIZE/10.2;
// pour pas que le fantome mange les dots
boolean redBecome;
boolean blueBecome;
boolean pinkBecome;
boolean orangeBecome;
// timer sortie des fantomes
int timerF;
// pour enregister le score d'une game meme si on perd
int scorePartie;
// direction futur
int directionFutur;
// sortie des fantomes (peut pas dans leur classe puisque constructeur est appelé
// dans draw du board)
boolean redOut = false;
boolean orangeOut = false;
boolean pinkOut = false;
boolean blueOut = false;
int tSortie;
// sauvegarde du score lors de la defaite
int utile;

// demande le  nom du joueur
boolean askName = true;
// longueur max du pseudo
int nbCharMax = 5;
// posX de la barre qui clignote
float posXBarre;
int tempsJeu;

int pacAnim = 300;


void setup() {
  size(800, 800, P2D);

  menu = new Menu();
  
  posXBarre = width/2.85;

  // données initiales du jeu
  nbDots = 1;
  nbVies = 2;

  // creation du board et du jeu dans sa globalité
  lines = loadStrings("./levels/level1.txt");
  highestScores = loadStrings("./data/scores.txt");
  partie = new Score();
  board = new Board(lines, CELL_SIZE);
  game = new Game(board, pacman);
  // données de partie
  nbDots -= 1;

  // pour initialiser la case a copier pour le fantome et qu'il mange pas les dots
  redBecome = false;
  blueBecome = false;
  pinkBecome = false;
  orangeBecome = false;

  f = createFont("data/emulogic.ttf", 16, true);
  win = false;
  
  // images de pacman
  pacmanLeft = loadImage("data/img/pacLeft.png");
  pacmanRight = loadImage("data/img/pacRight.png");
  pacmanUp = loadImage("data/img/pacUp.png");
  pacmanDown = loadImage("data/img/pacDown.png");
  pacmanFull = loadImage("data/img/pacFull.png");
  
  pacmanLeftUp = loadImage("data/img/pacLeftUp.png");
  pacmanRightUp = loadImage("data/img/pacRightUp.png");
  pacmanUpUp = loadImage("data/img/pacUpUp.png");
  pacmanDownUp = loadImage("data/img/pacDownUp.png");
  // images d'effet de mort
  pac1 = loadImage("data/img/1.png");
  pac2 = loadImage("data/img/2.png");
  pac3 = loadImage("data/img/3.png");
  pac4 = loadImage("data/img/4.png");
  pac5 = loadImage("data/img/5.png");
  pac6 = loadImage("data/img/6.png");
  pac7 = loadImage("data/img/7.png");
  pac8 = loadImage("data/img/8.png");
  pac9 = loadImage("data/img/9.png");
  pac10 = loadImage("data/img/10.png");
  pac11 = loadImage("data/img/11.png");
  // fantomes
  red = loadImage("data/img/redDown.png");
  blue = loadImage("data/img/blueDown.png");
  orange = loadImage("data/img/orangeDown.png");
  pink = loadImage("data/img/pinkDown.png");
  // bonus et logo
  cerise = loadImage("data/img/cerise.png");
  title = loadImage("data/img/title.png");
  titleStart = loadImage("data/img/titleStart.png");
  
  wGhost = loadImage("data/img/wGhost.png");
  bGhost = loadImage("data/img/bGhost.png");

  // mange un super dot
  boosted = false;
  superScore = 200;

  // scores
  sortedScores = new Score[highestScores.length];
  for (int i=0; i<highestScores.length; i++) {
    String[] scoreActuel = split(highestScores[i], " ");
    Score s = new Score(int(scoreActuel[0]), scoreActuel[1]);
    sortedScores[i] = s;
  }
  sortedScores = insertionSort(sortedScores);
  

  // pour le bonus
  bonusX = random(board.nbCellsX);
  bonusY = random(board.nbCellsY);
  posX = int(bonusX);
  posY = int(bonusY);
  // utile => save le score meme si defaite
  utile = 0;
}

void draw() {
  if (askName == true) {
    background(0, 0, 30);
    stroke(255);
    strokeWeight(3);
    noFill();
    rectMode(CENTER);
    rect(width/2, height/1.5, 300, 50);
    noStroke();
    fill(255);
    imageMode(CENTER);
    image(titleStart, width/2, height/2.7, 640, 192);
    textFont(f, 12);
    fill(255);
    text("lou bell production", width/2.5-40, height/1.1);
    textFont(f, 16);
    text("Press enter to start", width/3.35, height/1.27);
    
    if (millis() > blinkTimer*2) {
      noFill();
      noStroke();
      if (millis() > (blinkTimer*2)+500) {
        blinkTimer += 500;
      }
    } else if (millis() > blinkTimer) {
      fill(255);
      stroke(255);
    } 
    line(posXBarre, height/1.54, posXBarre, height/1.46);
    textFont(f, 16);
    text(partie.nom, width/2.85-2, height/1.48);
    
  } else if (isMenu == true) {
    game.drawIt();
    menu.drawIt();
    direction = 'i';
  } else {
    // change l'ambiance si mange un super dot
    if (boosted == false) {
      background(0, 0, 30);
    } else {
      background(30, 30, 80);
    }

    game.drawIt();
  }
}

void keyPressed() {
  if(keyPressed && askName == true && nbCharMax > 0 && ((key >= 97 && key <= 123) || (key >= 'A' && key <= 'Z')) ){
    partie.nom += key;
    nbCharMax -= 1;
    posXBarre += 17;
  } 
  if(keyPressed && askName == true && nbCharMax < 5 && key == 8){
    partie.nom = partie.nom.substring(0, partie.nom.length()-1);
    nbCharMax += 1;
    posXBarre -= 17;
  }
  if(keyPressed && askName == true && nbCharMax < 5 && key == 10){
    askName = false;
    tempsJeu = millis();
    tSortie = millis();
    temps = millis();
    tempsF = millis();
  }
  if (keyPressed && askName == false && isMenu == false && win == false && lost == false && millis() > tempsJeu +2000) {
    pacman.move();
  }
  if (keyPressed && askName == false && isMenu == false && (lost == true || win == true) && key == 10) {
    game.newGame();
    loop();
  }
  if (isMenu == true && askName == false && keyPressed) {
    menu.changeSelect();
  }
  if (isMenu == true && askName == false && keyPressed && showSavedLvl == true) {
    menu.changeSelectLvl();
  }
  if (isMenu == true && askName == false && showBestScores == true && keyPressed && key == 27) {
    showBestScores = false;
    key = 0;
  } else if (isMenu == true && askName == false && showSavedLvl == true && keyPressed && key == 27) {
    showSavedLvl = false;
    key = 0;
  } else if (isMenu == true && askName == false && showBestScores == false && keyPressed && key == 27) {
    isMenu = false;
    tSortie = millis();
    key = 0;
  } else if (isMenu == true && showBestScores == false && showSavedLvl == false && showBestScores == false && keyPressed && key == 113) {
    exit();
  } else if (isMenu == false && askName == false && keyPressed && key == 27) {
    isMenu = true;
    key = 0;
  } 
  if (keyPressed && askName == false && isMenu == true && showSavedLvl == true && key == 10) {
    String[] level = split(listeSauvegardes[menu.selectedSave], " ");
    String[] a = loadStrings("./levels/"+level[0]+".txt");
    game.loadGame(a);
    partie.score = int(level[1]);
    nbVies = int(level[2]);
    nbPtVieSupp = 1000;
  } else if (keyPressed && isMenu == true && key == 10) {
    switch(menu.selected) {
    case 1:
      game.newGame();
      isMenu = false;
      break;
    case 2:
      fill(255);
      noStroke();
      rect(width/1.5, height/2.2, 175, 55);
      noFill();
      text("save", width/1.5, height/2.2+5);
      game.saveGame();
      break;
    case 3:
      showSavedLvl = true;
      break;
    case 4:
      showBestScores = true;
      break;
    }
  }
}

Score[] insertionSort(Score[] array){
  for (int i=1; i < array.length; i++){
    int compteur = i;
    // on verifie si un element < a celui d'avant:
    // si c'est le cas on les permute et on reteste le meme el avec celui d'encore avant
    while (compteur != 0 && array[compteur].score > array[compteur-1].score){
      Score temp = array[compteur-1];          // temp = b
      array[compteur-1] = array[compteur];  // b = a
      array[compteur] = temp;              // a = temp
      compteur -= 1; // permet de rester sur le meme element apres la permutation
    }
  }
  return array;
}
