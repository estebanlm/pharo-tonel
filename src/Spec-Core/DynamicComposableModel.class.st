"
I'm a CompsableModel with a dynamic behavior for managing subwidgets and the value holder communicates with them.

The idea is that instead of having a fix set of valueHolders controlling various aspects of the model. I have a dictionary to hold such elements.

You can also have a look at DynamicalPopup for an example.

I provide the following variables and its accessors
- layout to put a layout created dynamically.
- widget is a Dictionary containing my dynamics widgets.

I'm specializing
- doesNotUnderstand:  to search in my dictionary before rise an exception, so that the programmer can simply use accessors to access my dynamic elements. 
- openWithSpec to use the layout in my variable if it is not nil.

I provide the following messages
- instantiateModels: to create instances of subwidgets. It takes a collection of pair, first of each pair is the string to use as key in the dictionary, second is the class name to instantiate.
- assign:to: to put in the dictionary a widget already instantiated.

todo
- needFullRebuild:
- retrieveSpec:
"
Class {
	#name : #DynamicComposableModel,
	#superclass : #ComposableModel,
	#instVars : [
		'widgets',
		'layout'
	],
	#category : #Spec-Core,
	#timestamp : 'Spirita 7/19/2016 11:09'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:18'
}
DynamicComposableModel>>assign: aModel to: anInstVarName [

	widgets 
		at: anInstVarName
		put: aModel.
		
	aModel owner: self
]

{
	#category : #'error handling',
	#timestamp : ' 8/31/2017 05:26:18'
}
DynamicComposableModel>>doesNotUnderstand: aMessage [
	"To make sure that we can use accessors to access the dynamically managed subcomponents."
	
	^ widgets 
			at: aMessage selector 
			ifAbsent: [ super doesNotUnderstand: aMessage ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
DynamicComposableModel>>initialize [

	widgets := OrderedIdentityDictionary new asValueHolder.
	layout := nil asValueHolder.
	super initialize.	
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
DynamicComposableModel>>initializeWidgets [

]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:18'
}
DynamicComposableModel>>instantiateModels: aCollectionOfPairs [
 
	aCollectionOfPairs pairsDo: [ :k :v |
		widgets at: k asSymbol put: (self createInstanceFor: v) ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
DynamicComposableModel>>layout [

	^ layout value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
DynamicComposableModel>>layout: aLayout [

	layout value: aLayout
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
DynamicComposableModel>>needFullRebuild: aBoolean [

	self needRebuild: aBoolean.
	self widgetsDo: [:e | e needRebuild: aBoolean ]
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
DynamicComposableModel>>openWithSpec [

	self layout ifNil: [ ^ super openWithSpec ].
	^ self openWithSpecLayout: self layout
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
DynamicComposableModel>>retrieveSpec: aSelector [

	self layout ifNil: [ ^ super retrieveSpec: aSelector ].

	^ self layout
		selector: aSelector;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
DynamicComposableModel>>widgets [

	^ widgets
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
DynamicComposableModel>>widgetsDo: aBlock [

	self widgets do: aBlock 
]
