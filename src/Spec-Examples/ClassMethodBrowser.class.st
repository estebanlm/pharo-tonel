"
A ClassMethodBrowser is a simple browser using spec and reusing MethodBrowser to browse classes>>methods>>sourceCode.

self example
"
Class {
	#name : #ClassMethodBrowser,
	#superclass : #ComposableModel,
	#instVars : [
		'listModel',
		'methodModel'
	],
	#category : #Spec-Examples,
	#timestamp : 'Spirita 7/26/2016 14:59'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:25'
}
ClassMethodBrowser class>>defaultSpec [
<spec>
	^ SpecLayout composed
		newRow: [:row | row
						add: #listModel;
						add: #methodModel ];
		yourself
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:25'
}
ClassMethodBrowser class>>defaultSpec2 [
<spec: #default>

	^ SpecLayout composed
		newRow: [:r | 
			r 
				newColumn: #listModel right: 0.5;
				addVSplitter;
				newColumn: #(methodModel listModel) left: 0.5 ] bottom: 0.5;
		addHSplitter;
		newRow: #(methodModel textModel) top: 0.5;
		yourself
]

{
	#category : #example,
	#timestamp : ' 8/31/2017 05:26:25'
}
ClassMethodBrowser class>>example [
	| example |
	example := ClassMethodBrowser new.
	example
		classes: Smalltalk allClasses;
		openWithSpec.
		^example
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:25'
}
ClassMethodBrowser class>>title [

	^ 'Class Method Browser'
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:25'
}
ClassMethodBrowser>>classes: aList [

	self listModel items: aList
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:25'
}
ClassMethodBrowser>>initializePresenter [
	
	listModel whenSelectedItemChanged: [:selection |
		selection 
			ifNotNil: [:class | 
				methodModel methods: (class methods sort: [:a :b | a selector < b selector]).
				methodModel listModel resetSelection ]].
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:25'
}
ClassMethodBrowser>>initializeWidgets [
	listModel := self instantiate:  ListModel .
	methodModel := self instantiate: MethodBrowser.
	self focusOrder
		add: listModel;
		add: methodModel.
	methodModel displayBlock: [ :method | method selector ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
ClassMethodBrowser>>listModel [

	^ listModel
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
ClassMethodBrowser>>methodModel [

	^ methodModel
]
