"
A class trait definition
"
Class {
	#name : #MCClassTraitDefinition,
	#superclass : #MCDefinition,
	#instVars : [
		'baseTrait',
		'classTraitComposition',
		'category'
	],
	#category : #Monticello-Modeling,
	#timestamp : 'TorstenBergmann 2/5/2014 13:45'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassTraitDefinition class>>baseTraitName: aString classTraitComposition: classTraitCompositionString [
	^ self baseTraitName: aString classTraitComposition: classTraitCompositionString category: nil
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassTraitDefinition class>>baseTraitName: aString classTraitComposition: classTraitCompositionString category: aCategoryString [
	^self instanceLike: (
		self new
			initializeWithBaseTraitName: aString
			classTraitComposition: classTraitCompositionString
			category: aCategoryString).
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassTraitDefinition>>= aDefinition [
	^ (super = aDefinition)
		and: [baseTrait = aDefinition baseTrait
		and: [self classTraitCompositionString = aDefinition classTraitCompositionString]]


]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassTraitDefinition>>accept: aVisitor [
	^ aVisitor visitClassTraitDefinition: self.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassTraitDefinition>>baseTrait [
	^baseTrait

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassTraitDefinition>>category [
	^ category ifNil: [(Smalltalk classOrTraitNamed: self baseTrait)
							ifNotNil: [:bTrait | bTrait category]
							ifNil: [self error: 'Can''t detect the category']] 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassTraitDefinition>>className [
	^self baseTrait
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassTraitDefinition>>classTraitComposition [
	^classTraitComposition


]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassTraitDefinition>>classTraitCompositionString [
	^self classTraitComposition ifNil: ['{}'].


]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassTraitDefinition>>definitionString [
	^self baseTrait , ' classTrait
	uses: ' , self classTraitCompositionString.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassTraitDefinition>>description [
	^Array
		with: baseTrait
		with: classTraitComposition
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassTraitDefinition>>hash [
	| hash |
	hash := String stringHash: baseTrait initialHash: 0.
	hash := String stringHash: self classTraitCompositionString initialHash: hash.
	^hash

]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassTraitDefinition>>initializeWithBaseTraitName: aTraitName classTraitComposition: aString [
	baseTrait := aTraitName.
	classTraitComposition := aString.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassTraitDefinition>>initializeWithBaseTraitName: aTraitName classTraitComposition: aString category: aCategoryString [
	baseTrait := aTraitName.
	classTraitComposition := aString.
	category := aCategoryString
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassTraitDefinition>>isClassDefinition [
	"Traits are treated the same like classes."
	
	^ true
]

{
	#category : #installing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassTraitDefinition>>load	 [
	self class compiler evaluate: self definitionString
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassTraitDefinition>>printDefinitionOn: stream [
	stream
		nextPutAll: self baseTrait;
		nextPutAll: ' classTrait';
		cr;
		tab;
		nextPutAll: 'uses: ';
		nextPutAll: self classTraitCompositionString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassTraitDefinition>>requirements [
	^Array with: baseTrait
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassTraitDefinition>>sortKey [
	^ self baseTrait , '.classTrait'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassTraitDefinition>>source [
	^self definitionString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCClassTraitDefinition>>summary [
	^self baseTrait , ' classTrait'

]
