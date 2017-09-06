"
I am a RBBrowserEnvironment on a set of classes.
I containt all entities of this set.

Example:
(RBBrowserEnvironment new) forClasses: Number withAllSubclasses.
"
Class {
	#name : #RBClassEnvironment,
	#superclass : #RBBrowserEnvironmentWrapper,
	#instVars : [
		'classes',
		'metaClasses'
	],
	#category : #Refactoring-Environment,
	#timestamp : 'NicolaiHess 4/27/2015 21:23'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:25'
}
RBClassEnvironment class>>class: aClass [
	^ self classes: { aClass }
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:25'
}
RBClassEnvironment class>>classes: aCollection [
	^ self
		onEnvironment: self default
		classes: aCollection
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:25'
}
RBClassEnvironment class>>onEnvironment: anEnvironment classes: aCollection [
	^(self onEnvironment: anEnvironment)
		classes: aCollection; yourself
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBClassEnvironment>>addClass: aClass  [
	aClass isMeta
		ifTrue: [ metaClasses add: aClass soleInstance name ]
		ifFalse: [ classes add: aClass name ]
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBClassEnvironment>>addClassAndMetaClassFor: aClassOrMetaClass [
	self
		addClass: aClassOrMetaClass theMetaClass;
		addClass: aClassOrMetaClass theNonMetaClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBClassEnvironment>>asSelectorEnvironment [

	^RBSelectorEnvironment new
		searchStrings:#();
		label:self label;
		onEnvironment: self environment;
		classSelectors: self classSelectorDictionary metaClassSelectors: self metaClassSelectorDictionary;
		yourself.
]

{
	#category : #accessing-classes,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBClassEnvironment>>classNames [
	^ IdentitySet new
		addAll: classes;
		addAll: metaClasses;
		yourself
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBClassEnvironment>>classSelectorDictionary [
	^ classes 
		inject: (IdentityDictionary new: classes size)
		into: [ :answer :class |
			answer
				at: class put: (self systemDictionary at: class) selectors;
				yourself ]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBClassEnvironment>>classes: aCollection  [
	aCollection do: [ :each | self addClass: each ]
]

{
	#category : #accessing-classes,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBClassEnvironment>>classesDo: aBlock  [
	classes do: [ :each | 
		| class |
		class := self systemDictionary at: each ifAbsent: [ nil ].
		(class notNil and: [ environment includesClass: class ])
			ifTrue: [ aBlock value: class ] ].
		metaClasses do: [ :each | 
		| class |
		class := self systemDictionary at: each ifAbsent: [ nil ].
		(class notNil and: [ environment includesClass: class theMetaClass ])
			ifTrue: [ aBlock value: class theMetaClass ] ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBClassEnvironment>>defaultLabel [
	| stream |
	stream := String new writeStream.
	classes do: 
			[:each | 
			stream nextPutAll: each;
				nextPut: $ ].
	^stream contents
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBClassEnvironment>>definesClass: aClass [
	
	^ self includesClass: aClass
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBClassEnvironment>>includesCategory: aCategory [
	^ (super includesCategory: aCategory) and: [
		(environment classNamesFor: aCategory)
			inject: false
			into: [ :bool :each |
				bool or: [
					| class |
					class := self systemDictionary at: each ifAbsent: [ nil ].
					class notNil 
						and: [ (self includesClass: class)
						or: [ self includesClass: class class ]]]]]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBClassEnvironment>>includesClass: aClass  [
	^(aClass isMeta
		ifTrue: [metaClasses includes: aClass soleInstance name]
		ifFalse: [classes includes: aClass name])
			and: [super includesClass: aClass]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBClassEnvironment>>initialize [
	super initialize.
	classes := IdentitySet new.
	metaClasses := IdentitySet new
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBClassEnvironment>>isClassEnvironment [
	^true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBClassEnvironment>>isEmpty [
	^classes isEmpty and: [metaClasses isEmpty]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBClassEnvironment>>metaClassSelectorDictionary [
	^ metaClasses 
		inject: (IdentityDictionary new: metaClasses size)
		into: [ :answer :class |
			answer
				at: class put: (self systemDictionary at: class) class selectors;
				yourself ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBClassEnvironment>>packages [
	^ self classes collect: #package
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBClassEnvironment>>postCopy [
	super postCopy.
	classes := classes copy.
	metaClasses := metaClasses copy
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBClassEnvironment>>problemCount [
	^self numberClasses
]

{
	#category : #removing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBClassEnvironment>>removeClass: aClass  [
	aClass isMeta
		ifTrue: [metaClasses remove: aClass soleInstance name ifAbsent: []]
		ifFalse: [classes remove: aClass name ifAbsent: []]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBClassEnvironment>>selectors [

	^ Array streamContents: [ :stream |
		self classesDo: [ :class | 
			self selectorsForClass: class do: [ :selector | stream nextPut: selector ] ] ]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:25'
}
RBClassEnvironment>>storeOn: aStream [
	aStream nextPut: $(.
	super storeOn: aStream.
	aStream nextPutAll: ' classes: (('.
	classes asArray storeOn: aStream.
	aStream nextPutAll: ' inject: OrderedCollection new into: [:sum :each | 
				| class |
				class := Smalltalk at: each ifAbsent: [nil].
				class notNil ifTrue: [sum add: class].
				sum]) , ('.
	metaClasses asArray storeOn: aStream.
	aStream nextPutAll: ' inject: OrderedCollection new into: [:sum :each | 
				| class |
				class := Smalltalk at: each ifAbsent: [nil].
				class notNil ifTrue: [sum add: class class].
				sum])))'
]
