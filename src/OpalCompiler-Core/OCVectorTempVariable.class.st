"
I model a temp variable that is stored in a temp vector.
"
Class {
	#name : #OCVectorTempVariable,
	#superclass : #OCTempVariable,
	#instVars : [
		'vectorName'
	],
	#category : #OpalCompiler-Core-Semantics,
	#timestamp : 'MarcusDenker 8/11/2014 10:20'
}

{
	#category : #emitting,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCVectorTempVariable>>emitStore: methodBuilder [

	methodBuilder storeRemoteTemp: name inVector: vectorName.
]

{
	#category : #emitting,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCVectorTempVariable>>emitValue: methodBuilder [

	methodBuilder pushRemoteTemp: name inVector: vectorName.
]

{
	#category : #debugging,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCVectorTempVariable>>indexFromIR [
	^scope methodScope node irInstruction indexForVarNamed: name
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCVectorTempVariable>>isRemote [
	^true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCVectorTempVariable>>isTempVectorTemp [
	^true
]

{
	#category : #debugging,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCVectorTempVariable>>readFromContext: aContext scope: contextScope [

	| offset pairVariableVector |
	pairVariableVector := contextScope lookupTempVector: vectorName inContext: aContext.
	offset := pairVariableVector first indexInTempVectorFromIR: name.
	^pairVariableVector second at: offset.
]

{
	#category : #debugging,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCVectorTempVariable>>searchFromContext: aContext scope: contextScope [

	| offset pairVariableVector |
	pairVariableVector := contextScope lookupTempVector: vectorName inContext: aContext.
	offset := pairVariableVector first indexInTempVectorFromIR: name.
	^pairVariableVector second at: offset.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCVectorTempVariable>>vectorName [
	^ vectorName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCVectorTempVariable>>vectorName: anObject [
	vectorName := anObject
]

{
	#category : #debugging,
	#timestamp : ' 8/31/2017 07:16:23'
}
OCVectorTempVariable>>writeFromContext: aContext scope: contextScope value: aValue [
	| tempVectorVar theVector offset |
	tempVectorVar := contextScope lookupVar: vectorName.
	theVector := tempVectorVar readFromContext: aContext scope: tempVectorVar scope.
	offset := tempVectorVar indexInTempVectorFromIR: name.
	^theVector at: offset put: aValue.
]
