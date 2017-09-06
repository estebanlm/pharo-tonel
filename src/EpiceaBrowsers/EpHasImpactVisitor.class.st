"
I answer a boolean that indicates if a EpCodeChange would actually produce a change in current image if applied with EpApplyVisitor.
"
Class {
	#name : #EpHasImpactVisitor,
	#superclass : #Object,
	#traits : 'EpTCodeChangeVisitor',
	#classTraits : 'EpTCodeChangeVisitor classTrait',
	#instVars : [
		'environment'
	],
	#category : #EpiceaBrowsers-Visitors,
	#timestamp : 'MartinDias 4/5/2017 18:56'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpHasImpactVisitor class>>inEnvironment: anEnvironment [

	^ self basicNew 
		initializeWith: anEnvironment;
		yourself
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpHasImpactVisitor>>behaviorNamed: aSymbol ifPresent: presentBlock [

	^ (environment classOrTraitNamed: aSymbol) 
		ifNil: [ self ]
		ifNotNil: presentBlock
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpHasImpactVisitor>>initializeWith: anEnvironment [

	self initialize.
	environment := anEnvironment.
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpHasImpactVisitor>>visitBehaviorCategoryChange: aChange [

	self
		behaviorNamed: aChange behaviorAffectedName
		ifPresent: [ :behavior |
			^ behavior category ~= aChange behaviorAffected category ].
			
	^ true
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpHasImpactVisitor>>visitBehaviorChange: aChange [

	self flag: #todo. "Remove when ready"
	Halt if: [ ({EpClassAddition. EpClassModification. EpTraitAddition. EpTraitModification} includes: aChange class) not ].

	self
		behaviorNamed: aChange behaviorAffectedName
		ifPresent: [ :behavior |"
Halt if: [ aChange behaviorAffectedName = 'EpApplyPreviewer' and: [ 
		behavior definition ~= aChange behaviorAffected definitionSource ] ]."
			^ behavior definition ~= aChange behaviorAffected definitionSource ].
			
	^ true
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpHasImpactVisitor>>visitBehaviorCommentChange: aChange [

	self
		behaviorNamed: aChange behaviorAffectedName
		ifPresent: [ :aClass | 
			^ aClass comment ~= aChange newComment or: [
			aClass organization commentStamp ~= aChange newStamp ] ].

	^ true
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpHasImpactVisitor>>visitBehaviorNameChange: aChange [

	self 
		behaviorNamed: aChange oldName
		ifPresent: [ :behavior | ^ true ].

	^ false
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpHasImpactVisitor>>visitCategoryAddition: aChange [

	^ (environment organization includesCategory: aChange categoryName) not
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpHasImpactVisitor>>visitCategoryRemoval: aChange [
	
	^ environment organization includesCategory: aChange categoryName
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpHasImpactVisitor>>visitCategoryRename: aChange [

	^ environment organization includesCategory: aChange oldCategoryName

]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpHasImpactVisitor>>visitClassRemoval: aChange [

	self 
		behaviorNamed: aChange behaviorAffectedName
		ifPresent: [ :behavior | ^ true ].

	^ false
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpHasImpactVisitor>>visitCodeChange: aChange [
	^ self error: 'shouldn''t happen'
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpHasImpactVisitor>>visitMethodChange: aChange [
	"Addition and Modification come here"

	self 
		behaviorNamed: aChange behaviorAffectedName
		ifPresent: [ :behavior | 
			^ behavior 
				compiledMethodAt: aChange methodAffectedSelector
				ifPresent: [ :method |
					method protocol ~= aChange methodAffectedProtocol or: [
					method sourceCode ~= aChange methodAffectedSourceCode ] ]
				ifAbsent: [ true ] ].
			
	^ true "If class is not present"
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpHasImpactVisitor>>visitMethodRemoval: aChange [

	self 
		behaviorNamed: aChange behaviorAffectedName
		ifPresent: [ :behavior |
			"If method comes from trait, removing has no impact."
			^ behavior 
				compiledMethodAt: aChange methodAffectedSelector
				ifPresent: [ :method | method isFromTrait not ]
				ifAbsent: [ false ] ].

	^ false "No impact if container does not exist"

]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpHasImpactVisitor>>visitProtocolAddition: aProtocolAddition [

	self 
		behaviorNamed: aProtocolAddition behaviorAffectedName
		ifPresent: [ :behavior |
			^ (behavior organization protocolOrganizer hasProtocolNamed: aProtocolAddition protocol) not ].
		
	^ true
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpHasImpactVisitor>>visitProtocolRemoval: aProtocolRemoved [

	self 
		behaviorNamed: aProtocolRemoved behaviorAffectedName
		ifPresent: [ :behavior | 
			^ behavior organization protocolOrganizer hasProtocolNamed: aProtocolRemoved protocol ].
		
	^ true
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpHasImpactVisitor>>visitTraitRemoval: aChange [

	self 
		behaviorNamed: aChange behaviorAffectedName
		ifPresent: [ :behavior | ^ true ].

	^ false
]
