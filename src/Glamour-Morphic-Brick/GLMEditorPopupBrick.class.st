"
I am a popup with a text editor allowing users to ""in-place"" edit values
"
Class {
	#name : #GLMEditorPopupBrick,
	#superclass : #GLMEmptyPopupBrick,
	#instVars : [
		'titleBrick',
		'titleText',
		'textModel',
		'textEditBrick'
	],
	#category : #Glamour-Morphic-Brick-Widgets-UI-Popup,
	#timestamp : 'AliakseiSyrel 2/28/2017 09:18'
}

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMEditorPopupBrick class>>exampleBorderOpen [
	
	self gtExampleBorder openCenteredInBrickWindowLabeled: 'All Popup Types'
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMEditorPopupBrick class>>exampleShadowOpen [
	
	self gtExampleShadow openCenteredInBrickWindowLabeled: 'All Popup Types'
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMEditorPopupBrick class>>gtExampleBorder [
	<gtExample>
	<label: 'Example of editable popup with border'>

	^ GLMBrick new
		hShrinkWrap;
		vShrinkWrap;
		addBrickBack: (self createLabel: [ :b |
			self new
				in: [ :aPopup  | aPopup themer: aPopup themer popupEditorBorderThemer themer ];
				closer: (GLMPopupBrickCloser predicate: GLMPopupBrickOutisideClickPredicate new);
				textModel: 'haba';
				openOn: b ]);
		yourself
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMEditorPopupBrick class>>gtExampleShadow [
	<gtExample>
	<label: 'Example of editable popup with shadow'>

	^ GLMBrick new
		hShrinkWrap;
		vShrinkWrap;
		addBrickBack: (self createLabel: [ :b |
			self new
				in: [ :aPopup  | aPopup themer: aPopup themer popupEditorShadowThemer themer ];
				closer: (GLMPopupBrickCloser predicate: GLMPopupBrickOutisideClickPredicate new);
				textModel: 'haba';
				openOn: b ]);
		yourself
]

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMEditorPopupBrick>>acceptContents: anAnnouncement [
	self announce: #textAccepted event: anAnnouncement.
	self close
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMEditorPopupBrick>>initialize [
	super initialize.

	"self themer: self themer popupEditorShadowThemer themer."
	self themer: self themer popupEditorBorderThemer themer
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMEditorPopupBrick>>newTextEditField [

	^ GLMRubEditingAreaBrick new
		wrapped: false;
		hShrinkWrap;
		vShrinkWrap;
		withoutBorder;
		withoutMargins;
		beForSmalltalkCode;
		text: self textModel;
		yourself
]

{
	#category : #events-processing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMEditorPopupBrick>>onCreated [

	self textEditBrick: self newTextEditField
]

{
	#category : #events-processing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMEditorPopupBrick>>onOpened [
	super onOpened.

	self textEditBrick
		takeKeyboardFocus;
		selectAll
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMEditorPopupBrick>>textEditBrick [
	^ textEditBrick
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMEditorPopupBrick>>textEditBrick: aBrick [
	textEditBrick := aBrick.
	
	self contentBrick addBrickBack: self textEditBrick.
	self textEditBrick rubric announcer when: RubTextAcceptRequest send: #acceptContents: to: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMEditorPopupBrick>>textModel [
	^ textModel ifNil: [ textModel := '' ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMEditorPopupBrick>>textModel: aTextModel [
	textModel := aTextModel.
	
	self textEditBrick ifNotNil: [ :aTextEditBrick | aTextEditBrick text: self textModel ]
]
