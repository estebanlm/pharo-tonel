"
I answer a String that represents the old state of an EpEvent.
"
Class {
	#name : #EpOldStateVisitor,
	#superclass : #EpContentStringVisitor,
	#category : #EpiceaBrowsers-Visitors,
	#timestamp : 'MartinDias 10/27/2014 18:00'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpOldStateVisitor>>visitBehaviorCategoryChange: aRecategorizationChange [

	^ aRecategorizationChange oldCategory
	    
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpOldStateVisitor>>visitBehaviorCommentChange: aChange [

	^ aChange oldComment asString
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpOldStateVisitor>>visitBehaviorNameChange: aClassRenameChange [

	^ aClassRenameChange oldName
	    
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpOldStateVisitor>>visitCategoryRemoval: aClassCategoryRemovedChange [

	^ aClassCategoryRemovedChange categoryName
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpOldStateVisitor>>visitCategoryRename: aClassCategoryRenamedChange [

	^ aClassCategoryRenamedChange oldCategoryName
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpOldStateVisitor>>visitClassModification: aModificationClassChange [

	^ self stringForBehavior: aModificationClassChange oldClass
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpOldStateVisitor>>visitClassRemoval: aClassRemovalChange [

	^ self stringForBehavior: aClassRemovalChange classRemoved
	    
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpOldStateVisitor>>visitLogCommentModification: anEvent [

	^ anEvent oldComment
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpOldStateVisitor>>visitMethodModification: aMethodModification [

	^ self 
		printProtocol: aMethodModification oldProtocol  
		sourceCode: aMethodModification oldSourceCode
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpOldStateVisitor>>visitMethodRemoval: aMethodRemoval [

	^ self 
		printProtocol: aMethodRemoval protocol
		sourceCode: aMethodRemoval sourceCode
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpOldStateVisitor>>visitProtocolRemoval: aProtocolRemoval [

	^ aProtocolRemoval protocol
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpOldStateVisitor>>visitTraitModification: aTraitModificationChange [

	^ self stringForBehavior: aTraitModificationChange oldTrait
	    
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpOldStateVisitor>>visitTraitRemoval:  aTraitRemoval [

	^ self stringForBehavior: aTraitRemoval traitRemoved
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpOldStateVisitor>>visitUndo: anUndoEvent [

	^ self displayBrowserOperation: anUndoEvent
]
