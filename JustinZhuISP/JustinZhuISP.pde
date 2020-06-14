//Justin Zhu
//June 10, 2019
//Ms Basaraba
//This program is a fully featured game of snakes and ladders.

PImage snakes_title, ladders_title, level, background1, background2;      //all var declaration
boolean p1turn = true, buffer = false;    //p1turn: if p1 should go, buffer: if mousePressed doesn't want to be held
int mode = 0, x = 200, x2 = 600, levelselect, score1 = 0, score2 = 0, square, phase = 0, turn = 1;
float pos1y = 500-25, pos1x = 25, pos2y = 500-25, pos2x = 25;   //the positions of the pieces on the board

void setup(){
  size(800, 500);
  background(255);
  textSize(20);  //set default text size for consistancy
  snakes_title = loadImage("snake_title.png");    //loads images for splashscreen
  ladders_title = loadImage("ladder_title.png");
  background1 = loadImage("background1.png");    //loads background for spashscreen and main menu
  background2 = loadImage("background2.png");
}

void draw(){
  if (mode == 0){    //splash sceen and title begin
    title();
    splashScreen();
    if (mousePressed){    //change when mouse is pressed
      mode = 1;         
      delay(50);
      background2 = loadImage("background2.png");
      }
    }
  else if (mode == 1){  //main menu
    mainMenu();
  }
  else if (mode == 3){  //double player
    gameLoop();
  }
  else if (mode == 4){  //instructions
    instructions();
  }
  else if (mode == 5){  //exit
    goodbye();
  }
  else if (mode == 6){  //winner
    winner();
  }
}

void title(){
  image(background1, 0, 0);
  textAlign(CENTER);
  textSize(50);
  fill(0);
  text("Snakes and Ladders", 400, 250);
  textSize(20);
  text("Click anywhere to continue", 400, 300);
}

void splashScreen(){    //animates ladder and snake moving across screen
  x++;
  x2++;
  image(snakes_title, x, 400, width/6, height/4);
  image(ladders_title, x2, 400, width/6, height/4);
  if (x > 820){
    x = -150;
  }
  if (x2 > 820){
    x2 = -150;
  }
}

void mainMenu(){
  image(background2, 0, 0);
  textSize(50);
  text("Snakes and Ladders", 400, 100);
  textSize(30);
  text("1. Play!", 400, 200);
  text("2. Instructions", 400, 250);
  text("3. Exit", 400, 300);
  if (keyPressed){    //detects what mode to go into
    if (key == '1'){    //game
      mode = 3;
      levelselect();
    }
    else if (key == '2'){    //instructions
      mode = 4;
    }
    else if (key == '3'){    //exit
      mode = 5;
    }
  }
}

void instructions(){
  image(background2, 0, 0);
  textSize(50);
  text("How to play", 400, 100);
  textSize(20);
  text("You will take turns with the other player to roll a dice. The number rolled corresponds to the number of steps moved. To roll, click anywhere. Snakes and ladders throughout the 10 by 10 grid can bring you up or down the grid. This game is best played with someone else. Watch out!", 100, 150, 600, 400);
  text("Click anywhere to go back", 400, 400);
  if (mousePressed){
    mode = 1;
  }
}

void goodbye(){
  image(background2, 0, 0);    //loads background and text
  textSize(60);
  text("Exit?", 400, 150);
  textSize(30);
  text("(Y)es", 300, 250);
  text("(N)o", 500, 250);
  textSize(15);
  fill(100);
  text("Game made by Justin Zhu. Thanks for playing!", 400, 450);  //my name and program description
  fill(0);
  if (keyPressed){      //checks if user wants to exit or not
    if (key == 'Y' || key == 'y'){
      exit();
    }
    else if (key == 'N' || key == 'n'){
      mode = 1;
      delay(100);
    }
  }
}
