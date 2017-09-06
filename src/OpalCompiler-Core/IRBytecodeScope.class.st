"
I am an internal class used by the  decompiler to recreat variable information
"
Class {
	#name : #IRBytecodeScope,
	#superclass : #Object,
	#instVars : [
		'temps',
		'numArgs',
		'ownTempVectors',
		'copiedValues'
	],
	#category : #OpalCompiler-Core-Bytecode,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRBytecodeScope>>args [
	| args |
	args := Array new: numArgs.
	1 to: numArgs do: [ :idx | args at: idx put: self -> (idx - 1)].
	^ args
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRBytecodeScope>>copiedValues [
	^ copiedValues
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRBytecodeScope>>copiedValues: someCopiedValues [
	copiedValues := someCopiedValues
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRBytecodeScope>>initialize [
	temps := 0.
	ownTempVectors := OrderedCollection new
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRBytecodeScope>>newTempVector: aTempVector at: offset [
	ownTempVectors add: aTempVector.
	self tempAt: offset
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRBytecodeScope>>numArgs [
	^ numArgs
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRBytecodeScope>>numArgs: anInteger [
	numArgs := anInteger.
	temps := temps max: numArgs
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRBytecodeScope>>ownTempVectors [
	^ ownTempVectors
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRBytecodeScope>>tempAt: zeroBasedIndex [
	temps := temps max: zeroBasedIndex + 1.
	^ self -> zeroBasedIndex
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRBytecodeScope>>tempAt: remoteIndex inRemote: remoteArray [
	^ remoteIndex
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
IRBytecodeScope>>temps [
	| result tempOffset numTemps |
	tempOffset := copiedValues size + numArgs.
	numTemps := temps - tempOffset.
	result := Array new: numTemps.
	tempOffset := tempOffset - 1.
	1 to: numTemps do: [ :idx | result at: idx put: self -> (tempOffset + idx)  ].
	ownTempVectors do: [ :tempVector | result at: tempVector index - tempOffset put: tempVector ].
	^ result
]
