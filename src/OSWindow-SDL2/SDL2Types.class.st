"
Various types used by SDL2
"
Class {
	#name : #SDL2Types,
	#superclass : #SharedPool,
	#classVars : [
		'Int16',
		'Int32',
		'Int64',
		'Int8',
		'SDL_GLattr',
		'SDL_Keycode',
		'SDL_Keymod',
		'SDL_Scancode',
		'Sint16',
		'Sint32',
		'Sint64',
		'Sint8',
		'Uint16',
		'Uint32',
		'Uint64',
		'Uint8'
	],
	#category : #OSWindow-SDL2-Bindings,
	#timestamp : 'IgorStasenko 7/30/2014 18:45'
}

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 05:26:40'
}
SDL2Types class>>initialize [
	"
	self initialize
	"
	Uint8 := #uint8.
	Int8 := #int8.
	Sint8 := #int8.
	Uint16 := #uint16.
	Int16 := #int16.
	Sint16 := #int16.
	Uint32 := #uint32.
	Int32 := #int32.
	Sint32 := #int32.
	Uint64 := #uint64.
	Int64 := #int64.
	Sint64 := #int64.
	
	SDL_Keycode := Sint32.
	SDL_Keymod := Uint32.
	SDL_Scancode := Uint32.
	
	SDL_GLattr := #int.
]
