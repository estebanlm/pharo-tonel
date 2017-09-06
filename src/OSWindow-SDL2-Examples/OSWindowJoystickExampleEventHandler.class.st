"
I am the event handler linked to OSWindowJoystickExample.
"
Class {
	#name : #OSWindowJoystickExampleEventHandler,
	#superclass : #OSWindowGenericRendererExampleEventHandler,
	#category : #OSWindow-SDL2-Examples-Joystick,
	#timestamp : 'RonieSalgado 4/10/2016 03:27'
}

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:44'
}
OSWindowJoystickExampleEventHandler class>>axisDeadZoneThreshold [
	^ 0.20
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:44'
}
OSWindowJoystickExampleEventHandler class>>axisMaxValue [
	^ 32767
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:44'
}
OSWindowJoystickExampleEventHandler>>axisDeadZoneThreshold [
	^ self class axisDeadZoneThreshold
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:44'
}
OSWindowJoystickExampleEventHandler>>axisMaxValue [
	^ self class axisMaxValue
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:44'
}
OSWindowJoystickExampleEventHandler>>normalizeAxisValue: value [
	| result deadZone |
	result := value asFloat / self axisMaxValue.
	deadZone := self axisDeadZoneThreshold.
	(result between: deadZone negated and: deadZone) ifTrue: [ 
		result := 0.0
	] ifFalse: [
		result < 0 ifTrue: [ 
			result := result + deadZone.
		] ifFalse: [ 
			result := result - deadZone.
		].
		result := result / (1.0 - deadZone).
	].

	^ result min: 1.0 max: -1.0
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:44'
}
OSWindowJoystickExampleEventHandler>>visitJoyAxisEvent: axisEvent [
	| axisValue velocity |
	axisEvent isPreferredEvent ifFalse: [ ^ self ].
	
	axisValue := self normalizeAxisValue: axisEvent value.
	velocity := example characterVelocity.
	axisEvent isLeftX ifTrue: [ 
		velocity := (axisValue * 300) @ velocity y
	].

	axisEvent isLeftY ifTrue: [ 
		"Left Y"
		velocity := velocity x @ (axisValue * 300)

	].

	example characterVelocity: velocity
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:44'
}
OSWindowJoystickExampleEventHandler>>visitJoyButtonDownEvent: buttonEvent [
	buttonEvent isPreferredEvent ifFalse: [ ^ self ].
	
	buttonEvent isButtonX ifTrue: [ 
		example shoot.
	].

	buttonEvent isButtonStart ifTrue: [ 
		example reset.
	].

]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:44'
}
OSWindowJoystickExampleEventHandler>>visitJoyButtonUpEvent: buttonUpEvent [
	buttonUpEvent isPreferredEvent ifFalse: [ ^ self ].
	"TODO: Handle button up event."
]
