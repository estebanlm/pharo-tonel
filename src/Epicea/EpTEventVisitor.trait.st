"
I am a visitor for EpEvent subinstances.
"
Trait {
	#name : #EpTEventVisitor,
	#traits : 'EpTCodeChangeVisitor',
	#classTraits : 'EpTCodeChangeVisitor classTrait',
	#category : #Epicea-Visitors,
	#timestamp : '<historical>'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpTEventVisitor>>visitBehaviorCopy: anEvent [
	^ self visitEvent: anEvent
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpTEventVisitor>>visitCodeChange: aChange [
	"Default behavior for any change."
		
	^ self visitEvent: aChange
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpTEventVisitor>>visitEvent: aChange [
	^ self explicitRequirement
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpTEventVisitor>>visitExpressionEvaluation: anExpressionEvaluation [
	^ self visitEvent: anExpressionEvaluation
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpTEventVisitor>>visitLogCommentModification: anEvent  [
	^ self visitEvent: anEvent
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpTEventVisitor>>visitMonticelloVersionSave: anEvent [
	^ self visitEvent: anEvent
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpTEventVisitor>>visitMonticelloVersionsLoad: anEvent [
	^ self visitEvent: anEvent
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpTEventVisitor>>visitRedo: aRedoEvent [
	^ self visitEvent: aRedoEvent
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpTEventVisitor>>visitRefactoring: anEvent  [
	^ self visitEvent: anEvent
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpTEventVisitor>>visitSessionEnd: anEvent [
	^ self visitEvent: anEvent
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpTEventVisitor>>visitSessionSnapshot: anEvent [
	^ self visitEvent: anEvent
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpTEventVisitor>>visitSessionStart: anEvent  [
	^ self visitEvent: anEvent
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpTEventVisitor>>visitUndo: anUndoEvent [
	^ self visitEvent: anUndoEvent
]
