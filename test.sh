# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    test.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: obelouch <OB-96@hotmail.com>               +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/01/28 06:15:55 by obelouch          #+#    #+#              #
#    Updated: 2020/01/28 06:46:11 by obelouch         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

for file in champs/*.s
do
	./asm $file
done

mkdir me
mv champs/*.cor me
echo ""

for file in champs/*.s
do
	./42asm $file
done

mkdir there
mv champs/*.cor there

echo ""
echo "\033[1;36m"
echo "---------------------------------"
echo "          MEMORY RAPISTS         "
echo "              Tests              "
echo "---------------------------------"
echo "\033[1;0m"
echo "diff test:"

for mefile in me/*
do
	for therefile in there/*
	do
		if [ $(basename $mefile) == $(basename $therefile) ]
		then	
			echo "\033[1;33m $mefile  \033[1;31m"
			diff -q $therefile $mefile
		fi
	done
done

echo "\033[1;0m"
echo ""
echo "errors test:"

for file in error/*.s
do
	echo "{$file}"
	echo "them:"
	./42asm $file
	echo "you:"
	./asm $file
	echo ""
done

echo "\033[1;0m"
rm -Rf ./me ./there
