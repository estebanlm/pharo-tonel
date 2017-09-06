"

"
Class {
	#name : #GTPlaygroundPlayPagesList,
	#superclass : #GLMFallbackScrollListBrick,
	#category : #GT-Playground,
	#timestamp : ''
}

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlaygroundPlayPagesList>>hideActionsOf: aRowBrick [
	aRowBrick subbricks select: [ :each | each isKindOf: GLMHintableActionButtonBrick ] thenDo: [ :each | each visible: false ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlaygroundPlayPagesList>>initialize [
	super initialize.
	
	self
		emptyBrick: self newEmptyText;
		maxHeight: 350;
		height: [ :b | b band height ];
		width: 250
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlaygroundPlayPagesList>>newAcceptButtonFor: aPlayPage [
	^ self newActionButton
		hintTitle: 'Accept';
		hintText: 'load saved page into playground';
		icon: (self iconNamed: #glamorousAccept);
		action: [ :b | 
			self remove.
			self announce: #pageAccepted event: aPlayPage ]
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlaygroundPlayPagesList>>newActionButton [
	|margin padding|
	margin := self themer bindingThemer padding + self themer bindingThemer borderWidth.
	padding := (margin / 2) rounded.
	
	^ GLMHintableActionButtonBrick new
		padding: padding;
		visible: false;
		margin: { 0 . padding };
		hShrinkWrap;
		vAlign: #center;
		pressedColor: self themer buttonPressedColor
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlaygroundPlayPagesList>>newEmptyText [

	^ GLMLabelBrick new
			text: 'No saved pages';
			hSpaceFill;
			textPosition: #center;
			padding: self themer bindingThemer emptyTextPadding;
			textColor: self themer bindingThemer emptyTextColor;
			fontSize: self themer bindingThemer emptyTextFontSize;
			yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlaygroundPlayPagesList>>newPageLabel [

	^ GLMLabelBrick new
		hSpaceFill;
		vShrinkWrap;
		textPosition: #leftCenter;
		vAlign: #center;
		padding: { 0 . self themer bindingThemer padding }
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlaygroundPlayPagesList>>newPageRow: playPage in: aGTPlayBook [

	^ self newRow
		addBrickBack: (self newPageLabel
			textColor: self themer textColor;
			text: (playPage content asString contractTo: 50));
		addBrickBack: (self newAcceptButtonFor: playPage);
		when: #onDoubleClicked do: [ self remove. self announce: #pageAccepted event: playPage ];
		with: [ :aRow | aRow 	
			when: #onMouseHover do: [ self showActionsOf: aRow ];
			when: #onMouseUnhover do: [ self hideActionsOf: aRow ] ];
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlaygroundPlayPagesList>>newRow [
	^ GLMInteractableBrick new
		enable;
		enableDoubleClick;
		selectedColor: self themer bindingThemer selectedColor;
		vShrinkWrap;
		hSpaceFill;
		padding: self themer bindingThemer padding;
		paddingRight: 0
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlaygroundPlayPagesList>>on: aGTPlayBook [
	|model|
	model := GLMBrickListModel new
		on: aGTPlayBook pages.
	model
		morphAtLogic: [ :index | self newPageRow: (model origin at: index) in: aGTPlayBook ].
	self model: model
]

{
	#category : #brick-properties-events,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlaygroundPlayPagesList>>onThemerChanged [
	super onThemerChanged.
	
	self doLayoutForce
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlaygroundPlayPagesList>>remove [

	(self ownerThatIsA:  GLMFoundationBrick)
		ifNotNil: [ :o | o delete ]
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlaygroundPlayPagesList>>showActionsOf: aRowBrick [
	aRowBrick subbricks select: [ :each | each isKindOf: GLMHintableActionButtonBrick ] thenDo: [ :each | each visible: true ]
]
