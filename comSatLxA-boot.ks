//=============================================================================
//| #NAME: COMSAT Lx-A
//| #AUTHOR: Leland Rolofson
//| #DESC: ComSat Lx-A is a slightly modified variant of the default ComSat Lx 
//| craft. This launch script aims to put a satellite in a low kerbin orbit as 
//| one component of a communications network for use with RemoteTech. Make 
//| sure you set the memory of the part to >6000, otherwise the script won't
//| load and you will be very confused.
//|
//| update 8/31/22: i feel like i may have made a mistake in making this a 
//| discrete piece of a larger network. it may have been advantageous to make
//| a single launch vehicle which utilized a synchronous orbit to release
//| multiple craft and then deorbit itself.
//=============================================================================

// SETTING THINGS UP
WAIT UNTIL SHIP:UNPACKED.
WAIT 1.
CLEARSCREEN.
AG2 ON.
WAIT 1.
PRINT "BOOTFILE SUCCESS.".
SET MYTHROTTLE TO 1. // SET THROTTLE TO MAX FOR LAUNCH.
LOCK THROTTLE TO MYTHROTTLE.
SET MYSTEER TO HEADING(90,85). // ALIGN TO INITIAL HEADING.
LOCK STEERING TO MYSTEER.
WAIT 2.

// COUNTDOWN LOOP
PRINT "T MINUS: ".
FROM {local countdown is 3.} UNTIL countdown = 0 STEP {SET countdown to countdown - 1.} DO {
    PRINT "..." + countdown.
    WAIT 1.
}
CLEARSCREEN.
PRINT "LIFTOFF!".

// STAGING TRIGGER
WHEN MAXTHRUST = 0 THEN {
    STAGE.
    PRESERVE.
}

// ASCENT CONTROL LOOP
PRINT "ROLL PROGRAM".

UNTIL ALTITUDE > 1500 {
    SET MYSTEER TO HEADING(90,85).
    SET MYTHROTTLE TO 1.
}

PRINT "GRAVITY TURN START.".

UNTIL APOAPSIS > 50000 {
    SET MYSTEER TO SRFPROGRADE.
    IF ETA:APOAPSIS > 0 {
    SET MYTHROTTLE TO ((SQRT(40/eta:apoapsis))^(1+(eta:apoapsis))). // not entirely sure why this works, but it works
    }
    PRINT "THROTTLE SET: " + ROUND(MYTHROTTLE,2) AT (0,8).
    PRINT "     ETA APO: " + ROUND(ETA:APOAPSIS,2) AT (0,10).
    PRINT "     CUR APO: " + ROUND(APOAPSIS,2) AT (0,11).
    PRINT "    CUR PERI: " + ROUND(PERIAPSIS,2) AT (0,12).
    PRINT "    ALTITUDE: " + ROUND(ALTITUDE,2) AT (0,13).
    PRINT "     BEARING: " + ROUND(SHIP:BEARING,2) AT (0,14).
    PRINT "       PITCH: " + ROUND(SHIP:PROGRADE:PITCH,2) AT (0,15).
}

UNTIL ALTITUDE > 50000 {
    SET MYSTEER TO SRFPROGRADE.
    SET MYTHROTTLE TO (SQRT(50-(ALTITUDE/1000)/APOAPSIS)^(1+(ALTITUDE/1000))).
    PRINT "THROTTLE SET: " + ROUND(MYTHROTTLE,2) AT (0,8).
    PRINT "     ETA APO: " + ROUND(ETA:APOAPSIS,2) AT (0,10).
    PRINT "     CUR APO: " + ROUND(APOAPSIS,2) AT (0,11).
    PRINT "    CUR PERI: " + ROUND(PERIAPSIS,2) AT (0,12).
    PRINT "    ALTITUDE: " + ROUND(ALTITUDE,2) AT (0,13).
    PRINT "     BEARING: " + ROUND(SHIP:BEARING,2) AT (0,14).
    PRINT "       PITCH: " + ROUND(SHIP:PROGRADE:PITCH,2) AT (0,15).
}

UNTIL ALTITUDE > 70000 { // my dumb ass forgetting to change the parameters for the final and causing the script to try to divide by zero once it hit its 87k apoapsis
    SET MYSTEER TO PROGRADE.
    IF APOAPSIS < 70000 {
        SET MYTHROTTLE TO (SQRT(50-(ALTITUDE/1000)/APOAPSIS)^(1+(ALTITUDE/1000))).

    } ELSE IF APOAPSIS < 100000 {
        SET MYTHROTTLE TO (SQRT(80-(ALTITUDE/1000)/APOAPSIS)^(1+(ALTITUDE/1000))).
    } ELSE {
        SET MYTHROTTLE TO 0.
    }
    PRINT "THROTTLE SET: " + ROUND(MYTHROTTLE,2) AT (0,8).
    PRINT "     ETA APO: " + ROUND(ETA:APOAPSIS,2) AT (0,10).
    PRINT "     CUR APO: " + ROUND(APOAPSIS,2) AT (0,11).
    PRINT "    CUR PERI: " + ROUND(PERIAPSIS,2) AT (0,12).
    PRINT "    ALTITUDE: " + ROUND(ALTITUDE,2) AT (0,13).
    PRINT "     BEARING: " + ROUND(SHIP:BEARING,2) AT (0,14).
    PRINT "       PITCH: " + ROUND(SHIP:PROGRADE:PITCH,2) AT (0,15).
}

UNTIL APOAPSIS > 100000 {
    SET MYTHROTTLE TO (SQRT(80-(ALTITUDE/1000)/APOAPSIS)^(1+(ALTITUDE/1000))).
    PRINT "THROTTLE SET: " + ROUND(MYTHROTTLE,2) AT (0,8).
    PRINT "     ETA APO: " + ROUND(ETA:APOAPSIS,2) AT (0,10).
    PRINT "     CUR APO: " + ROUND(APOAPSIS,2) AT (0,11).
    PRINT "    CUR PERI: " + ROUND(PERIAPSIS,2) AT (0,12).
    PRINT "    ALTITUDE: " + ROUND(ALTITUDE,2) AT (0,13).
    PRINT "     BEARING: " + ROUND(SHIP:BEARING,2) AT (0,14).
    PRINT "       PITCH: " + ROUND(SHIP:PROGRADE:PITCH,2) AT (0,15).
}

AG3 ON.
WAIT 5.
AG1 ON.

PRINT "COASTING TO APOAPSIS.".

UNTIL ALTITUDE > 100000 {
    PRINT "THROTTLE SET: " + ROUND(MYTHROTTLE,2) AT (0,8).
    PRINT "     ETA APO: " + ROUND(ETA:APOAPSIS,2) AT (0,10).
    PRINT "     CUR APO: " + ROUND(APOAPSIS,2) AT (0,11).
    PRINT "    CUR PERI: " + ROUND(PERIAPSIS,2) AT (0,12).
    PRINT "    ALTITUDE: " + ROUND(ALTITUDE,2) AT (0,13).
    PRINT "     BEARING: " + ROUND(SHIP:BEARING,2) AT (0,14).
    PRINT "       PITCH: " + ROUND(SHIP:PROGRADE:PITCH,2) AT (0,15).
}   

PRINT "CIRCULARIZING...".

UNTIL PERIAPSIS > 100000 {
    SET MYSTEER TO PROGRADE.
    SET MYTHROTTLE TO ((SQRT(15/eta:apoapsis))^(1+(eta:apoapsis))). //if target eta to apoapse is too low, spacecraft will reach apoapse, making the ETA zero, meaning the program will divide by zero and attempt to push NaN into the stack, leading to circularization failure
    PRINT "THROTTLE SET: " + ROUND(MYTHROTTLE,2) AT (0,8).
    PRINT "     ETA APO: " + ROUND(ETA:APOAPSIS,2) AT (0,10).
    PRINT "     CUR APO: " + ROUND(APOAPSIS,2) AT (0,11).
    PRINT "    CUR PERI: " + ROUND(PERIAPSIS,2) AT (0,12).
    PRINT "    ALTITUDE: " + ROUND(ALTITUDE,2) AT (0,13).
    PRINT "     BEARING: " + ROUND(SHIP:BEARING,2) AT (0,14).
    PRINT "       PITCH: " + ROUND(SHIP:PROGRADE:PITCH,2) AT (0,15).
}

PRINT "CIRCULARIZATION COMPLETE.".
PRINT "GOODBYE.".

WAIT 2.
AG2 ON.

SHUTDOWN.