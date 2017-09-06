"
I implement how to redo EpCodeChange instances.
"
Class {
	#name : #EpApplyVisitor,
	#superclass : #EpLogBrowserOperationVisitor,
	#traits : 'EpTCodeChangeVisitor',
	#classTraits : 'EpTCodeChangeVisitor classTrait',
	#category : #EpiceaBrowsers-Visitors,
	#timestamp : 'MartinDias 10/27/2014 18:03'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpApplyVisitor>>visitBehaviorCategoryChange: aChange [

	self
		behaviorNamed: aChange behaviorAffectedName
		ifPresent: [:aClassOrTrait | aClassOrTrait category: aChange newCategory ]

]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpApplyVisitor>>visitBehaviorCommentChange: aChange [

	self
		behaviorNamed: aChange behaviorAffectedName
		ifPresent: [ :aClass | 
			aClass 
				classComment: aChange newComment
				stamp: aChange newStamp ]
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpApplyVisitor>>visitBehaviorNameChange: aClassRenameChange [
	(environment classOrTraitNamed: aClassRenameChange oldName)
		rename: aClassRenameChange newName
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpApplyVisitor>>visitCategoryAddition: aPackageCreated [
	environment organization addCategory: aPackageCreated categoryName
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpApplyVisitor>>visitCategoryRemoval: aPackageRemoved [
	environment organization removeCategory: aPackageRemoved categoryName
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpApplyVisitor>>visitCategoryRename: aChange [

	environment organization
		renameCategory: aChange oldCategoryName
		toBe: aChange newCategoryName
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpApplyVisitor>>visitClassAddition: aClassCreation [

	self compiler
		evaluate: aClassCreation classAdded definitionSource;
		evaluate: aClassCreation classAdded theMetaClass definitionSource.
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpApplyVisitor>>visitClassModification: aModifiedClassChange [
	self compiler
		evaluate: aModifiedClassChange newClass definitionSource;
		evaluate: aModifiedClassChange newClass theMetaClass definitionSource.
		
	self flag: #todo. "Workaround to issue 16836 in fogbugz."
	self
		behaviorNamed: aModifiedClassChange behaviorAffectedName
		ifPresent: [ :aClass | 
			aClass traitComposition: aModifiedClassChange newClass traitComposition.
			aClass theMetaClass traitComposition: aModifiedClassChange newClass theMetaClass traitComposition. ].

]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpApplyVisitor>>visitClassRemoval: aClassRemoval [
	environment removeClassNamed: aClassRemoval behaviorAffectedName
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpApplyVisitor>>visitCodeChange: aChange [
	"Default behavior for any change."
		
	^ self visitEvent: aChange
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpApplyVisitor>>visitMethodAddition: aMethodCreated [

	self 
		behaviorNamed: aMethodCreated behaviorAffectedName
		ifPresent: [ :behavior | 
			behavior
				compile: aMethodCreated sourceCode 
				classified: aMethodCreated protocol ]
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpApplyVisitor>>visitMethodModification: aMethodModified [

	self 
		behaviorNamed: aMethodModified behaviorAffectedName
		ifPresent: [ :behavior | 
			behavior
				compile: aMethodModified newSourceCode 
				classified: aMethodModified newProtocol ]
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpApplyVisitor>>visitMethodRemoval: aMethodRemoval [

	self 
		behaviorNamed: aMethodRemoval behaviorAffectedName
		ifPresent: [ :behavior | 
			behavior removeSelector: aMethodRemoval selector ]
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpApplyVisitor>>visitProtocolAddition: aProtocolAddition [
	self 
		behaviorNamed: aProtocolAddition behaviorAffectedName
		ifPresent: [ :behavior | 
			behavior organization addCategory: aProtocolAddition protocol ]
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpApplyVisitor>>visitProtocolRemoval: aProtocolRemoved [
	self 
		behaviorNamed: aProtocolRemoved behaviorAffectedName
		ifPresent: [ :behavior | 
			behavior removeProtocol: aProtocolRemoved protocol ]
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpApplyVisitor>>visitTraitAddition: aChange [

	self compiler evaluate: aChange traitAdded definitionSource
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpApplyVisitor>>visitTraitModification: aChange [

	self compiler evaluate: aChange newTrait definitionSource

]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpApplyVisitor>>visitTraitRemoval: aTraitRemoval [

	environment removeClassNamed: aTraitRemoval behaviorAffectedName
]
