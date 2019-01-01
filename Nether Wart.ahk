#CommentFlag //

numpad0::
WinGet, minecraftPid, PID, Minecraft 1.12.2
SetKeyDelay, 0, 20, Play
SetMouseDelay, 0, Play
speed := .4407227854
distance := 64 // This is the number of blocks fowards the player travels before returning to the starting location.

numpad2::
turnRight()

numpad3::
send {d down}
sleep 2000
send {d up}

numpad4::
WinGet, minecraftPid, PID, Minecraft 1.12.2
ControlClick,, ahk_pid %minecraftPID%,, Left,, D
sleep 1000
ControlClick,, ahk_pid %minecraftPID%,, Left,, U

numpad5::
SetKeyDelay, 50, 50
SetControlDelay -1
WinGet, minecraftPid, PID, Minecraft 1.12.2
sleep 2000
speedFinal := .4407227854
speedFenceFinal := .4918839154
speedFence := .3514
speed := .31480
numIterations := 47
dist := numIterations*2+2

n:= 0

loop {
	loop %numIterations% {
	harvest(speedFence, speedFence, 8, 1)
	plant(speedFence, speedFence, 8, 1)
	moveForwards(speed, 2)
	n++
	if(Mod(n, 8) = 0) {
	sell()
	}
}
moveBackwards(speed,  dist) 
}

numpad6::
SetKeyDelay, 50, 50
WinGet, minecraftPid, PID, Minecraft 1.12.2
ControlSend,, /sell all, ahk_pid %minecraftPID%


harvest(s, sF, distanceX, distanceY) {
	WinGet, minecraftPid, PID, Minecraft 1.12.2
	rightDistanceX := distanceX - .25
	backwardsDistanceY := distanceY - .3
	forwardsDistanceY := distanceY + .2
	ControlSend,, 1, ahk_pid %minecraftPID%
	sleep 100
	harvestMoveRight(s, rightDistanceX)
	moveForwards(s, forwardsDistanceY)
	harvestMoveLeft(sF, distanceX)
	moveBackwards(s, backwardsDistanceY)
	
}

sell() {
	SetKeyDelay, 50, 50
	SetControlDelay -1
	WinGet, minecraftPid, PID, Minecraft 1.12.2
	sleep 500
	ControlSend,, t, ahk_pid %minecraftPID%
	sleep 500
	ControlSend,, /sell all, ahk_pid %minecraftPID%
	sleep 500
	ControlSend,, {enter}, ahk_pid %minecraftPID%
	sleep 500
}

plant(s, sF, distanceX, distanceY) {
	WinGet, minecraftPid, PID, Minecraft 1.12.2
	rightDistanceX := distanceX - .25
	backwardsDistanceY := distanceY - .3
	forwardsDistanceY := distanceY + .2
	ControlSend,, 2, ahk_pid %minecraftPID%
	sleep 100
	plantMoveRight(s, rightDistanceX)
	moveForwards(s, forwardsDistanceY)
	plantMoveLeft(sF, distanceX)
	moveBackwards(s, backwardsDistanceY)
	
}

plantMoveLeft(s, d) {
	WinGet, minecraftPid, PID, Minecraft 1.12.2
	time:= s*d*1000
	time:= time/200
	ControlSend,, {a down}, ahk_pid %minecraftPID%
	loop %time% {
		ControlClick,, ahk_pid %minecraftPID%,, Right,, NA
		sleep 200
	}
	ControlSend,, {a up}, ahk_pid %minecraftPID%
}

plantMoveRight(s, d) {
	WinGet, minecraftPid, PID, Minecraft 1.12.2
	time:= s*d*1000
	time:= time/200
	ControlSend,, {d down}, ahk_pid %minecraftPID%
	loop %time% {
		ControlClick,, ahk_pid %minecraftPID%,, Right,, NA
		sleep 200
	}
	ControlSend,, {d up}, ahk_pid %minecraftPID%
}

moveForwards(s, d) {
	WinGet, minecraftPid, PID, Minecraft 1.12.2
	time:= s*d*1000
	ControlSend,, {w down}, ahk_pid %minecraftPID%
	sleep %time%
	ControlSend,, {w up}, ahk_pid %minecraftPID%
}

moveBackwards(s, d) {
	WinGet, minecraftPid, PID, Minecraft 1.12.2
	time:= s*d*1000
	ControlSend,, {s down}, ahk_pid %minecraftPID%
	sleep %time%
	ControlSend,, {s up}, ahk_pid %minecraftPID%
}

harvestMoveLeft(s, d) {
	WinGet, minecraftPid, PID, Minecraft 1.12.2
	time:= s*d*1000
	time:= time/200
	ControlSend,, {a down}, ahk_pid %minecraftPID%
	loop %time% {
		ControlClick,, ahk_pid %minecraftPID%,, Left,, NA
		sleep 200
	}
	ControlSend,, {a up}, ahk_pid %minecraftPID%
}

harvestMoveRight(s, d) {
	WinGet, minecraftPid, PID, Minecraft 1.12.2
	time:= s*d*1000
	time:= time/200
	ControlSend,, {d down}, ahk_pid %minecraftPID%
	loop %time% {
		ControlClick,, ahk_pid %minecraftPID%,, Left,, NA
		sleep 200
	}
	ControlSend,, {d up}, ahk_pid %minecraftPID%
}

shiftClick(x, y) {
	MouseMove, %x%, %y%
	send {shift down}
	sleep 100
	click
	sleep 100
	send {shift up}
}

turnRight() {
	MouseMove, 600, 0, 0, R
}

