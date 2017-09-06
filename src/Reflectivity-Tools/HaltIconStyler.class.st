"
I'm in charge to style  the editor for  a ""self halt"".
"
Class {
	#name : #HaltIconStyler,
	#superclass : #IconStyler,
	#category : #Reflectivity-Tools-Breakpoints,
	#timestamp : 'MarcusDenker 6/18/2016 07:05'
}

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:28'
}
HaltIconStyler>>highlightColor [
	^(Color red alpha: 0.1)
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:28'
}
HaltIconStyler>>iconFor: aNode [
	^ self iconNamed: #haltIcon 
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:28'
}
HaltIconStyler>>iconLabelBlock: aNode [
	^ ['halt']
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:28'
}
HaltIconStyler>>shouldStyleNode: aNode [
	^aNode isMessage and: [ aNode selector = 'halt']
]
