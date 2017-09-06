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
	#category : #Tool-CriticBrowser,
	#timestamp : '<historical>'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:37'
}
CriticToolbar class>>defaultSpec [
<spec>

	^SpecLayout composed
		newRow: [:r |
			r 
				add: #browseModel;
				add: #transformModel;
				add: #falsepositiveModel
			]  height: 25
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:37'
}
CriticToolbar>>browseCritic [

	criticHolder value ifNotNil: [ :elem | elem sourceAnchor entity browse ] 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
CriticToolbar>>browseModel [

	^ browseModel
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:37'
}
CriticToolbar>>critic: aCritic [

	criticHolder value: aCritic.
	transformModel enabled: (aCritic isNotNil and: [ aCritic providesChange ])
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
CriticToolbar>>falsepositiveModel [

	^ falsepositiveModel
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
CriticToolbar>>initialize [

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

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
CriticToolbar>>initializeWidgets [

]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
CriticToolbar>>registerForChanges [

	criticHolder whenChangedDo: [ :contents |
		| boolean |
		boolean := contents notNil.
		browseModel state: (boolean and: [ browseModel enabled ]).
		transformModel state: (boolean and: [ transformModel enabled ]).
		falsepositiveModel state: (boolean and: [ falsepositiveModel enabled ]) 
		]

]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:37'
}
CriticToolbar>>rule: aRule [
	
	ruleHolder value: aRule. 
	

]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
CriticToolbar>>setBrowseModel [
	
	browseModel
		state: false;
		label: 'Browse';
		action: [ self browseCritic ].
	

]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
CriticToolbar>>setFalsepositiveModel [
	
	falsepositiveModel
		state: false;
		label: 'Mark as wrong';
		action: [  ].
	

]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
CriticToolbar>>setFocusOrder [

	self focusOrder
		add: browseModel;
		add: transformModel;
		add: falsepositiveModel.
		
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
CriticToolbar>>setTransformModel [
	
	transformModel
		state: false;
		label: 'Transform';
		action: [ self transformCritic ].
	

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:37'
}
CriticToolbar>>transformCritic [
	 criticHolder value
		ifNotNil: [:critic | critic change execute ]
	

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
CriticToolbar>>transformModel [

	^ transformModel
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
CriticToolbar>>whenFalsePositiveClickedDo: aBlock [

	self falsepositiveModel whenActionPerformedDo: aBlock
]
