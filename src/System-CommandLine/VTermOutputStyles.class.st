"
I am a SharedPool for the style constants used by VTermOutputDriver
"
Class {
	#name : #VTermOutputStyles,
	#superclass : #SharedPool,
	#classVars : [
		'Blink',
		'Bold',
		'InvisibleFont',
		'ResetStyle',
		'Reverse',
		'Standout',
		'Underline'
	],
	#category : #System-CommandLine,
	#timestamp : 'ValentinRyckewaert 6/24/2016 10:49'
}

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputStyles class>>initialize [
	ResetStyle := '0m'.
	Bold := '1m'.
	Underline := '4m'.
	Blink := '5m'.
	Reverse := '7m'.
	Standout := '1;7m'.
	InvisibleFont := '8m'

	"Home := 'home'.
	SavePosition := 'sc'.
	RestorePosition := 'rc'.
	MoveLeft := 'cub1'.
	InvisibleCursor := 'civis'.
	VisibleCursor := 'cvvis'.
	ClearToEnd := 'e1'.
	ClearFromBegin := 'el1'.
	ClearWholeLine := 'el2'.
	Dim := 'dim'.
	Underlineoff := 'rmul'.
	ClearScreen := 'clear'"
]
