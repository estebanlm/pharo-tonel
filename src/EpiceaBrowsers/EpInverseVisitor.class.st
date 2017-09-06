"
I convert a code change to it's inverse operation. For example, a class addition into a class removal.
"
Class {
	#name : #EpInverseVisitor,
	#superclass : #EpLogBrowserOperationVisitor,
	#traits : 'EpTCodeChangeVisitor',
	#classTraits : 'EpTCodeChangeVisitor classTrait',
	#category : #EpiceaBrowsers-Visitors,
	#timestamp : 'MartinDias 4/14/2017 15:19'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpInverseVisitor>>visitBehaviorCategoryChange: aChange [

	^ EpBehaviorCategoryChange
			oldCategory: aChange newCategory
			newCategory: aChange oldCategory
			class: aChange behaviorAffected

]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpInverseVisitor>>visitBehaviorCommentChange: aChange [

	^ EpBehaviorCommentChange
			newWithBehavior: aChange behaviorAffected
			oldComment: aChange newComment
			newComment: aChange oldComment
			oldStamp: aChange newStamp
			newStamp: aChange oldStamp

]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpInverseVisitor>>visitBehaviorNameChange: aChange [

	^ EpBehaviorNameChange
			oldName: aChange newName
			newName: aChange oldName
			class: aChange behaviorAffected
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpInverseVisitor>>visitCategoryAddition: aChange [

	^ EpCategoryRemoval 
			named: aChange categoryName
			packageName: aChange affectedPackageName
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpInverseVisitor>>visitCategoryRemoval: aChange [
	
	^ EpCategoryAddition
			named: aChange categoryName
			packageName: aChange affectedPackageName
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpInverseVisitor>>visitCategoryRename: aChange [

	^ EpCategoryRename
			oldName: aChange newCategoryName
			newName: aChange oldCategoryName
			packageName: aChange affectedPackageName

]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpInverseVisitor>>visitClassAddition: aChange [

	^ EpClassRemoval class: aChange behaviorAffected
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpInverseVisitor>>visitClassModification: aChange [

	^ EpClassModification oldClass: aChange newClass newClass: aChange oldClass.

]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpInverseVisitor>>visitClassRemoval: aChange [

	^ EpClassAddition class: aChange behaviorAffected
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpInverseVisitor>>visitCodeChange: aChange [
	^ self error: 'Should not be reached'
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpInverseVisitor>>visitMethodAddition: aChange [

	^ EpMethodRemoval method: aChange methodAffected
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpInverseVisitor>>visitMethodModification: aChange [

	^ EpMethodModification oldMethod: aChange newMethod newMethod: aChange oldMethod
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpInverseVisitor>>visitMethodRemoval: aChange [

	^ EpMethodAddition method: aChange methodAffected
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpInverseVisitor>>visitProtocolAddition: aChange [

	^ EpProtocolRemoval behavior: aChange behaviorAffected protocol: aChange protocol
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpInverseVisitor>>visitProtocolRemoval: aChange [

	^ EpProtocolAddition behavior: aChange behaviorAffected protocol: aChange protocol

]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpInverseVisitor>>visitTraitAddition: aChange [
	
	^ EpTraitRemoval trait: aChange behaviorAffected
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpInverseVisitor>>visitTraitModification: aTraitModification [

	self notYetImplemented
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpInverseVisitor>>visitTraitRemoval: aChange [

	^ EpTraitAddition trait: aChange behaviorAffected
]
