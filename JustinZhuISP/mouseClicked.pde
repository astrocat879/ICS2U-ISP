void mouseClicked(){
  if (phase == 0 && mode == 3){
    if (p1turn){        //player 1's turn
      phase = 1;
      int dice = int(random(1, 7));  //generates dice
      fill(0);
      rect(300, 120, 300, 300);  //covers previous text with a rectangle
      fill(255);
      textSize(50);
      text(dice, 400, 200);
      textSize(20);
      text("Space to continue", 400, 300);
      score1 += dice;
      square = score1;
      boardlogic();    //calls board logic to detect if there is a snake or a ladder
      score1 = square;
      pos1y = 500-25; pos1x = 25;   //default original positions (located at bottom left)
      boolean backwards = false;  //if the player should be going to the left
      int tempx = 1, tempy = 1;
      for (int i = 1; i<=score1;i++){      //calculates where the player is on the board
        if (i%10 == 0){    //if divisible by 10, then the player is on a new level
          tempy -= 50;      //moves player "up"
          if (backwards){    //once the player moves up, they move the opposite direction from what they were previously doing
            backwards = false;
          }
          else{
            backwards = true;    
          }
        }
        else if (backwards){
          tempx -= 50;    //moves player "left"
        }
        else{
          tempx += 50;    //moves player "right"
        }
      }
      pos1x += tempx; pos1y += tempy;    //adds the temporary calculated values to the global variables to be used later
    }
    else{      
      phase = 1;      //player 2 phase; identical in almost every way except for colour
      int dice = int(random(1, 7));
      noStroke();
      fill(255);
      rect(300, 120, 300, 300);
      stroke(0);
      fill(0);
      textSize(50);
      text(dice, 400, 200);
      textSize(20);
      text("Space to continue", 400, 300);
      score2 += dice;
      square = score2;
      boardlogic();
      score2 = square;
      pos2y = 500-25; pos2x = 25;
      boolean backwards = false;
      int tempx = 1, tempy = 1;
      for (int i = 1; i<=score2;i++){
        if (i%10 == 0){
          tempy -= 50;
          if (backwards){
            backwards = false;
          }
          else{
            backwards = true;
          }
        }
        else if (backwards){
          tempx -= 50;
        }
        else{
          tempx += 50;
        }
      }
      pos2x += tempx; pos2y += tempy;
    }
  }
  if (phase == 2){
    if (mouseX > 730 && mouseY > 30 && mouseX < 770 && mouseY < 70){    //this is the EXIT button
      mode = 1;    //when pressed, you are returned back to the main menu
      score1 = 0; score2 = 0; turn = 0;    //resets all the variables and the fill
      fill(0);    
    }
    if (p1turn){    //when clicked and in phase 2, phase 0 is triggered
      phase = 0;
      p1turn = false;
    }
    else{
      phase = 0;
      p1turn = true;
    }
  }
  else if (mode == 6){    //in the winner screen, if the mouse is clicked, it returns you back to the main menu
    mode = 1;
    score1 = 0; score2 = 0; turn = 0;    //resets variables
  }
}
