"
A MBSpecInfo holds information on Metacello specifications.

Instance Variables
	configurationInfo:		the object holding information on the whole configuration.
	spec:		the specification of this object (a MetacelloSpec).

"
Class {
	#name : #MBSpecInfo,
	#superclass : #MBInfo,
	#instVars : [
		'spec',
		'configurationInfo'
	],
	#category : #Versionner-Core-Model,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:38'
}
MBSpecInfo class>>spec: aMetacelloSpec [
	"Create an instance of myself with the given spec"

	^(super new) spec: aMetacelloSpec
]

{
	#category : #commands,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBSpecInfo>>cmdLoadSpecCommand [
	<command>
	^ MBLoadPackageCommand
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBSpecInfo>>configurationInfo [
	^ configurationInfo
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBSpecInfo>>configurationInfo: anObject [
	configurationInfo := anObject
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBSpecInfo>>currentVersionMismatch [

	^false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBSpecInfo>>isDirty [
	| wc |
	wc := self workingCopy.
	wc ifNil: [ ^false ].
	^wc needsSaving
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBSpecInfo>>packageName [

	^self name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBSpecInfo>>project [
	"Answer the MetacelloProject associated with the receiver."
	
	^self spec project
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBSpecInfo>>spec [

	^spec
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBSpecInfo>>spec: aMetacelloSpec [

	spec := aMetacelloSpec 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBSpecInfo>>typeLabel [

	^''
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBSpecInfo>>validate [

	^nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBSpecInfo>>validationIcon [

	^nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBSpecInfo>>validationIconSymbol [

	^#blank
]
