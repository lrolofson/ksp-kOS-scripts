//==============================================================================
//| #NAME: GRAVTURN v2
//| #CREATED: 2021-02-28
//| #AUTHOR: Leland Rolofson
//| #DESCRIPTION: Puts a simple 2-stage vehicle into orbit in a reasonably
//|               efficient fashion. Version 2 is refactored so as to be more
//|               space-efficient.
//==============================================================================
// SETUP
CLEARSCREEN.
SET MYTHROTTLE TO 1.
LOCK THROTTLE TO MYTHROTTLE.
SET MYSTEER TO HEADING(90,90).
LOCK STEERING TO MYSTEER.

// COUNTDOWN LOOP
PRINT "T-MINUS: ".
FROM {LOCAL COUNTDOWN IS 3.} UNTIL COUNTDOWN = 0 STEP {SET COUNTDOWN TO COUNTDOWN - 1.} DO {
    PRINT "..." + COUNTDOWN.
    WAIT 1.
}
CLEARSCREEN.
PRINT "GO FOR LAUNCH.".

//STAGING TRIGGER
WHEN MAXTHRUST = 0 THEN {
    PRINT "STAGING.".
    STAGE.
    PRESERVE.
}

//ASCENT CONTROL LOOP
UNTIL PERIAPSIS > 80000{
    UNTIL ALTITUDE > 1000 {
        SET MYSTEER TO HEADING(90,90).
        SET MYTHROTTLE TO 1. // If we don't set the throttle to max, physics will break our nice math :(
    }
    

}