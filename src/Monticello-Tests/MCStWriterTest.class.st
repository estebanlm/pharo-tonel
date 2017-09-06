"

"
Class {
	#name : #MCStWriterTest,
	#superclass : #MCTestCase,
	#instVars : [
		'stream',
		'writer'
	],
	#category : #Monticello-Tests,
	#timestamp : ''
}

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCStWriterTest>>assertAllChunksAreWellFormed [
	stream := ChunkReadStream on: stream contents readStream.
	self assertChunkIsWellFormed: stream next.
]

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCStWriterTest>>assertChunkIsWellFormed: chunk [
	self class compiler
		source:  chunk readStream ;
		class: UndefinedObject;
		noPattern: true;
		failBlock:  [self assert: false];
		translate.
]

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCStWriterTest>>assertContentsOf: strm match: expected  [
	| actual |
	actual := strm contents.
	self assert: actual size = expected size.
	actual with: expected do: [:a :e | self assert: a = e]
]

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCStWriterTest>>assertMethodChunkIsWellFormed: chunk [
	self class compiler
		source: chunk readStream;
		class: UndefinedObject;
		failBlock: [self assert: false];
		translate.
	
]

{
	#category : #data,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCStWriterTest>>expectedClassDefinitionA [
 ^ '
MCMock subclass: #MCMockClassA
	instanceVariableNames: ''ivar''
	classVariableNames: ''CVar InitializationOrder''
	poolDictionaries: ''''
	category: ''MonticelloMocks''!

!MCMockClassA commentStamp: ''cwp 8/10/2003 16:43'' prior: 0!
This is a mock class. The Monticello tests manipulated it to simulate a developer modifying code in the image.!
'
]

{
	#category : #data,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCStWriterTest>>expectedClassDefinitionB [
 ^ '
MCMock subclass: #MCMockClassB
	instanceVariableNames: ''ivarb''
	classVariableNames: ''CVar''
	poolDictionaries: ''MCMockAPoolDictionary''
	category: ''MonticelloMocks''!

MCMockClassB class
	instanceVariableNames: ''ciVar''!

!MCMockClassB commentStamp: '''' prior: 0!
This comment has a bang!! Bang!! Bang!!!
'
]

{
	#category : #data,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCStWriterTest>>expectedClassMethodDefinition [

	^ '\s*!MCMockClassA class methodsFor\: ''as yet unclassified'' stamp\: ''[/:\s\w]*''!\s*one\s*\^ 1! !\s*'.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCStWriterTest>>expectedInitializerA [
	^ 'MCMockClassA initialize'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCStWriterTest>>expectedInitializerASubclass [
	^ 'MCMockASubclass initialize'
]

{
	#category : #data,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCStWriterTest>>expectedMethodDefinition [
	^ '\s*!MCMockClassA methodsFor\: ''numeric'' stamp\: ''[/:\s\w]*''!\s*one\s*\^ 1! !\s*'
]

{
	#category : #data,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCStWriterTest>>expectedMethodDefinitionWithBangs [
	^ '
!MCStWriterTest methodsFor: ''testing'' stamp: ''''!
methodWithBangs
	^ ''
	^ ReadStream on: 
''''MCRevisionInfo packageName: ''''MonticelloCompatibilityTest''''!!!!
MCOrganizationDeclaration categories: 
  #(
  ''''MonticelloMocks'''')!!!!

MCClassDeclaration
  name: #MCMockClassD
  superclassName: #Object
  category: #''''MonticelloMocks''''
  instVarNames: #()
  comment: ''''''''!!!!

MCMethodDeclaration className: #MCMockClassD selector: #one category: #''''as yet unclassified'''' timeStamp: ''''cwp 7/8/2003 21:21'''' source: 
''''one
	^ 1''''!!!!
''''
''
! !
'
]

{
	#category : #data,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCStWriterTest>>expectedOrganizationDefinition [
	^ 'SystemOrganization addCategory: #MonticelloMocks!
'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCStWriterTest>>methodWithBangs [
	^ '
	^ ReadStream on: 
''MCRevisionInfo packageName: ''MonticelloCompatibilityTest''!!
MCOrganizationDeclaration categories: 
  #(
  ''MonticelloMocks'')!!

MCClassDeclaration
  name: #MCMockClassD
  superclassName: #Object
  category: #''MonticelloMocks''
  instVarNames: #()
  comment: ''''!!

MCMethodDeclaration className: #MCMockClassD selector: #one category: #''as yet unclassified'' timeStamp: ''cwp 7/8/2003 21:21'' source: 
''one
	^ 1''!!
''
'

]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCStWriterTest>>setUp [
	stream := String new writeStream.
	writer := MCStWriter on: stream.

]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCStWriterTest>>testClassDefinitionA [
	writer visitClassDefinition: (self mockClassA asClassDefinition).
	self assertContentsOf: stream match: self expectedClassDefinitionA.
	stream := ChunkReadStream on: stream contents readStream.
	2 timesRepeat: [self assertChunkIsWellFormed: stream next]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCStWriterTest>>testClassDefinitionB [
	writer visitClassDefinition: (self mockClassB asClassDefinition).
	self assertContentsOf: stream match: self expectedClassDefinitionB.
	
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCStWriterTest>>testClassMethodDefinition [
	writer visitMethodDefinition: (RGMethodDefinition realClass: self mockClassA class selector: #one) asMCMethodDefinition.
	self assert: (stream contents matchesRegex: self expectedClassMethodDefinition).
	
	stream := ChunkReadStream on: stream contents readStream.
	
	self assert: stream next isAllSeparators.
	self assertChunkIsWellFormed: stream next.
	self assertMethodChunkIsWellFormed: stream next.
	self assert: stream next isAllSeparators 
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCStWriterTest>>testInitializerDefinition [
	|chunk lastChunk penultChunk|
	writer writeSnapshot: self mockSnapshot.
	stream := ChunkReadStream on: stream contents readStream.
	
	[stream atEnd] whileFalse:
		[chunk := stream next.
		chunk isAllSeparators ifFalse: [
			penultChunk := lastChunk.
			lastChunk := chunk]].
	self assertContentsOf: penultChunk readStream match: self expectedInitializerA.
	self assertContentsOf: lastChunk readStream match: self expectedInitializerASubclass
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCStWriterTest>>testMethodDefinition [
	writer visitMethodDefinition: (RGMethodDefinition realClass: self mockClassA selector: #one) asMCMethodDefinition.
	self assert: (stream contents matchesRegex: self expectedMethodDefinition).
	
	stream := ChunkReadStream on: stream contents readStream.
	
	self assert: stream next isAllSeparators.
	self assertChunkIsWellFormed: stream next.
	self assertMethodChunkIsWellFormed: stream next.
	self assert: stream next isAllSeparators 
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCStWriterTest>>testMethodDefinitionWithBangs [

	| methodDefinition |
	
	methodDefinition := (RGMethodDefinition 
		realClass: self class
		selector: #methodWithBangs) asMCMethodDefinition.	
	methodDefinition setTimeStamp: ''.
	writer visitMethodDefinition: methodDefinition.
										
	self assertContentsOf: stream contents match: self expectedMethodDefinitionWithBangs.
	
	stream := ChunkReadStream on: stream contents readStream.
	
	self assert: stream next isAllSeparators.
	self assertChunkIsWellFormed: stream next.
	self assertMethodChunkIsWellFormed: stream next.
	self assert: stream next isAllSeparators 
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCStWriterTest>>testOrganizationDefinition [
	| definition |
	definition := MCOrganizationDefinition categories: 
					(self mockPackage packageSet systemCategories).
	writer visitOrganizationDefinition: definition.
	self assertContentsOf: stream match: self expectedOrganizationDefinition.
	self assertAllChunksAreWellFormed.
]
