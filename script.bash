#!/bin/bash                                                                                                                                                           
	flags=`grep ^flags /proc/cpuinfo | uniq | cut -d':' -f2 | cut -d" " -f2- | tr _ . | tr "a-z" "A-Z"`                                                                                                                                                   
	ml icc
		for flag in $flags; do
			icc -O1 -x$flag fibonacci.cpp -o test.out 2> error
				if [ ! -s "error" ]; then #check if error occured - so the flag is compatible
					for o in {1..3}; do
						echo "---------------------------" 
						echo "$flag with -O$o"             
						time `icc -O$o -x$flag fibonacci.cpp`
						echo "*******************************"
						echo "file executed for 5 times in"
						time `for i in {1..5}; do ./a.out >/dev/null; done`
					done
				fi
		done;