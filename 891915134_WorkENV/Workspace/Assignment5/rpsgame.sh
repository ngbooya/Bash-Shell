#! /bin/bash

echo "Rock(1), Paper(2), Scissors(3)!"
echo "Enter your move: "
read humanInput

TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
machineRan=$((RANDOM % 3 + 1))



GAMEDIR="RPS_"$(date +"%B_%Y")
mkdir -p $GAMEDIR



	if [[ "$humanInput" = "1" && "$machineRan" = "2" ]]
		then echo "You played rock, I played paper. I WIN!" 
		echo "You have rock, I have paper. I WIN!__$TIMESTAMP" >> ./$GAMEDIR/Gameplay_$(date "+%B_%d_%a_%H:%M").out 
	
	elif [[ "$humanInput" = "2" && "$machineRan" = "2" ]]
		then echo "You played paper, I played paper. WE TIED!" 
		echo "You have paper, I have paper. WE TIED!__$TIMESTAMP" >> ./$GAMEDIR/Gameplay_$(date "+%B_%d_%a_%H:%M").out
	
	elif [[ "$humanInput" = "3" && "$machineRan" = "2" ]]
		then echo "You played scissors, I played paper. YOU WIN!" 
		echo "You have scissors, I have paper. YOU WIN!__$TIMESTAMP" >> ./$GAMEDIR/Gameplay_$(date "+%B_%d_%a_%H:%M").out
	
	elif [[ "$humanInput" = "1" && "$machineRan" = "1" ]]
		then echo "You played rock, I played rock. WE TIED!" 
		echo "You have rock, I have rock. WE TIED!__$TIMESTAMP" >> ./$GAMEDIR/Gameplay_$(date "+%B_%d_%a_%H:%M").out
	
	elif [[ "$humanInput" = "2" && "$machineRan" = "1" ]]
		then echo "You played paper, I played rock. YOU WIN!" 
		echo "You have paper, I have rock. YOU WIN!__$TIMESTAMP" >> ./$GAMEDIR/Gameplay_$(date "+%B_%d_%a_%H:%M").out
	
	elif [[ "$humanInput" = "3" && "$machineRan" = "1" ]]
		then echo "You played scissors, I played rock. I WIN!" 
		echo "You have scissors, I have rock. I WIN!__$TIMESTAMP" >> ./$GAMEDIR/Gameplay_$(date "+%B_%d_%a_%H:%M").out
	
	elif [[ "$humanInput" = "1" && "$machineRan" = "3" ]]
		then echo "You played rock, I played scissors. YOU WIN!" 
		echo "You have rock, I have scissors. YOU WIN!__$TIMESTAMP" >> ./$GAMEDIR/Gameplay_$(date "+%B_%d_%a_%H:%M").out
	
	elif [[ "$humanInput" = "2" && "$machineRan" = "3" ]]
		then echo "You played paper, I played scissors. I WIN!" 
		echo "You have paper, I have scissors, I WIN!__$TIMESTAMP" >> ./$GAMEDIR/Gameplay_$(date "+%B_%d_%a_%H:%M").out
	
	elif [[ "$humanInput" = "3" && "$machineRan" = "3" ]]
		then echo "You played scissors, I played scissors. WE TIED!" 
		echo "You have scissors, I have scissors. WE TIED!__$TIMESTAMP" >> ./$GAMEDIR/Gameplay_$(date "+%B_%d_%a_%H:%M").out
	
	else 
		echo "**INVALID INPUT***"
		echo "NO GAME INVALID INPUT__$TIMESTAMP" >> ./$GAMEDIR/ERROR_$(date "+%B_%d_%a_%H:%M").out
	fi




