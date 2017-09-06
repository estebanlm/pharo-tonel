"
A TextFieldExample is a simple example of how to use TextFields.
"
Class {
	#name : #TextFieldExample,
	#superclass : #ComposableModel,
	#instVars : [
		'methodBrowser',
		'textField'
	],
	#category : #Spec-Examples,
	#timestamp : '<historical>'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:25'
}
TextFieldExample class>>defaultSpec [
	| textFieldHeight |
	
	textFieldHeight := StandardFonts defaultFont height + 15.
	^ SpecLayout composed
	 	add: #textField origin: 0@0 corner: 1@0 offsetOrigin: 0@0 offsetCorner: 0@textFieldHeight;
	 	add: #methodBrowser origin: 0@0 corner: 1@1 offsetOrigin: 0@textFieldHeight offsetCorner: 0@textFieldHeight;
		yourself 
]

{
	#category : #example,
	#timestamp : ' 8/31/2017 05:26:25'
}
TextFieldExample class>>example [
	^ self new openWithSpec
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:25'
}
TextFieldExample class>>title [

	^ 'Text Field Example'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:25'
}
TextFieldExample>>initializePresenter [
	
	textField acceptBlock: [:text | Smalltalk globals at: text asSymbol
								ifPresent: [:class | methodBrowser messages: class methods ]
								ifAbsent: [ methodBrowser messages: #() ]]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:25'
}
TextFieldExample>>initializeWidgets [

	methodBrowser := self instantiate: MessageBrowser.
	textField := self newTextInput.
	
	textField 
		ghostText: 'Enter a class name';
		autoAccept: true;
		removeEntryCompletion.
	methodBrowser 
		sortingBlock: [:a :b | a selector < b selector ];
		displayBlock: [:m | { m selector } ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
TextFieldExample>>methodBrowser [

	^ methodBrowser
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
TextFieldExample>>textField [

	^ textField
]
