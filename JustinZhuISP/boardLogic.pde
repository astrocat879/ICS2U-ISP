void boardlogic(){  //determines if there is ladder or snake
  if (levelselect == 1){  //first board
    if (square == 36){
      square = 23;
    }
    else if (square == 2){
      square = 56;
    }
    else if (square == 9){
      square = 52;
    }
    else if (square == 40){
      square = 82;
    }
    else if (square == 66){
      square = 94;
    }
    else if (square == 90){
      square = 68;
    }
    else if (square == 98){
      square = 79;
    }
    else if (square == 96){
      square = 45;
    }
  }
  else if (levelselect == 2){  //second board
    if (square == 98){
      square = 79;
    }
    else if (square == 75){
      square = 34;
    }
    else if (square == 47){
      square = 86;
    }
    else if (square == 38){
      square = 62;
    }
    else if (square == 32){
      square = 6;
    }
    else if (square == 36){
      square = 20;
    }
  }
  else if (levelselect == 3){  //third board
    if (square == 61){
      square = 97;
    }
    else if (square == 54){
      square = 84;
    }
    else if (square == 30){
      square = 71;
    }
    else if (square == 32){
      square = 6;
    }
    else if (square == 45){
      square = 0;
    }
    else if (square == 60){
      square = 37;
    }
    else if (square == 87){
      square = 66;
    }
  }
}
