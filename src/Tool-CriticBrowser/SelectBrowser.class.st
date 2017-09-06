"
A simple selection browser.
"
Class {
	#name : #SelectBrowser,
	#superclass : #ComposableModel,
	#instVars : [
		'toSelectModel',
		'selectedModel',
		'addButtonModel',
		'addAllButtonModel',
		'removeButtonModel',
		'removeAllButtonModel',
		'nextButtonModel'
	],
	#category : #Tool-CriticBrowser,
	#timestamp : '<historical>'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:37'
}
SelectBrowser class>>defaultSpec [

		<spec>
	
	^ SpecLayout composed
		newColumn: [:c |
			c
			newRow: [:r |
				r 
					add: #toSelectModel;
					addSplitter;
					add:  #selectedModel];
			newRow: [:r |
				r 
					add:#addButtonModel;
					add:#addAllButtonModel;
					add:#removeButtonModel;
					add:#removeAllButtonModel;
					add: #nextButtonModel ] height: 25]	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
SelectBrowser>>addAllButtonModel [
	^ addAllButtonModel
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
SelectBrowser>>addButtonModel [
	^ addButtonModel
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:37'
}
SelectBrowser>>initialExtent [
	^   450@360
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
SelectBrowser>>initializeWidgets [

	addButtonModel := self newButton.
	addAllButtonModel := self newButton. 
	removeButtonModel := self newButton.
	removeAllButtonModel := self newButton.
	nextButtonModel := self newButton.
		
	self setFocusOrder.

	self setAddButtonModel. 
	self setAddAllButtonModel. 
	self setRemoveButtonModel. 
	self setRemoveAllButtonModel. 
	self setNextButtonModel. 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
SelectBrowser>>items: aCollection [
	"Set the elements to be analysed"
	
	toSelectModel items: (self sort: aCollection)

]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:37'
}
SelectBrowser>>nextAction [
	self subclassResponsibility

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
SelectBrowser>>nextButtonModel [
	^ nextButtonModel
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
SelectBrowser>>removeAllButtonModel [
	^ removeAllButtonModel
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
SelectBrowser>>removeButtonModel [
	^ removeButtonModel
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
SelectBrowser>>selectedModel [
	^ selectedModel
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
SelectBrowser>>setAddAllButtonModel [
	
	addAllButtonModel
		state: false;
		label: 'Add All';
		action: [ self  addAllItems].
	

]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
SelectBrowser>>setAddButtonModel [
	
	addButtonModel
		state: false;
		label: 'Add';
		action: [ self addItems ].
	

]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
SelectBrowser>>setFocusOrder [

	self focusOrder
		add: addButtonModel;
		add: addAllButtonModel;
		add: removeButtonModel;
		add: removeAllButtonModel.
		
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
SelectBrowser>>setNextButtonModel [
	
	nextButtonModel
		state: false;
		label: 'Next';
		action: [ self  nextAction ].
	

]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
SelectBrowser>>setRemoveAllButtonModel [
	
	removeAllButtonModel
		state: false;
		label: 'Remove All';
		action: [ self  removeAllItems ].
	

]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
SelectBrowser>>setRemoveButtonModel [
	
	removeButtonModel
		state: false;
		label: 'Remove';
		action: [ self removeItems ].
	

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
SelectBrowser>>toSelectModel [
	^ toSelectModel
]
