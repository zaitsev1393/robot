## Robot Simulator Task       

          _,.-Y  |  |  Y-._
      .-~"   ||  |  |  |   "-.
      I" ""=="|" !""! "|"[]""|     _____
      L__  [] |..------|:   _[----I" .-{"-.
     I___|  ..| l______|l_ [__L]_[I_/r(=}=-P
    [L______L_[________]______j~  '-=c_]/=-^
     \_I_j.--.\==I|I==_/.--L_]
       [_((==)[`-----"](==)j
          I--I"~~"""~~"I--I
          |[]|         |[]|
          l__j         l__j
          |!!|         |!!|
          |..|         |..|
          ([])         ([])
          ]--[         ]--[
          [_L]         [_L]  
         /|..|\       /|..|\
        `=}--{='     `=}--{='
       .-^--r-^-.   .-^--r-^-.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

## Information

  "Robot Simulator Task" is a simple little game there you placing Robot
  on the table and move it like you wish.

## Initialization

  At the start you must type "Place" to start app.

     Type "PLACE" first: place

  After that app tell you to input coordinates of the robot start position and view direction like that:

    Place the robot(x, y, f): 1, 2, NORTH

  Robot can move in 4 directions (SOUTH, WEST, NORTH and EAST) and makes
  1 step at the time.

  Soon you'll create robot's field. By default it sets to 5x6 size.



## Controls

  To control the robot use this commands:

  - MOVE
    -- moves robot to direction he watch

    "Robot watches NORTH"          "Robot watches EAST"         
        .  .  .  .  .                  .  .  .  .  .
        .  .  .  .  .                  .  .  .  .  .
        .  .  .  .  .                  .  .  R  .  .
        .  .  .  .  .                  .  .  .  .  .
        R  .  .  .  .                  .  .  .  .  .
    "Robot coords: X: 1 Y: 1"      "Robot coords: X: 3 Y: 3"


  - LEFT
    -- rotate robot left and change his view direction
  - RIGHT
    -- rotate robot right and change his view direction
  - REPORT
    -- Outputs the information about current robot position and viewing direction
  - EXIT
    -- Stops the app

## Caution

Robot can move inside the field and cant to move outside. In case of users
attempts to move robot outside, app will do nothing.

In case of setting robot's start position outside of the field, app will
do nothing till console receive "EXIT" message. Then it will stop.
