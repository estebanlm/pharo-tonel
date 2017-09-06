"

"
Class {
	#name : #GTPlaygroundBindingsList,
	#superclass : #GLMFallbackScrollListBrick,
	#category : #GT-Playground,
	#timestamp : ''
}

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlaygroundBindingsList>>hideActionsOf: aRowBrick [
	aRowBrick subbricks select: [ :each | each isKindOf: GLMHintableActionButtonBrick ] thenDo: [ :each | each visible: false ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlaygroundBindingsList>>initialize [
	super initialize.
	
	self
		emptyBrick: self newEmptyText;
		maxHeight: 300;
		height: [ :b | b band height ];
		width: 300
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlaygroundBindingsList>>newActionButton [
	|margin padding|
	margin := self themer bindingThemer padding + self themer bindingThemer borderWidth.
	padding := (margin / 2) rounded.
	
	^ GLMHintableActionButtonBrick new
		padding: padding;
		visible: false;
		margin: {0 . padding};
		marginRight: margin;
		hShrinkWrap;
		vAlign: #center;
		pressedColor: self themer buttonPressedColor
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlaygroundBindingsList>>newBindingLabel [

	^ GLMLabelBrick new
		hSpaceFill: 50;
		vShrinkWrap;
		textPosition: #leftCenter;
		vAlign: #center;
		padding: { 0 . self themer bindingThemer padding }
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlaygroundBindingsList>>newBindingRow: anAssociation in: aCollection [

	^ self newRow
		borderWidth: { 0 . 0 . aCollection last == anAssociation ifTrue: [ 0 ] ifFalse: [ self themer bindingThemer borderWidth ] . 0 };
		addAllBricks: {
			self newBindingLabel
				textColor: self themer textLightColor;
				text: anAssociation key.
			self newBindingLabel
				text: anAssociation value asString.
			self newInspectButtonFor: anAssociation.
			self newGoButtonFor: anAssociation.
			self newRemoveButtonFor: anAssociation };
		with: [ :aRow | aRow 	
			when: #onMouseHover do: [ self showActionsOf: aRow ];
			when: #onMouseUnhover do: [ self hideActionsOf: aRow ] ];
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlaygroundBindingsList>>newEmptyText [

	^ GLMLabelBrick new
			text: 'No bindings';
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
GTPlaygroundBindingsList>>newGoButtonFor: anAssociation [

	^ self newActionButton
		hintTitle: 'Go';
		hintText: 'open new pane to the right';
		icon: self themer bindingThemer goIcon;
		action: [ : b | self remove. self announce: #go event: anAssociation. ]
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlaygroundBindingsList>>newInspectButtonFor: anAssociation [

	^ self newActionButton
		hintTitle: 'Inspect';
		hintText: 'will open inspector window';
		icon: self themer bindingThemer inspectIcon;
		action: [ : b | self remove. self announce: #inspect event: anAssociation. ]
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlaygroundBindingsList>>newRemoveButtonFor: anAssociation [

	^ self newActionButton
		beError;
		hintTitle: 'Remove binding';
		hintText: 'will unassign variable';
		icon: self themer bindingThemer removeIcon;
		action: [ : b |
			b owner disable.
			GLMAnimation swipeLeft
				onCompleted: [
					self announce: #bindingRemoved event: anAssociation.
					self model origin remove: anAssociation.
					self invalidate ];
				animate: b owner ]
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlaygroundBindingsList>>newRow [

	^ GLMInteractableBrick new
		enable;
		selectedColor: self themer bindingThemer selectedColor;
		vShrinkWrap;
		hSpaceFill;
		padding: { self themer bindingThemer padding . 0 . self themer bindingThemer padding + self themer bindingThemer borderWidth };
		borderColor: self themer bindingThemer borderColor
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlaygroundBindingsList>>on: aBindingsCollection [
	|model|
	model := GLMBrickListModel new
		on: aBindingsCollection.
	model
		morphAtLogic: [ :index | self newBindingRow: (model origin at: index) in: model origin ].
	self model: model
]

{
	#category : #brick-properties-events,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlaygroundBindingsList>>onThemerChanged [
	super onThemerChanged.
	
	self doLayoutForce
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlaygroundBindingsList>>remove [

	(self ownerThatIsA:  GLMFoundationBrick)
		ifNotNil: [ :o | o delete ]
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlaygroundBindingsList>>showActionsOf: aRowBrick [
	aRowBrick subbricks select: [ :each | each isKindOf: GLMHintableActionButtonBrick ] thenDo: [ :each | each visible: true ]
]
