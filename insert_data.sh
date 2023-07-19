#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo $($PSQL "TRUNCATE TABLE games, teams")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WinGOALS OppGOALS

#Add teams to teams table
do
  if [[ $WINNER != "winner" ]]
  then
    WINNER_NAME=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    #If does not exists, add it.
    if [[ -z $WINNER_NAME ]] #Checks if empty
    then
      INSERT_WINNER_NAME=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      WINNER_NAME=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    fi
  fi

  if [[ $OPPONENT != "opponent" ]]
  then
    OPPONENT_NAME=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    if [[ -z $OPPONENT_NAME ]] #Checks if empty
    then
      INSERT_OPP_NAME=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      OPPONENT_NAME=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    fi
  fi
done

#Add GAMES to games table
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WinGOALS OppGOALS
do
  if [[ $YEAR != "year" ]]
  then
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    INSERT_GAME=$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES($YEAR,'$ROUND',$WINNER_ID,$OPPONENT_ID,$WinGOALS,$OppGOALS)")
  fi
done