"
A DateModel is a widget for choosing dates. It consists of:
- A text box, into which you can type any string which can be converted into a Smalltalk date
- A button, which displays a calendar, from which you can select a date

Usage:
- the simplest way is to add a DateModel in your UI, and send #date when you want its value.
- or, register to be notified when the date changes:
	DateModel new
		date: self date;
		whenDateChanged: [ :newDate | self date: newDate ].

As it is Spec-based, it can be easily adapted and composed into a larger UI.
"
Class {
	#name : #DateModel,
	#superclass : #ComposableModel,
	#instVars : [
		'dateLabel',
		'displayBlockHolder',
		'chooseDateButton',
		'dateModel'
	],
	#category : #Spec-PolyWidgets-Widgets
}

{ #category : #example }
DateModel class >> example [
	^ self new openDialogWithSpec
]

{ #category : #example }
DateModel class >> exampleModal [
	^ self new openDialogWithSpec modalRelativeTo: self currentWorld
]

{ #category : #accessing }
DateModel class >> spec [
	<spec: #default>

	^ SpecLayout composed
			newRow: [ :row | 
				row 
					add: #dateLabel width: 60; 
					"This is to address a not yet fixed Spec issue"
					newRow: [:ugly | 
						ugly
							add: #dateModel;  
							add: #chooseDateButton width: 50 ]] height: 25
			yourself.
]

{ #category : #private }
DateModel >> chooseDate [

	| calendar |
	calendar := CalendarMorph openOn: Date today.
	calendar
		center: calendar cursorPoint;
		fitInWorld;
		onChoiceSend: #onDateChosen: to: self.
]

{ #category : #accessing-widgets }
DateModel >> chooseDateButton [

	^ chooseDateButton.
]

{ #category : #accessing }
DateModel >> date [

	^ self dateModel getText asDate.
]

{ #category : #accessing }
DateModel >> date: aDate [

	^ self dateModel text: aDate asString.
]

{ #category : #accessing-widgets }
DateModel >> dateLabel [

	^ dateLabel.
]

{ #category : #accessing-widgets }
DateModel >> dateModel [

	^ dateModel.
]

{ #category : #api }
DateModel >> displayBlock [
	"<api: #inspect>"
	"Return the one argument block used to wrap your domain specific items.
	The block should return something that can be displayed in a list - like a String or a Text"
	
	^ displayBlockHolder value
]

{ #category : #api }
DateModel >> displayBlock: aBlock [
	"<api: #block getter:#displayBlock registration: #whenDisplayBlockChanged:>"
	"Set the one argument block used to transfrom your date into a string"
	
	displayBlockHolder value: aBlock
]

{ #category : #private }
DateModel >> iconMorph [

	^ ImageMorph new form: (self iconNamed: #calendarIcon)
]

{ #category : #initialization }
DateModel >> initialize [

	displayBlockHolder := [ :object | object asStringOrText ] asValueHolder.
	displayBlockHolder whenChangedDo: [ self date: self date ].
	super initialize. "do this last so default will be set after displayBlock"
]

{ #category : #initialization }
DateModel >> initializeWidgets [

	dateLabel := self newLabel.
	dateModel := self newTextInput.
	chooseDateButton := self newButton.
		
	dateLabel
		label: 'Date'.
		
	dateModel
		text: Date today asString;
		isCodeCompletionAllowed: false.
	
	chooseDateButton
		icon: self iconMorph;
		action: [ self chooseDate ];
		extent: self iconMorph extent.
]

{ #category : #private }
DateModel >> onDateChosen: aChoseDate [

	aChoseDate calendar delete.
	dateModel text: aChoseDate date asString.
]

{ #category : #api-events }
DateModel >> whenDateChanged: aBlock [

	dateModel whenTextChanged: [:newText :oldText :announcement :anAnnouncer || newDate oldDate |
		newDate := Date readFrom: newText readStream.
		oldDate := Date readFrom: oldText readStream.
		aBlock cull: newDate cull: oldDate cull: announcement cull: anAnnouncer ]
]
