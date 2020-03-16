#!/bin/bash

EXECUTABLE=mars-build/mars

make_mars() {
    mkdir -p cmake-build-release/mars-build
    cd cmake-build-release/mars-build
    cmake -DCMAKE_BUILD_TYPE=Release ../..
    make mars 
    cd ../..
}

run_mars () {
    cmake-build-release/$EXECUTABLE $1 $2 $3 $4
}

clean_up () {
    rm -rf cmake-build-release
}

print_help () {
    echo "Usage: laser [b r c h]"
    echo "b: Build mars"
    echo "r: Run mars"
    echo "c: Clean project"
    echo "h: Print help"
    echo " Option [r] requires additional arguments:"
    echo " chase_algorithm=(S/R) stream_file_path [output_file_path]"
    echo " "

}

if [ $# -eq 0 ]; then 
	print_help 
elif [ $1 = "b" ]; then
    make_mars
elif [ $1 = "r" ]; then
    run_mars "$2" "$3" "$4" "$5"
elif [ $1 = "c" ]; then
    clean_up
elif [ $1 = "h" ]; then
    print_help
else
	print_help
fi
