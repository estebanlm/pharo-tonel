"

"
Class {
	#name : #MetacelloVersionDiffReport,
	#superclass : #Object,
	#instVars : [
		'additions',
		'configuration',
		'modifications',
		'removals',
		'from',
		'to'
	],
	#category : #Metacello-Core-Model,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionDiffReport>>additions [
	additions ifNil: [ additions := Dictionary new ].
	^ additions
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionDiffReport>>additions: anObject [
	additions := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionDiffReport>>configuration [
	^ configuration
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionDiffReport>>configuration: anObject [
	configuration := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionDiffReport>>from [
	^ from
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionDiffReport>>from: anObject [
	from := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionDiffReport>>modifications [
	modifications ifNil: [ modifications := Dictionary new ].
	^ modifications
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionDiffReport>>modifications: anObject [
	modifications := anObject
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionDiffReport>>printOn: aStream [
	| printBlock |
	printBlock := [ :pkgName :ar | 
	aStream
		tab: 2;
		nextPutAll: pkgName asString;
		cr.
	aStream
		tab: 3;
		nextPutAll: (ar at: 1) asString printString;
		nextPutAll: ' to ';
		nextPutAll: (ar at: 2) asString printString;
		cr ].
	aStream
		nextPutAll: self configuration asString;
		space;
		nextPutAll: from asString printString;
		nextPutAll: ' to ';
		nextPutAll: to asString printString;
		cr.
	aStream
		tab;
		nextPutAll: 'Additions:';
		cr.
	self additions keysAndValuesDo: printBlock.
	aStream
		tab;
		nextPutAll: 'Modifications:';
		cr.
	self modifications keysAndValuesDo: printBlock.
	aStream
		tab;
		nextPutAll: 'Removals:';
		cr.
	self removals keysAndValuesDo: printBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionDiffReport>>removals [
	removals ifNil: [ removals := Dictionary new ].
	^ removals
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionDiffReport>>removals: anObject [
	removals := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionDiffReport>>to [
	^ to
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionDiffReport>>to: anObject [
	to := anObject
]
