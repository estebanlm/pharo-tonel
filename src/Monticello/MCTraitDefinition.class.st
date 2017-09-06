"
A MCTraitDefinition represents a trait.
"
Class {
	#name : #MCTraitDefinition,
	#superclass : #MCClassDefinition,
	#category : #Monticello-Modeling,
	#timestamp : '<historical>'
}

{
	#category : #instance-creation,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCTraitDefinition class>>name: classNameString traitComposition:  traitCompositionString category:  categoryString comment:  commentString commentStamp:   commentStamp [
	^ self instanceLike:
		(self new initializeWithName: classNameString 
			traitComposition:  traitCompositionString
			category:  categoryString
			comment:  commentString  
			commentStamp:   commentStamp)

]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCTraitDefinition>>= aDefinition [
	self flag: #traits. "Ugly we harcoded the super superclass method.  We will have to refactor the definition hierarchy"
	
	^ (aDefinition isKindOf: MCDefinition)
		and: [(self isRevisionOf: aDefinition)
		and: [self traitCompositionString = aDefinition traitCompositionString
		and: [category = aDefinition category
		and: [comment = aDefinition comment]]]]
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCTraitDefinition>>accept: aVisitor [
	^ aVisitor visitTraitDefinition: self

]

{
	#category : #installing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCTraitDefinition>>createClass [
	| trait |
	trait := Trait
		named: name
		uses: (Smalltalk compiler evaluate: self traitCompositionString)
		category: category.
	trait ifNotNil: [trait classComment: comment stamp: commentStamp].
	^trait
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCTraitDefinition>>hasClassInstanceVariables [
	^ false


]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCTraitDefinition>>hash [
	| hash |
	hash := String stringHash: name initialHash: 0.
	hash := String stringHash: self traitCompositionString initialHash: hash.
	hash := String stringHash: (category ifNil: ['']) initialHash: hash.
	^ hash

]

{
	#category : #initializing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCTraitDefinition>>initializeWithName: classNameString 
	traitComposition:  traitCompositionString
	category:  categoryString
	comment:  commentString  
	commentStamp:   commentStampString [
					
		name := classNameString asSymbol.
		traitComposition := traitCompositionString.
	     category := categoryString.
		comment := commentString withSqueakLineEndings.
		commentStamp :=  commentStampString ifNil: [self defaultCommentStamp]

]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCTraitDefinition>>printClassDefinitionOn: stream [

	^ self printMetaDefinitionOn: stream
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCTraitDefinition>>printDefinitionOn: stream [
	stream nextPutAll: 'Trait named: #', self className;
		 cr;
		 tab;
		 nextPutAll: 'uses: ';
		 nextPutAll: self traitCompositionString;
		 cr;
		 tab;
		 nextPutAll: 'category: ';
		 store: self category asString

]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCTraitDefinition>>requirements [
	"Assuming that traits in a composition can be identified by
	testing for the first character beeing an uppercase character
	(and thus not a special character such as {, # etc.)"

	| tokens traitNames |
	self hasTraitComposition ifFalse: [ ^Array new ].
	tokens := traitComposition parseLiterals.
	traitNames := tokens select: [:each | each first isUppercase].
	^traitNames asArray
]
