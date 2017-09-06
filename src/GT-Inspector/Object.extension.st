Extension {
	#name : #Object
}

{
	#category : #'*GT-Inspector',
	#timestamp : ' 8/31/2017 05:26:35'
}
Object>>gtDisplayOn: stream [
	"This offers a means to customize how the object is shown in the inspector"
	^ self printOn: stream
]

{
	#category : #'*GT-Inspector',
	#timestamp : ' 8/31/2017 05:26:35'
}
Object>>gtDisplayString [
	"This offers a means to customize how the object is shown in the inspector.
	Do not override this method. Override gtDisplayOn: instead"
		
	| limitedString limit |
	limit := 1000.
	limitedString := String streamContents: [:s | self gtDisplayOn: s] limitedTo: limit.
	limitedString size < limit ifTrue: [^ limitedString].
	^ limitedString , ' ...'
]

{
	#category : #'*GT-Inspector',
	#timestamp : ' 8/31/2017 05:26:35'
}
Object>>gtInspectorHash [

	^ self identityHash.
]

{
	#category : #'*GT-Inspector',
	#timestamp : ' 8/31/2017 05:26:35'
}
Object>>gtInspectorIcon [
	^ self iconOrThumbnailOfSize: 16
]

{
	#category : #'*GT-Inspector',
	#timestamp : ' 8/31/2017 05:26:35'
}
Object>>gtInspectorInterestingObject [
	^ self
]

{
	#category : #'*GT-Inspector',
	#timestamp : ' 8/31/2017 05:26:35'
}
Object>>gtInspectorRawIn: composite [
	"This is the most basic presentation showing the state of the object"
	^ composite custom: GTObjectVariablesBrowser new
]

{
	#category : #'*GT-Inspector',
	#timestamp : ' 8/31/2017 05:26:35'
}
Object>>gtInspectorVariableNodesIn: aCollection [
	"This is a helper method that adds to the given collection all nodes modeling named and 
	indexed attributes for the current object.
	Subclasses can override it to specialize what appears in the variables presentation."
	| indexableDisplayLimit top bottom topLimit bottomLimit |
	
	indexableDisplayLimit := GTInspector indexableDisplayLimit.        
	top := 1.
	bottom := self basicSize.
	topLimit    := indexableDisplayLimit min: bottom.
	bottomLimit := indexableDisplayLimit max: (bottom - indexableDisplayLimit).

	top to: topLimit do: [ :index | 
		aCollection add: (GTInspectorIndexedNode hostObject: self index: index) ].
	
	bottomLimit + 1 to: bottom do: [ :index |
		aCollection add: (GTInspectorIndexedNode hostObject: self index: index) ].
	
	aCollection
		addAll: ((self class allSlots collect: [ :slot | 
			GTInspectorSlotNode hostObject: self slot: slot ]))
]

{
	#category : #'*GT-Inspector',
	#timestamp : ' 8/31/2017 05:26:35'
}
Object>>gtInspectorVariableValuePairs [
	"This is a helper method that returns a collection of 
		variable_name -> value
	for the current object.
	Subclasses can override it to specialize what appears in the variables presentation"
	| bindings |
	bindings := OrderedCollection new.
	self gtInspectorVariableNodesIn: bindings.
	^ bindings collect: [ :aNode | aNode key -> aNode value ]
]
