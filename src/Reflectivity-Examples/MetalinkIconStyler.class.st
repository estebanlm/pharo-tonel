"
I'm in charge to style an ast when there are metalinks
"
Class {
	#name : #MetalinkIconStyler,
	#superclass : #IconStyler,
	#category : #Reflectivity-Examples,
	#timestamp : 'mcamp 11/17/2015 11:33'
}

{
	#category : #options,
	#timestamp : ' 8/31/2017 05:26:45'
}
MetalinkIconStyler class>>shouldStyle [
	^false
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:45'
}
MetalinkIconStyler>>iconBlock: aNode [
	^[ aNode explore]
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:45'
}
MetalinkIconStyler>>iconFor: aNode [
	^ self iconNamed: #arrowUpIcon.
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:45'
}
MetalinkIconStyler>>iconLabel: aNode [
	^ 'Metalink'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:45'
}
MetalinkIconStyler>>shouldStyleNode: aNode [
	^aNode hasMetalink
]
