"
I answer a morph for each EpEvent.
"
Class {
	#name : #EpMorphVisitor,
	#superclass : #EpEntryContentVisitor,
	#category : #EpiceaBrowsers-Visitors,
	#timestamp : 'MartinDias 10/27/2014 17:59'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMorphVisitor>>displayBehavior: aString  [

	^ { self morphFactory emphasizedStringFor: aString }
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMorphVisitor>>displayBehavior: aClassName method: aSelector [

	^ (self displayBehavior: aClassName), (self displayOperation: '»'), (self displayString: aSelector)
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMorphVisitor>>displayBehaviorComment: aClassName [

	^ (self displayBehavior: aClassName), (self displayOperation: 'comment')
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMorphVisitor>>displayBrowserOperation: aBrowserOperationEvent [

	^ self displayOperation: (
		String streamContents: [ :stream |
			stream nextPutAll: aBrowserOperationEvent title ])
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMorphVisitor>>displayCategory: aCategoryName [

	^ (self displayOperation: 'Package tag'), (self displayString: aCategoryName asString)
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMorphVisitor>>displayClass: aClassName protocol: aProtocolName [

	^ (self displayBehavior: aClassName), (self displayOperation: 'protocol'), (self displayString: aProtocolName)

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMorphVisitor>>displayOperation: aString  [

	^ self 
		displayString: aString 
		color: self morphFactory softerTextColor
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMorphVisitor>>displayString: aString [

	^ { aString asMorph }
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMorphVisitor>>displayString: aString color: aColor [

	^ { self morphFactory stringFor: aString color: aColor }
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMorphVisitor>>morphFactory [

	^ EpMorphFactory default
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMorphVisitor>>visitBehaviorCategoryChange: aClassRecategorizationChange [

	^	(self displayOperation: 'Move'),
		(self displayBehavior: aClassRecategorizationChange behaviorAffectedName), 
		(self displayOperation: 'from tag'),
		(self displayString: aClassRecategorizationChange oldCategory), 
		(self displayOperation: 'to'), 
		(self displayString: aClassRecategorizationChange newCategory)
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMorphVisitor>>visitBehaviorCommentChange: aChange [

	^ self displayBehaviorComment: aChange behaviorAffectedName
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMorphVisitor>>visitBehaviorCopy: aClassCopy [

	^ (self displayBehavior: aClassCopy definition name), (self displayOperation: 'copyNamed:'), (self displayBehavior: '#', aClassCopy newName)
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMorphVisitor>>visitBehaviorNameChange: aClassRenamedChange [

	^	(self displayOperation: 'Rename'), 
		(self displayBehavior: aClassRenamedChange oldName), 
		(self displayOperation: 'as'), 
		(self displayString: aClassRenamedChange newName)
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMorphVisitor>>visitCategoryAddition: aCategoryChange [

	^ self displayCategory: aCategoryChange categoryName
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMorphVisitor>>visitCategoryRemoval: aCategoryChange [

	^ self displayCategory: aCategoryChange categoryName
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMorphVisitor>>visitCategoryRename: aCategoryChange [

	^	(self displayOperation: 'Rename tag'),
		(self displayString: aCategoryChange oldCategoryName),
		(self displayOperation: 'as'),
		(self displayString: aCategoryChange newCategoryName )
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMorphVisitor>>visitClassChange: aChange [

	^ self displayBehavior: aChange behaviorAffectedName
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMorphVisitor>>visitEvent: anEvent [

	^ self displayString: ''
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMorphVisitor>>visitExpressionEvaluation: anExpressionEvaluation [

	^ (self displayOperation: 'DoIt:'), (self displayString:
		(anExpressionEvaluation expression printStringLimitedTo: 50) 
			withSeparatorsCompacted)
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMorphVisitor>>visitLogCommentModification: aLogCommentModification  [

	^ self displayString: aLogCommentModification comment printString
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMorphVisitor>>visitMethodAddition: aMethodCreatedChange [

	^ self 
		displayBehavior: aMethodCreatedChange behaviorAffectedName
		method: aMethodCreatedChange methodAdded selector
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMorphVisitor>>visitMethodModification: aMethodModified [

	^ self 
		displayBehavior: aMethodModified behaviorAffectedName
		method: aMethodModified oldMethod selector
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMorphVisitor>>visitMethodRemoval: aMethodRemoved [

	^ self 
		displayBehavior: aMethodRemoved behaviorAffectedName
		method: aMethodRemoved methodRemoved selector
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMorphVisitor>>visitMonticelloVersionSave: aChange [

	^	(self displayOperation: 'MC save'), 
		(self displayString: aChange versionName asString), 
		(self displayOperation: 'on'), 
		(self displayString: aChange repositoryDescription asString)
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMorphVisitor>>visitMonticelloVersionsLoad: aMonticelloVersionLoaded  [

	^	(self displayOperation: 'MC load'), 
		(self displayString: aMonticelloVersionLoaded versionNames asCommaStringAnd)
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMorphVisitor>>visitProtocolAddition: aProtocolChange [

	^ self 
		displayClass: aProtocolChange behaviorAffectedName
		protocol: aProtocolChange protocol asString
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMorphVisitor>>visitProtocolRemoval: aProtocolChange [

	^ self 
		displayClass: aProtocolChange behaviorAffectedName
		protocol: aProtocolChange protocol asString
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMorphVisitor>>visitRedo: aRedoEvent [

	^ self displayBrowserOperation: aRedoEvent
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMorphVisitor>>visitRefactoring: aRefactoring  [

	^  (self displayOperation: 'Refactoring: '), 
		(self displayString: (String streamContents: [ :aStream | 
			aRefactoring summaryOn: aStream ]))
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMorphVisitor>>visitSessionEnd: anEvent [

	^ (self displayOperation: 'End:'), 
		(self displayString: anEvent imageName)
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMorphVisitor>>visitSessionSnapshot: anEvent [

	^ (self displayOperation: 'Snapshot:'), 
		(self displayString: anEvent imageName)
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMorphVisitor>>visitSessionStart: anEvent [

	^ (self displayOperation: 'Start:'), 
		(self displayString: anEvent imageName)
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMorphVisitor>>visitTraitChange: aChange [

	^ self displayBehavior: aChange behaviorAffectedName
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpMorphVisitor>>visitUndo: anUndoEvent [

	^ self displayBrowserOperation: anUndoEvent
]
