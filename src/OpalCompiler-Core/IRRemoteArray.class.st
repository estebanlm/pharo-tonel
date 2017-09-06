"
I model the TempVector for the decompiler
"
Class {
	#name : #IRRemoteArray,
	#superclass : #Object,
	#instVars : [
		'size',
		'index'
	],
	#category : #OpalCompiler-Core-Bytecode,
	#timestamp : '<historical>'
}

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRRemoteArray>>do: aBlock [
	1 to: size do: [ :idx | aBlock value: (idx - 1) ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRRemoteArray>>index [
	^ index
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRRemoteArray>>index: anIndex [
	index := anIndex
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRRemoteArray>>indexOf: anInteger [
	^anInteger + 1.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRRemoteArray>>size [
	^ size
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRRemoteArray>>size: aSize [
	size := aSize
]
