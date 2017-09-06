"
I am a UI used to retrieve a Slice title using its issue number
"
Class {
	#name : #KomitSliceUI,
	#superclass : #ComposableModel,
	#instVars : [
		'fork',
		'issueNumber',
		'loadingWidget',
		'titleWidget',
		'valid'
	],
	#category : #Komitter-UI,
	#timestamp : '<historical>'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitSliceUI class>>defaultSpec [
	<spec: #default>
	
	^ SpecLayout composed
		newColumn: [ :col |
			col
				newRow: [ :row |
					row
						add: #issueNumber width: 90;
						add: #titleWidget ] height: self inputTextHeight;
				newRow: [ :row | ] ];
		yourself
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitSliceUI>>encodeTitle: aTitle [
	| allowedCharacters |
	
	allowedCharacters := ($A to: $Z)
				, ($a to: $z)
				, ($0 to: $9)
				, (Array with: $-).
	^ String streamContents: [ :stream | 			
		aTitle
			do: [ :character | (' 	_' includes: character)
				ifTrue: [ stream << '-' ]
				ifFalse: [ (allowedCharacters includes: character)
						ifTrue: [ stream << character ] ] ] ]
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitSliceUI>>initialExtent [

	^ 600@100
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitSliceUI>>initialize [

	super initialize.

	valid := false asValueHolder
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitSliceUI>>initializeDialogWindow: aWindow [

	valid whenChangedDo: [ :b | aWindow toolbar okButton enabled: b ].
	aWindow toolbar okButton enabled: false.
	issueNumber 
		bindKeyCombination: Character cr control unix | $m control mac
		toAction: [ self valid ifTrue: [ aWindow triggerOkAction ] ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitSliceUI>>initializeWidgets [

	issueNumber := self newTextInput.
	titleWidget := self newTextInput.

	titleWidget
		enabled: false;
		ghostText: 'Title'.
		
	issueNumber ghostText: 'Issue number'.

	issueNumber 
		autoAccept: true;
		acceptBlock: [ :text |
			fork ifNotNil: [ fork terminate ].
			loadingWidget loading.
			self valid: false.
			fork := [ | response |
				response := ZnEasy client
				url: 'http://tracker.pharo.org/issues/name/', text asString;
				get;
				response.
				self setTitleFrom: response ] fork ].
	self focusOrder
		add: issueNumber
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitSliceUI>>issueNumber [
	^ issueNumber
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitSliceUI>>issueNumberText [

	^ issueNumber text
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitSliceUI>>loadingWidget [
	^ loadingWidget
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitSliceUI>>setTitleFrom: aZnResponse [

	(aZnResponse isError or: [ aZnResponse entity isNil ])
		ifTrue: [ 
			titleWidget text: 'Error !'.
			loadingWidget error ]
		ifFalse: [ 
			titleWidget text: (self encodeTitle: aZnResponse entity string).
			self valid: true.
			loadingWidget ok ]
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitSliceUI>>title [

	^ 'Retrieve Slice title'
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitSliceUI>>titleText [

	^ titleWidget text
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitSliceUI>>titleWidget [
	^ titleWidget
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitSliceUI>>valid [

	^ valid value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitSliceUI>>valid: aBoolean [

	valid value: aBoolean
]
