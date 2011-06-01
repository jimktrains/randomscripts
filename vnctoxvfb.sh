#Instructions on how to create a screenbuffer and vnc
#to it

#I then normally run selenium in it so it doesn't take over
#my desktop

#Terminal 1:
export DISPLAY=:1
Xvfb :1 -screen 0 1024x768x16 &
fluxbox & #or any window manager, pref lightweight
x11vnc -connect localhost:3 -port 5903

#Terminal 2:
vncviewer localhost:1

#Terminal 3:
cd ~/selenium-server-1.0.3
DISPLAY=:1 java -jar selenium-server.jar

