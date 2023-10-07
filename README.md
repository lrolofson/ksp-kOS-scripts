# ksp-kOS-scripts

This is a collection of scripts I wrote to launch a rocket into Low Kerbin Orbit in Kerbal Space Program. They are still incomplete. Things like data readouts may not work as intended and the launch profile is likely far from optimal. Unfortunately I lost the .craft file at some point. Sorry about that. To make the scripts work, you'll need a copy of Kerbal Space Program (duh) and the kOS mod: https://ksp-kos.github.io/KOS/

Fly safe, and have fun!

## instructions

I am not going to put a whole lot of work into the documentation here. If you need clarification, please open an issue called "your instructions suck and i need help"  or something.

1. Make sure KSP is installed.
2. Make sure kOS is installed.
3. Open the KSP game directory and place the desired .craft file in ./ships
4. Place the desired script file in ./ships/scripts/, making sure to keep the .ks file extension intact
5. Launch KSP and get to the VAB.
6. Load the craft.
7. Hit the launch button.
8. Go!

CONTENTS
========
* comSatLxA.craft   -- slightly modified version of stock ComSat Lx craft
* comSatLxA-boot.ks -- most recent script, goes with comSatLxA.craft. https://www.youtube.com/watch?v=v4bVrRcbPKo
* gravityturn.ks    -- puts a simple 2-stage rocket into LKO
* gravturn2.ks      -- refactored version of gravityturn.ks that was started but never finished
* hello.ks          -- does a countdown and then says hello
* hellolaunch.ks    -- if i remember correctly this one just tries to get the apoapsis up to 100km
