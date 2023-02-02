class Menu {
  int selected = 1;
  // fleche du menu
  PVector pos1;
  PVector pos2;
  PVector pos3;

  // fleche du load
  PVector p1;
  PVector p2;
  PVector p3;

  int selectedSave;

  Menu() {
    selected = 1;
    pos1 = new PVector(width/4.6, height/2.25);
    pos2 = new PVector(width/4.3, height/2.2);
    pos3 = new PVector(width/4.6, height/2.15);

    selectedSave = 0;
    p1 = new PVector(width/4, height/4.3);
    p2 = new PVector(width/3.85, height/4.15);
    p3 = new PVector(width/4, height/4);
  }

  void changeSelect() {
    if ((key == 'Z') || (key == 'z') || (key == CODED && keyCode == UP)) {
      if (selected != 1 && selected != 2) {
        pos1.y -= 110;
        pos2.y -= 110;
        pos3.y -= 110;
        selected -= 2;
      } else {
        pos1.y += 110;
        pos2.y += 110;
        pos3.y += 110;
        selected += 2;
      }
    } else if ((key == 'S') || (key == 's') || (key == CODED && keyCode == DOWN)) {
      if (selected != 3 && selected != 4) {
        pos1.y += 110;
        pos2.y += 110;
        pos3.y += 110;
        selected += 2;
      } else {
        pos1.y -= 110;
        pos2.y -= 110;
        pos3.y -= 110;
        selected -= 2;
      }
    } else if ((key == 'Q') || (key == 'q') || (key == CODED && keyCode == LEFT)) {
      if (selected == 1 || selected == 3) {
        pos1.x += 250;
        pos2.x += 250;
        pos3.x += 250;
        selected += 1;
      } else {
        pos1.x -= 250;
        pos2.x -= 250;
        pos3.x -= 250;
        selected -= 1;
      }
    } else if ((key == 'D') || (key == 'd') || (key == CODED && keyCode == RIGHT)) {
      if (selected == 2 || selected == 4) {
        pos1.x -= 250;
        pos2.x -= 250;
        pos3.x -= 250;
        selected -= 1;
      } else {
        pos1.x += 250;
        pos2.x += 250;
        pos3.x += 250;
        selected += 1;
      }
    }
  }

  void changeSelectLvl() {
    if ((key == 'Z') || (key == 'z') || (key == CODED && keyCode == UP)) {
      if (selectedSave != 0) {
        p1.y -= 100;
        p2.y -= 100;
        p3.y -= 100;
        selectedSave -= 1;
      } else {
        p1.y += 200;
        p2.y += 200;
        p3.y += 200;
        selectedSave += 2;
      }
    } else if ((key == 'S') || (key == 's') || (key == CODED && keyCode == DOWN)) {
      if (selectedSave != 2) {
        p1.y += 100;
        p2.y += 100;
        p3.y += 100;
        selectedSave += 1;
      } else {
        p1.y -= 200;
        p2.y -= 200;
        p3.y -= 200;
        selectedSave -= 2;
      }
    }
  }

  void drawIt() {
    if (showBestScores == true) {
      rectMode(CORNER);
      noStroke();
      fill(0, 0, 0, 215);
      rect(0, 0, width, height);
      fill(255);
      textAlign(CENTER);
      textFont(f, 18);
      text("Highest scores !", width/2, height/4);
      for (int i=0; i<5; i++) {
        if (sortedScores.length > i) {
          text(sortedScores[i].score + " " + sortedScores[i].nom, width/2, height/4+(i+1)*70);
        }
      }
    } else if (showSavedLvl) {
      rectMode(CORNER);
      noStroke();
      fill(0, 0, 0, 215);
      rect(0, 0, width, height);
      int compteur = 0;
      // pour afficher le nom des sauvegardes
      String[] listeLvl = loadStrings("./data/liste.txt");
      listeSauvegardes = new String[3];
      // si la liste des saves plus grande que 3 on prend les trois plus recentes
      if (listeLvl.length > 3) {
        int j = 0;
        for (int i=listeLvl.length-1; i>listeLvl.length-4; i--) {
          textFont(f, 18);
          fill(255);
          text(listeLvl[i], width/2, height/4+compteur);
          compteur += 100;
          listeSauvegardes[j] = listeLvl[i];
          j += 1;
        }
      } else {
        for (int i=0; i<listeLvl.length; i++) {
          textFont(f, 18);
          fill(255);
          text(listeLvl[i], width/2, height/4+compteur);
          listeSauvegardes[i] = listeLvl[i];
          compteur += 100;
        }
      }
      // pointeur
      noFill();
      stroke(255);
      triangle(p1.x, p1.y, p2.x, p2.y, p3.x, p3.y);
    } else {
      rectMode(CORNER);
      noStroke();
      fill(0, 0, 0, 215);
      rect(0, 0, width, height);
      imageMode(CENTER);
      image(title, width/2+25, height/4);

      // boutons
      rectMode(CENTER);
      strokeWeight(3);
      stroke(255);
      noFill();
      rect(width/2.8, height/2.2, 175, 55);
      rect(width/1.5, height/2.2, 175, 55);
      rect(width/2.8, height/1.7, 175, 55);
      rect(width/1.5, height/1.7, 175, 55);


      triangle(pos1.x, pos1.y, pos2.x, pos2.y, pos3.x, pos3.y);

      // contenus des boutons
      fill(255);
      textFont(f, 14);
      textAlign(CENTER);
      text("Restart", width/2.8, height/2.2+5);
      text("save", width/1.5, height/2.2+5);
      text("load", width/2.8, height/1.7+5);
      text("scores", width/1.5, height/1.7+5);
      
      text("Press q to quit", width/2, height/1.35);
    }

    textFont(f, 12);
    text("lou bell production", width/2, height/1.1);
  }
}
