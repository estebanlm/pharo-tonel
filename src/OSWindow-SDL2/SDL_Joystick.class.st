"
I represent a handler for a joystick coming from SDL2.
"
Class {
	#name : #SDL_Joystick,
	#superclass : #SDL2Handle,
	#pools : [
		'SDL2Constants',
		'SDL2Types'
	],
	#category : #OSWindow-SDL2-Bindings,
	#timestamp : 'RonieSalgado 10/12/2014 17:39'
}

{
	#category : #closing,
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_Joystick>>close [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( void SDL_JoystickClose(self ) )
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_Joystick>>getAttached [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( SDL_bool SDL_JoystickGetAttached(self) )
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_Joystick>>getAxis: axis [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( Sint16 SDL_JoystickGetAxis(self , int axis) )
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_Joystick>>getButton: button [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( Sint16 SDL_JoystickGetButton(self , int button) )
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_Joystick>>isGameController [
	^ false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_Joystick>>name [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( String SDL_JoystickName(self) )
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_Joystick>>numberOfAxes [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( int SDL_JoystickNumAxes(self) )
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_Joystick>>numberOfBalls [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( int SDL_JoystickNumBalls(self) )
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_Joystick>>numberOfButtons [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( int SDL_JoystickNumButtons(self) )
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL_Joystick>>numberOfHats [
	<primitive: #primitiveNativeCall module: #NativeBoostPlugin error: errorCode>
	^ self nbCall: #( int SDL_JoystickNumHats(self) )
]
