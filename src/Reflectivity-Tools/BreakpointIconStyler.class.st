"
I'm in charge to style an ast when there are breakpoints
"
Class {
	#name : #BreakpointIconStyler,
	#superclass : #IconStyler,
	#category : #Reflectivity-Tools-Breakpoints,
	#timestamp : 'mcamp 11/17/2015 11:57'
}

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:28'
}
BreakpointIconStyler>>highlightColor [
	^(Color red alpha: 0.1)
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:28'
}
BreakpointIconStyler>>iconBlock: aNode [
	^[ :seg | 
		Breakpoint removeFrom: aNode.
		seg delete]
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:28'
}
BreakpointIconStyler>>iconFor: aNode [
	^ self iconNamed: #haltIcon 
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:28'
}
BreakpointIconStyler>>iconLabel: aNode [
	^ 'Breakpoint'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:28'
}
BreakpointIconStyler>>shouldStyleNode: aNode [
	^aNode hasBreakpoint
]
