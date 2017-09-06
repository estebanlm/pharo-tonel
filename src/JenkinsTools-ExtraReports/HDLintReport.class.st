"
Hudson report for lint results
"
Class {
	#name : #HDLintReport,
	#superclass : #HDReport,
	#instVars : [
		'environment',
		'rules'
	],
	#category : #JenkinsTools-ExtraReports,
	#timestamp : 'TorstenBergmann 2/12/2014 22:31'
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDLintReport class>>runClasses: aCollectionOfClasses named: aString [
	| classEnvironment |
	classEnvironment := RBBrowserEnvironment new
		forClasses: aCollectionOfClasses.
	classEnvironment label: aString.
	^ self runEnvironment: classEnvironment
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDLintReport class>>runEnvironment: anEnvironment [
	^ self new 
		initializeOn: anEnvironment; 
		run
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDLintReport class>>runPackage: aString [
	| packageEnvironment |
	packageEnvironment := RBBrowserEnvironment new
		forPackageNames: (Array with: aString).
	packageEnvironment label: aString.
	^ self runEnvironment: packageEnvironment
]

{
	#category : #generating,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDLintReport>>generateClass: aClass on: aStream [
	| sourceStream sourceName |
	sourceStream := WriteStream on: String new.
	sourceName := environment label , '-' , aClass name , '.st'.
	aStream tab; nextPutAll: '<file name="'; nextPutAll: (self encode: sourceName); nextPutAll: '">'; nextPut: Character lf.
	self generateClass: aClass source: sourceStream on: aStream.
	self generateClass: aClass class source: sourceStream on: aStream.
	aStream tab; nextPutAll: '</file>'; nextPut: Character lf.
	sourceName asFileReference ensureDelete writeStreamDo: [ :stream | 
		stream nextPutAll: sourceStream contents ]
]

{
	#category : #generating,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDLintReport>>generateClass: aClass selector: aSelector source: sourceStream on: aStream [
	| offset source matching |
	offset := self
		lineAndColumn: sourceStream contents
		at: sourceStream position.
	sourceStream
		nextPutAll: (source := self convert: (aClass sourceCodeAt: aSelector));
		nextPut: Character lf; nextPut: Character lf.
	matching := rules select: [ :each | 
		(self isSelectorEnvironment: each result)
			and: [ each result includesSelector: aSelector in: aClass ] ].
	self generateViolations: matching source: source offset: offset on: aStream
]

{
	#category : #generating,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDLintReport>>generateClass: aClass source: sourceStream on: aStream [
	| offset source matching selectors |
	offset := self
		lineAndColumn: sourceStream contents
		at: sourceStream position.
	sourceStream
		nextPutAll: (source := self convert: aClass definition);
		nextPut: Character lf; nextPut: Character lf.
	(environment definesClass: aClass) ifTrue: [
		matching := rules select: [ :rule |
			(self isClassEnvironment: rule result)
				and: [ rule result includesClass: aClass ] ].
		self generateViolations: matching source: source offset: offset on: aStream ].
	(environment selectorsForClass: aClass) asSortedCollection
		do: [ :selector | self generateClass: aClass selector: selector source: sourceStream on: aStream ]
]

{
	#category : #generating,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDLintReport>>generateOn: aStream [
	aStream nextPutAll: '<?xml version="1.0" encoding="UTF-8"?>'; nextPut: Character lf.
	aStream nextPutAll: '<checkstyle version="5.2">'; nextPut: Character lf.
	(environment allClasses asSortedCollection: [ :a :b | a name <= b name ])
		do: [ :class | self generateClass: class on: aStream ].
	aStream nextPutAll: '</checkstyle>'
]

{
	#category : #generating,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDLintReport>>generateViolations: aCollection source: aString offset: aPoint on: aStream [
	aCollection do: [ :rule |
		| interval start |
		interval := (rule result selectionIntervalFor: aString)
			ifNil: [ 1 to: aString size ].
		start := self lineAndColumn: aString at: interval first.
		aStream tab; tab; nextPutAll: '<error'.
		aStream nextPutAll: ' source="'; nextPutAll: (self encode: rule class name); nextPut: $".
		aStream nextPutAll: ' message="'; nextPutAll: (self encode: rule group); nextPutAll: ' - '; nextPutAll: (self encode: rule name); nextPut: $".
		aStream nextPutAll: ' severity="'; nextPutAll: (rule
			severity = #information 
				ifTrue: [ 'info' ]
				ifFalse: [ 
					rule severity = #warning
						ifTrue: [ 'warning' ]
						ifFalse: [ 'error' ] ]); nextPut: $".
		aStream nextPutAll: ' line="'; print: aPoint x + start x; nextPut: $".
		aPoint y + start y - 1 <= 1
			ifFalse: [ aStream nextPutAll: ' column="'; print: aPoint y + start y - 1; nextPut: $" ].
		aStream nextPutAll: '/>'; nextPut: Character lf ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDLintReport>>initializeOn: anEnvironment [
	environment := anEnvironment.
	rules := (RBCompositeLintRule rulesFor: RBBasicLintRule)
		reject: [ :each | each class name endsWith: 'SpellingRule' ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDLintReport>>isClassEnvironment: anEnvironment [
	^ #(CategoryEnvironment ClassEnvironment VariableEnvironment) includes: anEnvironment class name
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDLintReport>>isSelectorEnvironment: anEnvironment [
	^ #(SelectorEnvironment ParseTreeEnvironment VariableEnvironment) includes: anEnvironment class name
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDLintReport>>lineAndColumn: aString at: anInteger [
	| line last stream |
	line := 1.
	last := 0.
	stream := aString readStream.
	[ (stream nextLine isNil or: [ anInteger <= stream position ])
		ifTrue: [ ^ line @ (anInteger - last) ].
	last := stream position.
	line := line + 1 ]
		repeat
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDLintReport>>rules [
	^rules
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDLintReport>>run [
	RBSmalllintChecker 
		runRule: (RBCompositeLintRule rules: rules)
		onEnvironment: environment.
		
	(environment label , '-Lint.xml') asFileReference ensureDelete writeStreamDo: [ :stream|
		 self generateOn: stream ]
]
