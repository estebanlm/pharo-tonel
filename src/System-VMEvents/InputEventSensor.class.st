"
An InputEventSensor is a replacement for the old Morphic EventSensor framework.
It updates its state when events are received so that all state based users of Sensor (e.g., Sensor keyboard, Sensor leftShiftDown, Sensor mouseButtons) will work exactly as before. The usage of these funtions is discouraged. 

Instance variables:
	mouseButtons <Integer>	- mouse button state as replacement for primMouseButtons
	mousePosition <Point>	- mouse position as replacement for primMousePt
	eventQueue <SharedQueue>	- an optional event queue for event driven applications
	modifiers		<Integer>	- modifier states

Class variables:

	ButtonDecodeTable

	KeyDecodeTable

"
Class {
	#name : #InputEventSensor,
	#superclass : #InputEventHandler,
	#instVars : [
		'eventQueue',
		'modifiers',
		'mouseButtons',
		'mousePosition'
	],
	#classVars : [
		'ButtonDecodeTable'
	],
	#pools : [
		'EventSensorConstants'
	],
	#category : #System-VMEvents,
	#timestamp : 'michael.rueger 4/22/2009 11:59'
}

{
	#category : #public,
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventSensor class>>default [
	"Answer the default system InputEventSensor, Sensor."

	^ Sensor
]

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventSensor class>>defaultCrossPlatformKeys [
	"Answer a list of key letters that are used for common editing operations
	on different platforms."
	^{ $c . $x . $v . $a . $s . $f . $g . $z }

]

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventSensor class>>installEventSensorFramework [
	"Installs the new sensor framework."
	"InputEventSensor installEventSensorFramework"

	self installEventSensorFramework: InputEventFetcher
]

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventSensor class>>installEventSensorFramework: fetcherClass [
	"Installs the new sensor framework."

	| newSensor |
	"Do some extra cleanup"
	SessionManager default unregisterClassNamed: #InputEventFetcher.
	InputEventFetcher deinstall.

	newSensor := self new.
	fetcherClass install.
	newSensor registerIn: InputEventFetcher default.
	
	"Shut down old sensor"
	Sensor shutDown.
	SessionManager default unregisterClassNamed: Sensor class name.

	"Note: We must use #become: here to replace all references to the old sensor with the new one, since Sensor is referenced from all the existing controllers."
	Sensor becomeForward: newSensor. "done"

	"Register the interrupt handler"
	UserInterruptHandler new registerIn: InputEventFetcher default.

	SessionManager default 
		registerGuiClassNamed: Sensor class name 
		atPriority: 20.
	"Project spawnNewProcessAndTerminateOld: true"
]

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventSensor class>>installMouseDecodeTable [
	"Create a decode table that swaps the lowest-order 2 bits"
	ButtonDecodeTable := self swapMouseButtons
				ifTrue: [ByteArray withAll:
							((0 to: 255) collect: [:i |
								((i bitAnd: 1) << 1
									bitOr: (i bitAnd: 2) >> 1)
										bitOr: (i bitAnd: 16rFC) ])]
				ifFalse: [ByteArray withAll: (0 to: 255)]
]

{
	#category : #'system startup',
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventSensor class>>shutDown [
	self default shutDown.
]

{
	#category : #'system startup',
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventSensor class>>startUp	 [
	self installMouseDecodeTable.
	self default startUp
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventSensor class>>swapMouseButtons [
	^ Smalltalk os isWindows not
]

{
	#category : #mouse,
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventSensor>>anyButtonPressed [
	"Answer whether at least one mouse button is currently being pressed."

	^self mouseButtons anyMask: 7
]

{
	#category : #'modifier keys',
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventSensor>>anyModifierKeyPressed [
	"ignore, however, the shift keys 'cause that's not REALLY a command key"

	^self modifiers anyMask: 16r0E	"cmd | opt | ctrl"
]

{
	#category : #mouse,
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventSensor>>blueButtonPressed [
	"Answer whether only the blue mouse button is being pressed. 
	This is the third mouse button or cmd+click on the Mac."

	^(self mouseButtons bitAnd: 7) = 1

]

{
	#category : #'private events',
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventSensor>>characterForEvent: evtBuf [

	| keycode |
	evtBuf ifNil: [^nil].
	keycode := evtBuf sixth.
	^keycode
		ifNotNil: [Unicode value: keycode]
]

{
	#category : #'modifier keys',
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventSensor>>commandKeyPressed [
	"Answer whether the command key on the keyboard is being held down."

	^self modifiers anyMask: 16r08
]

{
	#category : #'modifier keys',
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventSensor>>controlKeyPressed [
	"Answer whether the control key on the keyboard is being held down."

	^self modifiers anyMask: 16r02
]

{
	#category : #cursor,
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventSensor>>cursorPoint [
	"Answer a Point indicating the cursor location."

	"Fetch the next event if any to update state.
	Makes sure that the old polling methods consume events
	self nextEvent."

	^ mousePosition
]

{
	#category : #events,
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventSensor>>flushAllButDandDEvents [

]

{
	#category : #events,
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventSensor>>flushEvents [
	eventQueue ifNotNil:[eventQueue flush]
]

{
	#category : #keyboard,
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventSensor>>flushKeyboard [
	"Remove all characters from the keyboard buffer."

	[self keyboardPressed]
		whileTrue: [self keyboard]
]

{
	#category : #'private events',
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventSensor>>flushNonKbdEvents [
	eventQueue ifNil: [^ self].
	eventQueue flushAllSuchThat:
		[:buf | (self isKbdEvent: buf) not]
]

{
	#category : #events,
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventSensor>>handleEvent: evt [

	self queueEvent: evt shallowCopy
]

{
	#category : #tablet,
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventSensor>>hasTablet [
	"Answer true if there is a pen tablet available on this computer."

	^ (self primTabletGetParameters: 1) notNil

]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventSensor>>initialize [
        "Initialize the receiver"
        super initialize.
        eventQueue := WaitfreeQueue new.
        mouseButtons := 0.
        mousePosition := 0 @ 0.
        modifiers := 0
]

{
	#category : #joystick,
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventSensor>>joystickButtons: index [

	^ ((self primReadJoystick: index) bitShift: -22) bitAnd: 16r71F
	
]

{
	#category : #joystick,
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventSensor>>joystickOn: index [

	^ (((self primReadJoystick: index) bitShift: -27) bitAnd: 1) ~= 0
	
]

{
	#category : #joystick,
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventSensor>>joystickXY: index [

	| inputWord x y |
	inputWord := self primReadJoystick: index.
	x := (inputWord bitAnd: 16r7FF) - 16r400.
	y := ((inputWord bitShift: -11) bitAnd: 16r7FF) - 16r400.
	^ x@y
	
]

{
	#category : #keyboard,
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventSensor>>keyboard [
	"Answer the next character from the keyboard."

	^self characterForEvent: self nextKeyboardEvent
]

{
	#category : #keyboard,
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventSensor>>keyboardPeek [
	"Answer the next character in the keyboard buffer without removing it, or nil if it is empty."

	^ self characterForEvent: self peekKeyboardEvent
]

{
	#category : #keyboard,
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventSensor>>keyboardPressed [
	"Answer true if keystrokes are available."

	^self peekKeyboardEvent notNil
]

{
	#category : #'private events',
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventSensor>>mapButtons: buttons modifiers: anInteger [
	"Map the buttons to yellow or blue based on the given modifiers.
	If only the red button is pressed, then map
		Ctrl-RedButton -> BlueButton.
		Cmd-RedButton -> YellowButton.
	"
	(buttons = RedButtonBit)
		ifFalse:[^buttons].
	(anInteger allMask: CtrlKeyBit) 
		ifTrue:[^BlueButtonBit].
	(anInteger allMask: CommandKeyBit) 
		ifTrue:[^YellowButtonBit].
	^buttons
]

{
	#category : #'private events',
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventSensor>>modifiers [
	"modifier keys; bitfield with the following entries:
		1	-	shift key
		2	-	ctrl key
		4	-	(Mac specific) option key
		8	-	Cmd/Alt key"

	"Fetch the next event if any to update state.
	Makes sure that the old polling methods consume events"

"	self nextEvent."
	

	^modifiers
]

{
	#category : #'private events',
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventSensor>>mouseButtons [
	"button state; bitfield with the following entries:
		1	-	yellow (e.g., right) button
		2	-	blue (e.g., middle) button
		4	-	red (e.g., left) button
		[all other bits are currently undefined]"

	"Fetch the next event if any to update state.
	Makes sure that the old polling methods consume events"
	self nextEvent.
	
	^mouseButtons
]

{
	#category : #events,
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventSensor>>nextEvent [
	"Return the next event from the receiver."
	| evt |

	evt := eventQueue nextOrNil.
	^ evt ifNotNil: [ self processEvent: evt ]

]

{
	#category : #'private events',
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventSensor>>nextKeyboardEvent [
	"Allows for use of old Sensor protocol to get at the keyboard,
	as when running kbdTest or the InterpreterSimulator in Morphic"

	| evtBuf |
	evtBuf := eventQueue findFirst: [:buf | self isKbdEvent: buf].
	self flushNonKbdEvents.
	^evtBuf
]

{
	#category : #mouse,
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventSensor>>noButtonPressed [
	"Answer whether any mouse button is not being pressed."

	^self anyButtonPressed not

]

{
	#category : #events,
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventSensor>>peekEvent [
	"Look ahead at the next event."
	| nextEvent |
	nextEvent := eventQueue peek.
	^((nextEvent notNil) and: [(nextEvent at: 1) ~= EventTypeMenu])
		ifTrue: [self processEvent: nextEvent]
]

{
	#category : #'private events',
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventSensor>>peekKeyboardEvent [
	"Allows for use of old Sensor protocol to get at the keyboard,
	as when running kbdTest or the InterpreterSimulator in Morphic"

	^eventQueue findFirst: [:buf | self isKbdEvent: buf]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventSensor>>primReadJoystick: index [
	"Return the joystick input word for the joystick with the given index in the range [1..16]. Returns zero if the index does not correspond to a currently installed joystick."

	<primitive: 'primitiveReadJoystick' module: 'JoystickTabletPlugin'>
	^ 0

	
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventSensor>>primTabletGetParameters: cursorIndex [
	"Answer the pen tablet parameters. For parameters that differ from cursor to cursor, answer those associated with the cursor having the given index. Answer nil if there is no pen tablet. The parameters are:
	1. tablet width, in tablet units
	2. tablet height, in tablet units
	3. number of tablet units per inch
	4. number of cursors (pens, pucks, etc; some tablets have more than one)
	5. this cursor index
	6. and 7. x scale and x offset for scaling tablet coordintes (e.g., to fit the screen)
	8. and 9. y scale and y offset for scaling tablet coordintes  (e.g., to fit the screen)
	10. number of pressure levels
	11. presure threshold needed close pen tip switch 
	12. number of pen tilt angles"

	<primitive: 'primitiveGetTabletParameters' module: 'JoystickTabletPlugin'>
	^ nil

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventSensor>>primTabletRead: cursorIndex [
	"Answer the pen tablet data for the cursor having the given index. Answer nil if there is no pen tablet. The data is:
	1. index of the cursor to which this data applies
	2. timestamp of the last state chance for this cursor
	3., 4., and 5. x, y, and z coordinates of the cursor (z is typically 0)
	6. and 7. xTilt and yTilt of the cursor; (signed)
	8. type of cursor (0 = unknown, 1 = pen, 2 = puck, 3 = eraser)
	9. cursor buttons
	10. cursor pressure, downward
	11. cursor pressure, tangential
	12. flags"

	<primitive: 'primitiveReadTablet' module: 'JoystickTabletPlugin'>
	self primitiveFailed

]

{
	#category : #'private events',
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventSensor>>processEvent: evt  [
	"Process a single event. This method is run at high priority."
	| type |
		
	type := evt at: 1.

	"Treat menu events first"
	type = EventTypeMenu
		ifTrue: [
			self processMenuEvent: evt.
			^nil].

	"Tackle mouse events first"
	type = EventTypeMouse
		ifTrue: [
			"Transmogrify the button state according to the platform's button map definition"
			evt at: 5 put: (ButtonDecodeTable at: (evt at: 5) + 1).
			"Map the mouse buttons depending on modifiers"
			evt at: 5 put: (self mapButtons: (evt at: 5) modifiers: (evt at: 6)).

			"Update state for polling calls"
			mousePosition := (evt at: 3) @ (evt at: 4).
			modifiers := evt at: 6.
			mouseButtons := evt at: 5.

			^evt].
	
	
	"Finally keyboard"
	type = EventTypeKeyboard
		ifTrue: [
			"Update state for polling calls"
			modifiers := evt at: 5. 
			^evt].
				
	"Handle all events other than Keyborad or Mouse."
	^evt.
	
]

{
	#category : #'private events',
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventSensor>>processMenuEvent: evt [
	| handler localCopyOfEvt |

	Smalltalk globals at: #HostSystemMenus ifPresent: [ :menus |		
		localCopyOfEvt := evt shallowCopy.
		handler := (menus
			defaultMenuBarForWindowIndex: (localCopyOfEvt at: 8))
			getHandlerForMenu: (localCopyOfEvt at: 3) item: (localCopyOfEvt at: 4).
		handler handler value: localCopyOfEvt ]
]

{
	#category : #'private events',
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventSensor>>queueEvent: evt [
	"Queue the given event in the event queue"
	eventQueue nextPut: evt
]

{
	#category : #mouse,
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventSensor>>redButtonPressed [
	"Answer true if only the red mouse button is being pressed.
	This is the first mouse button, usually the left one."

	^(self mouseButtons bitAnd: 7) = 4

]

{
	#category : #'modifier keys',
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventSensor>>shiftPressed [
	"Answer whether the shift key on the keyboard is being held down."

	^self modifiers anyMask: 16r01

]

{
	#category : #'system startup',
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventSensor>>shutDown [

]

{
	#category : #events,
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventSensor>>someEventInQueue [
	^eventQueue isEmpty not
]

{
	#category : #'system startup',
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventSensor>>startUp [
	self initialize
]

{
	#category : #tablet,
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventSensor>>tabletExtent [
	"Answer the full tablet extent in tablet coordinates."

	| params |
	params := self primTabletGetParameters: 1.
	params ifNil: [^ self error: 'no tablet available'].
	^ (params at: 1)@(params at: 2)

]

{
	#category : #tablet,
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventSensor>>tabletPoint [
	"Answer the current position of the first tablet pointing device (pen, puck, or eraser) in tablet coordinates."

	| data |
	data := self primTabletRead: 1.  "state of first/primary pen"
	^ (data at: 3) @ (data at: 4)

]

{
	#category : #tablet,
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventSensor>>tabletPressure [
	"Answer the current pressure of the first tablet pointing device (pen, puck, or eraser), a number between 0.0 (no pressure) and 1.0 (max pressure)"

	| params data |
	params := self primTabletGetParameters: 1.
	params ifNil: [^ self].
	data := self primTabletRead: 1.  "state of first/primary pen"
	^ (data at: 10) asFloat / ((params at: 10) - 1)

]

{
	#category : #tablet,
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventSensor>>tabletTimestamp [
	"Answer the time (in tablet clock ticks) at which the tablet's primary pen last changed state. This can be used in polling loops; if this timestamp hasn't changed, then the pen state hasn't changed either."

	| data |
	data := self primTabletRead: 1.  "state of first/primary pen"
	^ data at: 2

]

{
	#category : #mouse,
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventSensor>>waitButton [
	"Wait for the user to press any mouse button and then answer with the 
	current location of the cursor."

	| delay |
	delay := Delay forMilliseconds: 50.
	[self anyButtonPressed] whileFalse: [ delay wait ].
	^self cursorPoint

]

{
	#category : #mouse,
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventSensor>>waitButtonOrKeyboard [
	"Wait for the user to press either any mouse button or any key. 
	Answer the current cursor location or nil if a keypress occured."

	| delay |
	delay := Delay forMilliseconds: 50.
	[self anyButtonPressed]
		whileFalse: [delay wait.
			self keyboardPressed
				ifTrue: [^ nil]].
	^ self cursorPoint

]

{
	#category : #mouse,
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventSensor>>waitClickButton [
	"Wait for the user to click (press and then release) any mouse button and 
	then answer with the current location of the cursor."

	self waitButton.
	^self waitNoButton
]

{
	#category : #mouse,
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventSensor>>waitNoButton [
	"Wait for the user to release any mouse button and then answer the current location of the cursor."

	| delay |
	delay := Delay forMilliseconds: 50.
	[self anyButtonPressed] whileTrue: [ delay wait].
	^self cursorPoint

]

{
	#category : #mouse,
	#timestamp : ' 8/31/2017 05:26:10'
}
InputEventSensor>>yellowButtonPressed [
	"Answer whether only the yellow mouse button is being pressed. 
	This is the second mouse button or option+click on the Mac."

	^(self mouseButtons bitAnd: 7) = 2

]
