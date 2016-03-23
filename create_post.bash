#!/bin/bash

if [ ! -f _posts/$1.md ]; then
	touch _posts/$1.md
	mkdir images/$1
	echo "---" >> _posts/$1.md
	echo "title: " >> _posts/$1.md
	echo "layout: post" >> _posts/$1.md
	echo "tag: " >> _posts/$1.md
	echo "local: $1" >> _posts/$1.md
	echo "---" >> _posts/$1.md
else
	echo "file already exists"
fi

