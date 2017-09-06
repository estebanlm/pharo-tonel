"

"
Class {
	#name : #MetacelloVersionMethodSection,
	#superclass : #MetacelloMethodSection,
	#instVars : [
		'block',
		'versionSpec',
		'parent',
		'methodSections'
	],
	#category : #Metacello-Core-Constructors,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionMethodSection>>addMethodSection: methodSection [

	methodSection parent: self.
	self methodSections add: methodSection
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionMethodSection>>attributeOrPath [
    ^ self parent == nil
        ifTrue: [ 
            self attributes size == 1
                ifTrue: [ self attributes first ]
                ifFalse: [ self attributes ] ]
        ifFalse: [ self attributePath ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionMethodSection>>attributePath [
    | path |
    path := MetacelloMethodSectionPath with: self attributes.
    ^ self parent == nil
        ifTrue: [ path ]
        ifFalse: [ self parent attributePath , path ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionMethodSection>>block [
	^ block
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionMethodSection>>block: anObject [
	block := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionMethodSection>>methodSections [

	methodSections ifNil: [ methodSections := OrderedCollection new ].
	^methodSections
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionMethodSection>>parent [
	^ parent
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionMethodSection>>parent: anObject [
	parent := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionMethodSection>>printOn: aStream [
  aStream
    nextPutAll: self class name asString;
    nextPut: $(.
  self versionSpec printOn: aStream.
  aStream nextPut: $)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionMethodSection>>topParent [
	self parent == nil
		ifTrue: [ ^ self ].
	^ self parent topParent
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionMethodSection>>versionSpec [
	^ versionSpec
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloVersionMethodSection>>versionSpec: anObject [
	versionSpec := anObject
]
