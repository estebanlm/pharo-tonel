"
I'm an object holding the result of loading a file containing Pharo code definitions in chunk format.
I create ring definitions for the elements inside the chunk stream.
Heavily inspired from FilePackage.

| internalStream |
internalStream := (String new: 1000) writeStream.
SystemOrganization 
	fileOutCategory: 'Tool-ExternalBrowser'
	on: internalStream.
RingChunkImporter fromStream: internalStream contents readStream.
"
Class {
	#name : #RingChunkImporter,
	#superclass : #Object,
	#instVars : [
		'package',
		'doIts'
	],
	#category : #RingChunkImporter,
	#timestamp : 'GuillermoPolito 6/1/2015 10:23'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:17:01'
}
RingChunkImporter class>>fromFileNamed: fileName [

	^ self new fromFileNamed: fileName; yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:17:01'
}
RingChunkImporter class>>fromStream: aStream [

	^ self new fileInFrom: aStream; yourself
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:01'
}
RingChunkImporter>>classDefinition: aString with: chgRec [
	| tokens theClass |
	
	tokens := self scannedSource: aString.
	theClass := self classNamed: tokens third.
	theClass superclassName: tokens first;
			 definitionSource: aString;
			 category: tokens last.
	
	tokens size = 11
	ifTrue:[ theClass instanceVariables: (tokens fifth findTokens: ' ');
			 	classVariables: (tokens seventh findTokens: ' ');
				 sharedPools: (tokens ninth findTokens: ' ') ].
	
	tokens size = 13
	ifTrue:[ theClass traitCompositionSource: (tokens fifth);  
				instanceVariables: (tokens seventh findTokens: ' ');
			 	classVariables: (tokens ninth findTokens: ' ');
				 sharedPools: ((tokens at: 11) findTokens: ' ') ].
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:01'
}
RingChunkImporter>>classNamed: className [

	(package includesClassNamed: className) 
		ifTrue:[ ^ package classNamed: className ].
	^ self createClassNamed: className
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RingChunkImporter>>classes [
	^ package classes values
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:01'
}
RingChunkImporter>>createClassNamed: className [
	| rgClass |
	rgClass := RGClassDefinition named: className.
	rgClass withMetaclass.
	package addClass: rgClass.
	^ rgClass.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:01'
}
RingChunkImporter>>createTraitNamed: traitName [

	| trait |
	trait := RGTraitDefinition named: traitName.
	trait withMetaclass.
	package addTrait: trait.
	^ trait.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RingChunkImporter>>doIts [
	^ doIts
]

{
	#category : #reading,
	#timestamp : ' 8/31/2017 07:17:01'
}
RingChunkImporter>>fileInFrom: aStream [

	| changes |
	changes := (CodeImporter readStream: aStream) parseChunks.
	changes do: [ :change | change accept: self ].
]

{
	#category : #reading,
	#timestamp : ' 8/31/2017 07:17:01'
}
RingChunkImporter>>fromFileNamed: aName [
	
	package := RGPackage named: aName.
	self fileInFrom: aName asFileReference readStream.
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 07:17:01'
}
RingChunkImporter>>initialize [
	super initialize.
	package := RGPackage named: 'ChangeSet'.
	doIts := Set new.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:01'
}
RingChunkImporter>>metaClassDefinition: string with: chgRec [
	| tokens theClass |
	
	tokens := self scannedSource: string.
	
	theClass := self classNamed: tokens first.
	theClass theMetaClass definitionSource: string;
			  instanceVariables: (tokens fourth findTokens: ' ')
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:01'
}
RingChunkImporter>>metaTraitDefinition: string with: chgRec [
	| tokens trait |
	
	tokens := self scannedSource: string.
	
	trait := self classNamed: tokens first.
	trait isTrait
		ifFalse:[ trait:= self createTraitNamed: tokens first ].
	
	trait theMetaClass definitionSource: string
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:01'
}
RingChunkImporter>>msgClassComment: string with: chgRec [

	| tokens theClass |
	tokens := self scannedSource: string.
	
	(tokens size >= 3
		and:[ tokens last isString ])
	ifTrue:[
		theClass := self classNamed: tokens first.
		((tokens at: (tokens size - 1)) == #class
		ifTrue: [ theClass theMetaClass ]
		ifFalse:[ theClass ]) comment: tokens last asString ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RingChunkImporter>>packages [
	
	^ { package }
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:01'
}
RingChunkImporter>>removedMethod: string with: aChunk [
	
	| orClass tokens |
	tokens := self scannedSource: string.
	tokens size >= 3
		ifTrue:[ orClass := self classNamed: tokens first. 
		^ (tokens second == #class
			ifTrue: [ orClass theMetaClass ]
			ifFalse:[ orClass ]) removeSelector: tokens last ].
	doIts add: aChunk
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:01'
}
RingChunkImporter>>scannedSource: aString [

	^ Smalltalk compiler parseLiterals: aString
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:01'
}
RingChunkImporter>>traitDefinition: aString with: chgRec [

	| tokens trait |
	tokens := self scannedSource: aString.
	trait := self classNamed: tokens third.
	trait isTrait
		ifFalse: [ trait:= self createTraitNamed: tokens third ].
	trait superclassName: tokens first;
			 definitionSource: aString;
			 category: tokens last
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 07:17:01'
}
RingChunkImporter>>visitClassCommentChunk: aChunk [

	(self classNamed: aChunk behaviorName)
		comment: aChunk contents;
		stamp: aChunk stamp.
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 07:17:01'
}
RingChunkImporter>>visitClassOrganizationChunk: aChunk [

	"Do nothing with class organizations for the moment"
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 07:17:01'
}
RingChunkImporter>>visitDoItChunk: aChunk [

	| contents |
	contents := aChunk contents.
	('*ubclass:*instanceVariableNames:*classVariableNames:*poolDictionaries:*category:*'
		match: contents) ifTrue:[^self classDefinition: contents with: aChunk].
	('* class*instanceVariableNames:*'
		match: contents) ifTrue:[^self metaClassDefinition: contents with: aChunk].		
	('Trait*named:*uses:*category:*'
		match: contents) ifTrue:[^self traitDefinition: contents with: aChunk].
	('* classTrait*uses:*'
		match: contents) ifTrue:[^self metaTraitDefinition: contents with: aChunk].	
	('* removeSelector:*'
		match: contents) ifTrue:[^self removedMethod: contents with: aChunk].
	('* comment:*'
		match: contents) ifTrue:[^self msgClassComment: contents with: aChunk].
	('* initialize'
		match: contents) ifTrue:[^self]. "Initialization is done based on class>>initialize"
	doIts add: aChunk.
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 07:17:01'
}
RingChunkImporter>>visitMethodChunk: aChunk [

	| theClass theMethod |
	theClass:= self classNamed: aChunk behaviorName.
	theMethod := (RGMethodDefinition
						class: theClass
						selector: aChunk methodSelector)
							protocol: aChunk category;
							sourceCode: aChunk contents;
							stamp: aChunk stamp.
	aChunk isMeta 
		ifTrue: [ 
			theMethod isMetaSide: true.
			theClass theMetaClass addMethod: theMethod. ] 
		ifFalse:[ theClass addMethod: theMethod ]
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 07:17:01'
}
RingChunkImporter>>visitStyleChunk: aChunk [

	"Do nothing with styles"
]
