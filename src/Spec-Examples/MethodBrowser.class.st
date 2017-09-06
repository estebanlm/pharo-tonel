"
A MethodBrowser is a simple browser using Spec to display a list of methods and their source code

self example
"
Class {
	#name : #MethodBrowser,
	#superclass : #ComposableModel,
	#instVars : [
		'listModel',
		'textModel',
		'toolbarModel'
	],
	#category : #Spec-Examples,
	#timestamp : 'Spirita 7/28/2016 14:34'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:25'
}
MethodBrowser class>>defaultSpec [
	<spec>
	| delta |
	delta := 15.
	^ SpecLayout composed 
			add: #listModel origin: 0@0 corner: 1@0.5 offsetOrigin: 0@0 offsetCorner: 0@(delta negated);
			add: #toolbarModel origin: 0@0.5 corner: 1@0.5 offsetOrigin: 0@(delta negated) offsetCorner: 0@delta;
			add: #textModel origin: 0@0.5 corner: 1@1 offsetOrigin: 0@delta offsetCorner: 0@0;
			yourself
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:25'
}
MethodBrowser class>>defaultSpec2 [
^{ #Panel.
		#changeTableLayout.
		#listDirection:. 	#bottomToTop.
		#addMorph:. 		{#model. #listModel.}.
		#addMorph:. 		{#model. #textModel.}.
		#vResizing:.		 #spaceFill.
		#hResizing:.		 #spaceFill.}
]

{
	#category : #example,
	#timestamp : ' 8/31/2017 05:26:25'
}
MethodBrowser class>>example [
	| example |
	example := MethodBrowser new.
	example methods: Object methods;
	 openWithSpec.
	^example
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:25'
}
MethodBrowser class>>title [

	^ 'Method Browser'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
MethodBrowser>>acceptBlock: aBlock [

	textModel acceptBlock: aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
MethodBrowser>>action [

	^ textModel actionToPerformHolder content
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:25'
}
MethodBrowser>>displayBlock: aBlock [

	listModel displayBlock: aBlock
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:25'
}
MethodBrowser>>initializePresenter [

	listModel whenSelectedItemChanged: [:selection |
		selection
			ifNil: [
				textModel text: ''.
				textModel behavior: nil.
				toolbarModel method: nil ]
			ifNotNil: [:m | 
				textModel text: m sourceCode.
				textModel behavior: m methodClass.
				toolbarModel method: m ]].
	
	self acceptBlock: [:t | self listModel selectedItem inspect ].
	self wrapWith: [:item | item methodClass name,'>>#', item selector ].
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:25'
}
MethodBrowser>>initializeWidgets [
	listModel := self instantiate: ListModel .
	textModel := self newCode.
	toolbarModel := self instantiate: MethodToolbar.
	self focusOrder
		add: listModel;
		add: toolbarModel;
		add: textModel.
	textModel aboutToStyle: true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
MethodBrowser>>listModel [

	^ listModel
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:25'
}
MethodBrowser>>methods: aList [

	"Here I reroute my entry point to the list model's entry point"
	self listModel items: aList
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:25'
}
MethodBrowser>>sortingBlock: aBlock  [

	listModel sortingBlock: aBlock 
]

{
	#category : #focus,
	#timestamp : ' 8/31/2017 05:26:25'
}
MethodBrowser>>takeKeyboardFocus [

	^ self listModel takeKeyboardFocus
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
MethodBrowser>>textModel [

	^ textModel
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
MethodBrowser>>toolbarModel [

	^ toolbarModel
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:25'
}
MethodBrowser>>wrapWith: aBlock [

	listModel displayBlock: aBlock
]
