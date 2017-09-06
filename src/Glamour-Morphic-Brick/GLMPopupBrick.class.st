"
I am a popup with an action button hint text
"
Class {
	#name : #GLMPopupBrick,
	#superclass : #GLMEmptyPopupBrick,
	#instVars : [
		'hintBrick',
		'hintText',
		'titleBrick',
		'titleText'
	],
	#category : #Glamour-Morphic-Brick-Widgets-UI-Popup,
	#timestamp : 'AliakseiSyrel 2/28/2017 09:19'
}

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPopupBrick class>>exampleAllTypesBelowOpen [
	
	self gtExampleAllTypesBelow openCenteredInBrickWindowLabeled: 'All Below Popup Types'
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPopupBrick class>>exampleAllTypesOpen [
	
	self gtExampleAllTypes openCenteredInBrickWindowLabeled: 'All Popup Types'
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPopupBrick class>>gtExampleAllTypes [
	<gtExample>
	<label: 'Example of all popup types'>

	^ GLMBrick new
		hShrinkWrap;
		vShrinkWrap;
		addBrickBack: (self createButton: [ :b | self new beUpward; openOn: b ]);
		addBrickBack: (self createButton: [ :b | self new beUpward; beHelp; openOn: b ]);
		addBrickBack: (self createButton: [ :b | self new beUpward; beError; openOn: b ]);
		addBrickBack: (self createButton: [ :b | self new beUpward; beSuccess; openOn: b ]);
		yourself
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPopupBrick class>>gtExampleAllTypesBelow [
	<gtExample>
	<label: 'Example of all popup types opening below of anchor brick'>

	^ GLMBrick new
		hShrinkWrap;
		vShrinkWrap;
		addBrickBack: (self createButton: [ :b | self new openOn: b ]);
		addBrickBack: (self createButton: [ :b | self new beHelp; openOn: b ]);
		addBrickBack: (self createButton: [ :b | self new beError; openOn: b ]);
		addBrickBack: (self createButton: [ :b | self new beSuccess; openOn: b ]);
		yourself
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPopupBrick>>beError [

	self themer: self themer popupErrorThemer themer
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPopupBrick>>beHelp [

	self themer: self themer popupHelpThemer themer
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPopupBrick>>beSuccess [

	self themer: self themer popupSuccessThemer themer
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPopupBrick>>hintBrick [
	^ hintBrick
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPopupBrick>>hintBrick: anObject [
	hintBrick := anObject.
	
	
	self hintBrick
		textColor: self themer popupThemer textColor.
		
	self contentBrick addBrickBack: self hintBrick
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPopupBrick>>hintText [
	^ hintText ifNil: [ hintText := 'Need help?' ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPopupBrick>>hintText: aBrick [
	hintText := aBrick.

	self hintBrick ifNotNil: [ self hintBrick text: self hintText ]
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPopupBrick>>newHintBrick [

	^ GLMLabelBrick new
		text: self hintText;
		padding: #(0 10);
		width: [ :b | b approximateWidth ];
		height: [ :b | b approximateHeight ]
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPopupBrick>>newTitleBrick [

	^ GLMLabelBrick new
		text: self titleText;
		padding: #(0 10);
		width: [ :b | b approximateWidth ];
		height: [ :b | b approximateHeight ]
]

{
	#category : #events-processing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPopupBrick>>onCreated [
	self contentBrick padding: #(5 0).
	self titleBrick: self newTitleBrick.
	self hintBrick: self newHintBrick.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPopupBrick>>titleBrick [
	^ titleBrick
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPopupBrick>>titleBrick: aBrick [
	titleBrick := aBrick.
	
	self titleBrick
		textColor: self themer popupThemer textColor.
		
	self contentBrick addBrickFirst: self titleBrick
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPopupBrick>>titleText [
	^ titleText ifNil: [ titleText := 'Hi,' ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMPopupBrick>>titleText: aText [
	titleText := aText.
	
	self titleBrick ifNotNil: [ self titleBrick text: self titleText ]
]
