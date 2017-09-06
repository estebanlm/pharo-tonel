"
I provide an API for adding table columns having various  properties. I should be used by glamour presentations representing tables. I also provide the hook methods called be the Glamour renderer (see the *callbacks* protocol).

Public API and Key Messages
--------------------
Main methods:

- #column: evaluated:		        to add a configured column; there are many other methods that adds columns and configure different properties
		
- #addColumn: 		                  to directly add a column object
		
- #hideHeader                                  to hide the header of all columns
"
Trait {
	#name : #TGLMScriptingAPITablePresentation,
	#traits : '{}',
	#classTraits : '{}',
	#category : #Glamour-Presentations,
	#timestamp : 'AndreiChis 2/6/2017 14:25'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
TGLMScriptingAPITablePresentation classSide>>defaultIntercellSpacing [
	^ 3@1 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
TGLMScriptingAPITablePresentation>>addColumn: aColumn [
	self columns add: aColumn
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
TGLMScriptingAPITablePresentation>>column: aBlockOrString evaluated: aBlock [
	self addColumn: (GLMTableColumn new 
		title: aBlockOrString; 
		computation: aBlock)
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
TGLMScriptingAPITablePresentation>>column: aBlockOrString evaluated: aBlock modified: aModifiedBlock [
	self addColumn: (GLMTableColumn new 
		title: aBlockOrString;
		computation: aBlock;
		modifiedBlock: aModifiedBlock)
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
TGLMScriptingAPITablePresentation>>column: aBlockOrString evaluated: aBlock sortedBy: aSortingBlock [
	self addColumn: (GLMTableColumn new 
		title: aBlockOrString; 
		computation: aBlock;
		sortBlock: aSortingBlock)
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
TGLMScriptingAPITablePresentation>>column: aBlockOrString evaluated: aBlock tags: anObject  [
	self addColumn: (GLMTableColumn new 
		title: aBlockOrString; 
		computation: aBlock;
		tags: anObject)
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
TGLMScriptingAPITablePresentation>>column: aBlockOrString evaluated: aBlock tags: anObject filtered: anotherObject [
	self addColumn: (GLMTableColumn new 
		title: aBlockOrString; 
		computation: aBlock;
		tagsBlock: anObject;
		tagsFilter: anotherObject)
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
TGLMScriptingAPITablePresentation>>column: aBlockOrString evaluated: aBlock tags: anObject sortedBy: aSortingBlock [
	self addColumn: (GLMTableColumn new 
		title: aBlockOrString; 
		computation: aBlock;
		tags: anObject;
		sortBlock: aSortingBlock)
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
TGLMScriptingAPITablePresentation>>column: aBlockOrString evaluated: aBlock width: aNumber  [
	self addColumn: (GLMTableColumn new 
		title: aBlockOrString; 
		computation: aBlock;
		width: aNumber;
		yourself)	
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
TGLMScriptingAPITablePresentation>>column: aBlockOrString evaluated: aBlock width: aNumber tags: anObject [
	self addColumn: (GLMTableColumn new 
		title: aBlockOrString; 
		computation: aBlock;
		width: aNumber;
		tags: anObject;
		yourself)	
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
TGLMScriptingAPITablePresentation>>column: aBlockOrString evaluated: aBlock width: aNumber tags: anObject sortedBy: aSortingBlock [
	self addColumn: (GLMTableColumn new 
		title: aBlockOrString; 
		computation: aBlock;
		width: aNumber;
		tags: anObject;
		sortBlock: aSortingBlock
		yourself)	
]

{
	#category : #callbacks,
	#timestamp : ' 8/31/2017 05:26:33'
}
TGLMScriptingAPITablePresentation>>column: aGlamourColumn valueFor: anObject [
	^ aGlamourColumn computation glamourValue: 
		(anObject asGlamorousMultiValue,
		 self entity asGlamorousMultiValue,
		 self asGlamorousMultiValue)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
TGLMScriptingAPITablePresentation>>columns [
	self explicitRequirement
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
TGLMScriptingAPITablePresentation>>hideHeader [
	self explicitRequirement
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
TGLMScriptingAPITablePresentation>>shouldShowHeader [
	self explicitRequirement
]

{
	#category : #callbacks,
	#timestamp : ' 8/31/2017 05:26:33'
}
TGLMScriptingAPITablePresentation>>titleValueOfColumn: aColumn [
	^ aColumn title glamourValue: self entity
]
