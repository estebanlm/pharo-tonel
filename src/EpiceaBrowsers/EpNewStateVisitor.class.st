"
I answer a String that represents the new state of an EpEvent.
"
Class {
	#name : #EpNewStateVisitor,
	#superclass : #EpContentStringVisitor,
	#category : #EpiceaBrowsers-Visitors,
	#timestamp : 'MartinDias 10/27/2014 18:00'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpNewStateVisitor>>visitBehaviorCategoryChange: aRecategorizationChange [

	^ aRecategorizationChange newCategory
	    
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpNewStateVisitor>>visitBehaviorCommentChange: aChange [

	^ aChange newComment asString
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpNewStateVisitor>>visitBehaviorNameChange: aClassRenameChange [

	^ aClassRenameChange newName
	    
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpNewStateVisitor>>visitCategoryAddition: aClassCategoryCreatedChange [

	^ aClassCategoryCreatedChange categoryName
	    
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpNewStateVisitor>>visitCategoryRename: aClassCategoryRenamedChange [

	^ aClassCategoryRenamedChange newCategoryName
	    
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpNewStateVisitor>>visitClassAddition: aClassCreatedChange [

	^ self stringForBehavior: aClassCreatedChange classAdded
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpNewStateVisitor>>visitClassModification: aModificationClassChange [

	^ self stringForBehavior: aModificationClassChange newClass
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpNewStateVisitor>>visitExpressionEvaluation: anExpressionEvaluation [

	^ anExpressionEvaluation expression
	    
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpNewStateVisitor>>visitLogCommentModification: anEvent  [
	^ anEvent newComment
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpNewStateVisitor>>visitMethodAddition: aMethodCreatedChange [
	^ self 
		printProtocol: aMethodCreatedChange protocol
		sourceCode: aMethodCreatedChange sourceCode
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpNewStateVisitor>>visitMethodModification: aMethodModification [

	^ self 
		printProtocol: aMethodModification newProtocol
		sourceCode: aMethodModification newSourceCode 
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpNewStateVisitor>>visitProtocolAddition: aProtocolAddition [

	^ aProtocolAddition protocol
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpNewStateVisitor>>visitRedo: aRedoEvent [

	^ self displayBrowserOperation: aRedoEvent
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpNewStateVisitor>>visitTraitAddition: aTraitCreation [

	^ self stringForBehavior: aTraitCreation traitAdded
	    
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpNewStateVisitor>>visitTraitModification: aTraitModificationChange [

	^ self stringForBehavior: aTraitModificationChange newTrait
	    
]
