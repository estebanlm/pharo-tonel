"
I am the toolbar for a selected SmallLint Critic in the critic browser.


Instance Variables
	browseModel:		<Object>
	criticHolder:		<Object>
	falsepositiveModel:		<Object>
	ruleHolder:		<Object>
	transformModel:		<Object>

browseModel
	- xxxxx

criticHolder
	- xxxxx

falsepositiveModel
	- xxxxx

ruleHolder
	- xxxxx

transformModel
	- xxxxx

"
Class {
	#name : #CriticToolbar,
	#superclass : #ComposableModel,
	#instVars : [
		'ruleHolder',
		'criticHolder',
		'browseModel',
		'falsepositiveModel',
		'transformModel'
	],
	#category : #Tool-CriticBrowser
}

{ #category : #specs }
CriticToolbar class >> defaultSpec [
<spec>

	^SpecLayout composed
		newRow: [:r |
			r 
				add: #browseModel;
				add: #transformModel;
				add: #falsepositiveModel
			]  height: 25
]

{ #category : #private }
CriticToolbar >> browseCritic [

	criticHolder value ifNotNil: [ :elem | elem sourceAnchor entity browse ] 
]

{ #category : #accessing }
CriticToolbar >> browseModel [

	^ browseModel
]

{ #category : #api }
CriticToolbar >> critic: aCritic [

	criticHolder value: aCritic.
	transformModel enabled: (aCritic isNotNil and: [ aCritic providesChange ])
]

{ #category : #accessing }
CriticToolbar >> falsepositiveModel [

	^ falsepositiveModel
]

{ #category : #initialization }
CriticToolbar >> initialize [

	super initialize.
	criticHolder := nil asValueHolder.
	ruleHolder := nil asValueHolder.
	browseModel := self instantiate: ButtonModel.
	transformModel := self instantiate: ButtonModel.
	falsepositiveModel := self instantiate: ButtonModel.
	self setFocusOrder.	
	self setBrowseModel.
	self setTransformModel.
	self setFalsepositiveModel.
	self registerForChanges.
]

{ #category : #initialization }
CriticToolbar >> initializeWidgets [
]

{ #category : #initialization }
CriticToolbar >> registerForChanges [

	criticHolder whenChangedDo: [ :contents |
		| boolean |
		boolean := contents notNil.
		browseModel state: (boolean and: [ browseModel enabled ]).
		transformModel state: (boolean and: [ transformModel enabled ]).
		falsepositiveModel state: (boolean and: [ falsepositiveModel enabled ]) 
		]

]

{ #category : #api }
CriticToolbar >> rule: aRule [
	
	ruleHolder value: aRule. 
	

]

{ #category : #initialization }
CriticToolbar >> setBrowseModel [
	
	browseModel
		state: false;
		label: 'Browse';
		action: [ self browseCritic ].
	

]

{ #category : #initialization }
CriticToolbar >> setFalsepositiveModel [
	
	falsepositiveModel
		state: false;
		label: 'Mark as wrong';
		action: [  ].
	

]

{ #category : #initialization }
CriticToolbar >> setFocusOrder [

	self focusOrder
		add: browseModel;
		add: transformModel;
		add: falsepositiveModel.
		
]

{ #category : #initialization }
CriticToolbar >> setTransformModel [
	
	transformModel
		state: false;
		label: 'Transform';
		action: [ self transformCritic ].
	

]

{ #category : #private }
CriticToolbar >> transformCritic [
	 criticHolder value
		ifNotNil: [:critic | critic change execute ]
	

]

{ #category : #accessing }
CriticToolbar >> transformModel [

	^ transformModel
]

{ #category : #initialization }
CriticToolbar >> whenFalsePositiveClickedDo: aBlock [

	self falsepositiveModel whenActionPerformedDo: aBlock
]
