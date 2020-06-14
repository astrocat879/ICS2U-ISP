void levelselect(){
  levelselect = int(random(1, 4));
  level = loadImage(str(levelselect) + ".png");  //randomizes level
}

void boardanim(){  //plays out what happens on the board
  background(255);
  fill(230);
  rect(500, 0, 300, 500);    //draws rectagles that create formatting
  rect(500, 0, 200, 500);
  stroke(0);
  line(730, 30, 770, 70);
  line(730, 70, 770, 30);
  textSize(25);
  fill(0);
  image(level, 0, 0);
  text("Player 1:", 600, 100);    //displays score of both players
  text("Square: " + score1, 600, 150);
  text("Player 2:", 600, 300);
  text("Square: " + score2, 600, 350);
  text("Turn:", 750, 250);    //displays turn
  text(turn, 750, 290);
  textSize(15);
  fill(100);
  text("Click to continue", 600, 450);
  fill(200);
  ellipse(pos1x, pos1y, 30, 30);    //draws player characters
  fill(50);
  ellipse(pos2x, pos2y, 30, 30);
  fill(0);
  text(1, pos1x, pos1y+5);
  fill(255);
  text(2, pos2x, pos2y+5);
}

void gameLoop(){
  if (p1turn){  //when it's player 1's turn
    p1turn();
  }
  else{  //when it's player 2's turn
    p2turn();
  }
}

void p1turn(){  //player 1 turn
  if (phase == 0){
    background(0);    //rolling phase of p1
    fill(255);
    textSize(50);
    text(int(random(1, 7)), 400, 200); //generates dice animation
    textSize(20);
    text("Click to roll", 400, 300);
    text("Player 1's turn", 400, 100);
  }
  else if (phase == 1){    //"continue" phase
    if (keyPressed){
      phase = 2;  //changes phase to board anim phase
      turn += 1;
      if (score1 > 99 || score2 > 99){  //checks if anyone has won yet
        mode = 6;     //winner mode
      }
    }
  }
  else if (phase == 2){    //board animation phase
    boardanim();    //plays out everything that happens on the board
  }
}

void p2turn(){    //player 2 turn
  if (phase == 0){    //rolling phase
    background(255);    //different colour scheme than player 1
    fill(0);
    textSize(50);
    text(int(random(1, 7)), 400, 200);  //dice roll animation
    textSize(20);
    text("Click to roll", 400, 300);
    text("Player 2's turn", 400, 100);
  }
  else if (phase == 1){  //"continue" phase
    if (keyPressed){
      phase = 2;    //changes phase t
      turn += 1;
      if (score1 > 99 || score2 > 99){  //checks if anyone has won
        mode = 6;
      }
    }
  }
  else if (phase == 2){    //board animation phase
    boardanim();
  }
}

void winner(){    //once someone exceeds square 99
  background(0);
  fill(255);
  textSize(50);
  if (score1 > 99){    //based on who won, it will output who won
    text("Player 1 won!", 400, 250);
  }
  else if (score2 > 99){
    text("Player 2 won!", 400, 250);
  }
  textSize(20);
  fill(120);  
  text("Click to main menu", 400, 400);  //prompt for clicking
  fill(0);
}
