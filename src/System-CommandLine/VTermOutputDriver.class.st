"
I convert high-level terminal commands like moving the cursor or setting the color to characters sequences understood by the terminal.

Furthermore I do some bookkeeping to reduce the number of characters sent to the terminal.

Example of usage:

	out := VTermOutputDriver stdout.
	out << 'normal text'.
	out lf.
	'red text' do: [ :c | out color256: Color red. out << c ].
	out lf.
	'bold text' do: [ :c | out bold. out << c ].
	out clear.
	out lf.
"
Class {
	#name : #VTermOutputDriver,
	#superclass : #Object,
	#instVars : [
		'termcap',
		'outStream',
		'currentBackground',
		'currentColor',
		'light',
		'blink'
	],
	#classInstVars : [
		'stdoutTerminalInstance',
		'stderrTerminalInstance'
	],
	#category : #System-CommandLine,
	#timestamp : 'GuillermoPolito 3/4/2015 16:01'
}

{
	#category : #instance-creation,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver class>>on: anOutputStream [
	^ self new
		outStream: (ZnCrPortableWriteStream on:
			(ZnCharacterWriteStream on: anOutputStream encoding: 'utf8'));
		yourself
]

{
	#category : #instance-creation,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver class>>stderr [
	^ self on: Stdio stderr
]

{
	#category : #instance-creation,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver class>>stdout [
	^ self on: Stdio stdout
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>><< aStringOrCharacter [
	aStringOrCharacter putOn: outStream.
]

{
	#category : #removing,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>backspace [
	outStream nextPut: Character backspace.
	self deleteCharacter 
]

{
	#category : #coloring,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>black [
	self color: 30.
]

{
	#category : #coloring,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>black: aString [
	self black; << aString; flush; clear.
]

{
	#category : #highlighting,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>blinking [
	self termcap: 'mb'
]

{
	#category : #coloring,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>blue [
	self color: 34.
]

{
	#category : #coloring,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>blue: aString [
	self blue; << aString; flush; clear.
]

{
	#category : #highlighting,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>bold [
	" double bright mode "
	self termcap: 'md'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>clear [
	self reset.
	self colorEscape.
]

{
	#category : #removing,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>clearFromBeginning [
	self termcap: 'cb'
]

{
	#category : #removing,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>clearScreen [
	self termcap: 'cl'
]

{
	#category : #removing,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>clearToEnd [
	self termcap: 'ce'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>closed [
	^ outStream isNil or: [ outStream closed ]
]

{
	#category : #coloring,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>color: aColor [
	currentColor := aColor.
	self colorEscape.
]

{
	#category : #escaping,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>colorEscape [
	self csiEscape.
	blink ifTrue: [ outStream nextPutAll: '5;' ].
	outStream print: currentColor.
	(currentBackground == 0) ifFalse: [
		outStream nextPut: $;; print: currentBackground ].
	outStream nextPut: $m.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>columns [
	^ termcap getnum: 'co'
]

{
	#category : #navigating,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>cr [
	self termcap: 'cr'
]

{
	#category : #escaping,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>csiEscape [
	"Control Sequence Introducer escape"
	outStream nextPut: Character escape; nextPut: $[
]

{
	#category : #cursor,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>cursorEnhanced [
	self termcap: 'vs'
]

{
	#category : #cursor,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>cursorInvisible [
	self termcap: 'vi'
]

{
	#category : #cursor,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>cursorNormal [
	self termcap: 've'
]

{
	#category : #coloring,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>cyan [
	self color: 36.
]

{
	#category : #coloring,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>cyan: aString [
	self cyan; << aString; flush; clear.
]

{
	#category : #removing,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>deleteCharacter [
	self termcap: 'dc'
]

{
	#category : #removing,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>deleteLine [
	self termcap: 'dl'
]

{
	#category : #navigating,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>down [
	self termcap: 'do'
]

{
	#category : #navigating,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>down: distance [
	distance < 0
		ifTrue: [ 0 - distance timesRepeat: [ self up ]]
		ifFalse: [ distance timesRepeat: [ self down ]].
]

{
	#category : #mode,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>endInsertMode [
	self termcap: 'ei'
]

{
	#category : #removing,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>erase [
	"outStream nextPutAll:
		(termcap parm: '1' in:
			(termcap getstr: 'ec'))"
	self shouldBeImplemented.
]

{
	#category : #coloring,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>errorColor  [
	self red
]

{
	#category : #escaping,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>escape [
	outStream nextPut: Character escape
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>flush [
	outStream flush.
]

{
	#category : #coloring,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>green [
	self color: 32.
]

{
	#category : #coloring,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>green: aString [
	self green; << aString; flush; clear.
]

{
	#category : #navigating,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>here [
	self flag: #todo. "use termcap here"
	self csiEscape.
	outStream nextPut: $E
]

{
	#category : #navigating,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>home [
	self termcap: 'ho'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>initialize  [
	super initialize.
	termcap := Termcap new.
	self reset.
]

{
	#category : #inserting,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>insertCharacter [
	self termcap:  'ic'
]

{
	#category : #inserting,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>insertLine [
	self termcap: 'al'.
	self lf
]

{
	#category : #mode,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>insertMode [
	self termcap: 'im'
]

{
	#category : #highlighting,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>invisible [
	self termcap: 'mk'
]

{
	#category : #navigating,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>left [
	self termcap:  'le'
]

{
	#category : #navigating,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>left: distance [
	distance < 0
		ifTrue: [ 0 - distance timesRepeat: [ self right ]]
		ifFalse: [ distance timesRepeat: [ self left ]].
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>lf [
	outStream lf
]

{
	#category : #coloring,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>light [
	light := true.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>lines [
	^ termcap getnum: 'li'
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>nextPut: aCharacter  [
	outStream nextPut: aCharacter.
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>nextPutAll: aString [
	outStream nextPutAll: aString
]

{
	#category : #highlighting,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>normal [
	self termcap: 'me'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>outStream [
	^ outStream
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>outStream: stream [
	outStream := stream.
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>overwrite: char [
	self flag: #TODO. "properly implement this"
	outStream nextPut: char
]

{
	#category : #coloring,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>pink [
	self color: 35.
]

{
	#category : #coloring,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>pink: aString [
	self pink; nextPutAll: aString; flush; clear.
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>print: anObject  [
	outStream print: anObject
]

{
	#category : #coloring,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>red [
	self color: 31.
]

{
	#category : #coloring,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>red: aString [
	self red; << aString; flush; clear.
]

{
	#category : #coloring,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>reset [
	currentColor := 0.
	currentBackground := 0.
	light := false.
	blink := false.
]

{
	#category : #navigating,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>restoreCursor [
	self termcap: 'rc'
]

{
	#category : #highlighting,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>reverse [
	self termcap: 'mr'
]

{
	#category : #navigating,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>right [
	self termcap: 'nd'
]

{
	#category : #navigating,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>right: distance [
	distance < 0
		ifTrue: [ 0 - distance timesRepeat: [ self left ]]
		ifFalse: [ distance timesRepeat: [ self right ]].
]

{
	#category : #navigating,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>saveCursor [
	outStream nextPutAll: (termcap getstr: 'sc')
]

{
	#category : #scrolling,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>scrollBackward [
	self termcap: 'sr'
]

{
	#category : #scrolling,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>scrollForward [
	self termcap: 'sf'
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>space [
	outStream space
]

{
	#category : #escaping,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>ss3Escape [
	"Control Sequence Introducer escape"
	outStream nextPut: Character escape; nextPut: $O
]

{
	#category : #navigating,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>startOfLine [
	^ self cr
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>store: anObject  [
	outStream store: anObject
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>tab [
	outStream tab
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>termcap [
	^ termcap
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>termcap: termcapCapabilityIdentifier [
	"Output the termcap command sequence for the identifier.
	Use #basicNextPutAll: to avoid possible conversions applied by the stream"
	outStream basicNextPutAll: (termcap getstr: termcapCapabilityIdentifier)
]

{
	#category : #navigating,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>topLeft [
	self termcap: 'ho'
]

{
	#category : #highlighting,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>underline [
	self termcap: 'us'
]

{
	#category : #highlighting,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>underlineOff [
	self termcap: 'ue'
]

{
	#category : #navigating,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>up [
	self termcap: 'up'
]

{
	#category : #navigating,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>up: distance [
	distance < 0
		ifTrue: [ 0 - distance timesRepeat: [ self down ]]
		ifFalse: [ distance timesRepeat: [ self up ]].
]

{
	#category : #coloring,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>white [
	self color: 37.
]

{
	#category : #coloring,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>white: aString [
	self white; << aString; flush; clear.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>width [
	^ self columns
]

{
	#category : #coloring,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>yellow [
	self color: 33.
]

{
	#category : #coloring,
	#timestamp : ' 8/31/2017 07:16:54'
}
VTermOutputDriver>>yellow: aString [
	self yellow; << aString; flush; clear.
]
