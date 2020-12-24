#!/bin/bash


if [ ! -d "$1" ]; then
        mkdir -p Recon/$1
fi

amass enum -passive -norecursive -noalts -d $1 | waybackurls >> Recon/$1/$1.txt
cat Recon/$1/$1.txt | hakrawler -depth 3 -plain >> Recon/$1/$1spider.txt
cat Recon/$1/$1spider.txt Recon/$1/$1.txt | kxss 
rm -fr Recon/$1/$1.txt
