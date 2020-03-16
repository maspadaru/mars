#!/bin/bash

################ Build ##########
./mars.sh b

################ Run ###########
./mars.sh r S samples/simple.ares samples/simple.stream output.txt
cat output.txt

./mars.sh r S samples/steam_generator.ares samples/steam_generator.stream output.txt
cat output.txt

./mars.sh r R samples/bicycle.ares samples/bicycle.stream output.txt
cat output.txt

rm output.txt
