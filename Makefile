all:	out/index.html

out/index.html:	Makefile talk.rst css/talk.css css/talk_dark.css \
 images/pony.jpg images/rob_ford_crack.jpg images/Crack_Gibbon_Small.png \
 images/sp-adam.png images/LoveIsInTheAir.jpg images/saw.png 
	hovercraft talk.rst out

clean:
	rm -rf out/index.html out/js out/css out/images

