"
I answer an icon for each EpEvent.
"
Class {
	#name : #EpIconVisitor,
	#superclass : #EpEntryContentVisitor,
	#category : #EpiceaBrowsers-Visitors,
	#timestamp : 'MartinDias 10/27/2014 17:59'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpIconVisitor>>additionIcon [
	^ self iconNamed: #changeAddIcon
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpIconVisitor>>emptyIcon [
	^ self iconNamed: #emptyIcon
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpIconVisitor>>modificationIcon [
	^ self iconNamed: #changeUpdateIcon
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpIconVisitor>>removalIcon [
	^ self iconNamed: #changeRemoveIcon
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpIconVisitor>>visitBehaviorCategoryChange: aClassRecategorizationChange [
	^ self modificationIcon
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpIconVisitor>>visitBehaviorCommentChange: aChange [
	^ self modificationIcon
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpIconVisitor>>visitBehaviorCopy: anEvent [
	^ self iconNamed: #configurationIcon
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpIconVisitor>>visitBehaviorNameChange: aClassRenamedChange [
	^ self modificationIcon
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpIconVisitor>>visitCategoryAddition: aCategoryChange [
	^ self additionIcon
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpIconVisitor>>visitCategoryRemoval: aCategoryChange [
	^ self removalIcon
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpIconVisitor>>visitCategoryRename: aCategoryChange [
	^ self modificationIcon.
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpIconVisitor>>visitClassAddition: aClassCreatedChange [
	^ self additionIcon
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpIconVisitor>>visitClassModification: aModificationClassChange [
	^ self modificationIcon
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpIconVisitor>>visitClassRemoval: aClassRemovedChange [
	^ self removalIcon
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpIconVisitor>>visitEvent: anEvent  [
	^ self emptyIcon
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpIconVisitor>>visitExpressionEvaluation: anExpressionEvaluation [
	^ self iconNamed: #workspaceIcon
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpIconVisitor>>visitLogCommentModification: aLogCommentModification [
	^ self iconNamed: #announcementIcon
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpIconVisitor>>visitMethodAddition: aMethodCreatedChange [
	^ self additionIcon
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpIconVisitor>>visitMethodModification: aMethodModified [
	^ self modificationIcon
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpIconVisitor>>visitMethodRemoval: aMethodRemoved [
	^ self removalIcon
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpIconVisitor>>visitMonticelloVersionSave: aChange [
	^ self iconNamed: #packageIcon
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpIconVisitor>>visitMonticelloVersionsLoad: aMonticelloVersionLoaded [
	^ self iconNamed: #packageIcon
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpIconVisitor>>visitProtocolAddition: aProtocolChange [
	^ self additionIcon
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpIconVisitor>>visitProtocolRemoval: aProtocolChange [
	^ self removalIcon
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpIconVisitor>>visitRedo: aRedoEvent [
	^ self iconNamed: #smallRedoIcon
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpIconVisitor>>visitRefactoring: aRefactoring [
	^ self iconNamed: #configurationIcon
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpIconVisitor>>visitSessionEnd: anEvent [
	^ self iconNamed: #smallQuitIcon
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpIconVisitor>>visitSessionSnapshot: aSnapshotChange [
	^ self iconNamed: #smallSaveIcon
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpIconVisitor>>visitSessionStart: anEvent [
	^ self iconNamed: #smallDoItIcon
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpIconVisitor>>visitTraitAddition: aTraitCreation [
	^ self additionIcon
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpIconVisitor>>visitTraitModification: aTraitModificationChange [
	^ self modificationIcon
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpIconVisitor>>visitTraitRemoval:  aTraitRemoval [
	^ self removalIcon
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpIconVisitor>>visitUndo: anUndoEvent [
	^ self iconNamed: #smallUndoIcon
]
