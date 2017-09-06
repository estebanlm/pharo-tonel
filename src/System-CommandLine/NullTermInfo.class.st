"
I provide a simple mapping from high-level commands to low-level terminal character sequences.

"
Class {
	#name : #NullTermInfo,
	#superclass : #Object,
	#instVars : [
		'out'
	],
	#category : #System-CommandLine,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:54'
}
NullTermInfo>>on: aStream [
	"Null"
	^self
]

{
	#category : #TermStyle,
	#timestamp : ' 8/31/2017 07:16:54'
}
NullTermInfo>>set: aString [
	^ aString
]
