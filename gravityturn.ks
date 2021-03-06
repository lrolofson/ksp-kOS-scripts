//==============================================================================
//| GRAVITYTURN.ks
//| CREATED: 2021-02-27
//| AUTHOR: LELAND ROLOFSON
//| DESCRIPTION: EXECUTES A GRAVITY TURN ON A SIMPLE 2-STAGE LAUNCH VEHICLE.
//==============================================================================
// SETTING THINGS UP
CLEARSCREEN.
SET MYTHROTTLE TO 1. // SET THROTTLE TO MAX FOR LAUNCH.
LOCK THROTTLE TO MYTHROTTLE. // LOCK THE VEHICLE'S THROTTLE TO OUR THROTTLE VAR
SET MYSTEER TO HEADING(90,90). // POINT STRAIGHT UP.
LOCK STEERING TO MYSTEER. // SAME AS BEFORE BUT WITH STEERING

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
    PRINT "STAGING.".
    STAGE.
    PRESERVE.
}

// ASCENT CONTROL LOOP
PRINT "ROLL PROGRAM".

UNTIL ALTITUDE > 1000 {
    SET MYSTEER TO HEADING(90,90).
    SET MYTHROTTLE TO 1.
}

PRINT "BEGIN GRAVITY TURN.".
UNTIL ALTITUDE > 2000{
SET MYSTEER TO HEADING (90,88).
}

UNTIL APOAPSIS > 50000 {
    SET MYSTEER TO SRFPROGRADE.
    IF ETA:APOAPSIS > 0 {
    SET MYTHROTTLE TO ((SQRT(30/eta:apoapsis))^(1+(eta:apoapsis))). // holy shit this works. well, even. hot damn.
    }
    PRINT "THROTTLE SET: " + ROUND(MYTHROTTLE,2) AT (0,20).
    PRINT "     OBT VEL: " + SHIP:VELOCITY:OBT at (0,21).
    PRINT "ETA APOAPSIS: " + ROUND(ETA:APOAPSIS,2) AT (0,22).
    PRINT "CUR APOAPSIS: " + ROUND(APOAPSIS,2) AT (0,23).
    PRINT "    ALTITUDE: " + ROUND(ALTITUDE,2) AT (0,24).
    PRINT "     BEARING: " + ROUND(SHIP:BEARING,2) AT (0,25).
    PRINT "       PITCH: " + ROUND(SHIP:PROGRADE:PITCH,2) AT (0,26).
}

UNTIL ALTITUDE > 50000 {
    SET MYSTEER TO SRFPROGRADE.
    SET MYTHROTTLE TO (SQRT(50-(ALTITUDE/1000)/APOAPSIS)^(1+(ALTITUDE/1000))).
    PRINT "THROTTLE SET: " + ROUND(MYTHROTTLE,2) AT (0,20).
    PRINT "     OBT VEL: " + SHIP:VELOCITY:OBT at (0,21).
    PRINT "ETA APOAPSIS: " + ROUND(ETA:APOAPSIS,2) AT (0,22).
    PRINT "CUR APOAPSIS: " + ROUND(APOAPSIS,2) AT (0,23).
    PRINT "    ALTITUDE: " + ROUND(ALTITUDE,2) AT (0,24).
    PRINT "     BEARING: " + ROUND(SHIP:BEARING,2) AT (0,25).
    PRINT "       PITCH: " + ROUND(SHIP:PROGRADE:PITCH,2) AT (0,26).
}

UNTIL ALTITUDE > 70000 { 
    SET MYSTEER TO PROGRADE.
    IF APOAPSIS < 70000 {
        SET MYTHROTTLE TO (SQRT(50-(ALTITUDE/1000)/APOAPSIS)^(1+(ALTITUDE/1000))).

    } ELSE IF APOAPSIS < 80000 {
        SET MYTHROTTLE TO (SQRT(80-(ALTITUDE/1000)/APOAPSIS)^(1+(ALTITUDE/1000))).
    } ELSE {
        SET MYTHROTTLE TO 0.
    }
    PRINT "THROTTLE SET: " + ROUND(MYTHROTTLE,2) AT (0,20).
    PRINT "     OBT VEL: " + SHIP:VELOCITY:OBT at (0,21).
    PRINT "ETA APOAPSIS: " + ROUND(ETA:APOAPSIS,2) AT (0,22).
    PRINT "CUR APOAPSIS: " + ROUND(APOAPSIS,2) AT (0,23).
    PRINT "    ALTITUDE: " + ROUND(ALTITUDE,2) AT (0,24).
    PRINT "     BEARING: " + ROUND(SHIP:BEARING,2) AT (0,25).
    PRINT "       PITCH: " + ROUND(SHIP:PROGRADE:PITCH,2) AT (0,26).
}

UNTIL APOAPSIS > 80000 {
    SET MYTHROTTLE TO (SQRT(80-(ALTITUDE/1000)/APOAPSIS)^(1+(ALTITUDE/1000))).
    PRINT "THROTTLE SET: " + ROUND(MYTHROTTLE,2) AT (0,20).
    PRINT "     OBT VEL: " + SHIP:VELOCITY:OBT at (0,21).
    PRINT "ETA APOAPSIS: " + ROUND(ETA:APOAPSIS,2) AT (0,22).
    PRINT "CUR APOAPSIS: " + ROUND(APOAPSIS,2) AT (0,23).
    PRINT "    ALTITUDE: " + ROUND(ALTITUDE,2) AT (0,24).
    PRINT "     BEARING: " + ROUND(SHIP:BEARING,2) AT (0,25).
    PRINT "       PITCH: " + ROUND(SHIP:PROGRADE:PITCH,2) AT (0,26).
}

UNTIL ALTITUDE > 80000 {
    PRINT "THROTTLE SET: " + ROUND(MYTHROTTLE,2) AT (0,20).
    PRINT "     OBT VEL: " + SHIP:VELOCITY:OBT at (0,21).
    PRINT "ETA APOAPSIS: " + ROUND(ETA:APOAPSIS,2) AT (0,22).
    PRINT "CUR APOAPSIS: " + ROUND(APOAPSIS,2) AT (0,23).
    PRINT "    ALTITUDE: " + ROUND(ALTITUDE,2) AT (0,24).
    PRINT "     BEARING: " + ROUND(SHIP:BEARING,2) AT (0,25).
    PRINT "       PITCH: " + ROUND(SHIP:PROGRADE:PITCH,2) AT (0,26).
}   

UNTIL PERIAPSIS > 80000 {
    SET MYSTEER TO PROGRADE.
    SET MYTHROTTLE TO ((SQRT(10/eta:apoapsis))^(1+(eta:apoapsis))).
    PRINT "THROTTLE SET: " + ROUND(MYTHROTTLE,2) AT (0,20).
    PRINT "     OBT VEL: " + SHIP:VELOCITY:OBT at (0,21).
    PRINT "ETA APOAPSIS: " + ROUND(ETA:APOAPSIS,2) AT (0,22).
    PRINT "CUR APOAPSIS: " + ROUND(APOAPSIS,2) AT (0,23).
    PRINT "    ALTITUDE: " + ROUND(ALTITUDE,2) AT (0,24).
    PRINT "     BEARING: " + ROUND(SHIP:BEARING,2) AT (0,25).
    PRINT "       PITCH: " + ROUND(SHIP:PROGRADE:PITCH,2) AT (0,26).
}