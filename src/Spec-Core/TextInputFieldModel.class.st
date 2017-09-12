"
I handle one line of text.
See TextModel

self example

You can also have a look at DynamicalPopup for another example.

I handle non source code text, that's why editing shortcuts are not supported (cmd+p just print a p by example).

I provide the following variables and their accessors
- acceptOnCR is a boolean representing if the key cr trigger an accept action,  it is true by default and must be set before built the widget. (if false it will print a cr).
- encrypted is a boolean representing if the text appear like stars (it is only an appearance), beDecrypted and beEncrypted are shortcut to set it.
- entryCompletion is the object used to suggest text while typing, removeEntryCompletion is a shortcut to set it nil.
- ghostText is the ghost text to display in the text zone.

I provide getters of ValueHolder of my super class actionToPerformHolder and textHolder .


todo
- specializing accept:
- specializing eventKeyStrokesForNextFocus , eventKeyStrokesForPreviousFocus
- globalsEntryCompletion
- specializing isCodeCompletionAllowed

"
Class {
	#name : #TextInputFieldModel,
	#superclass : #TextModel,
	#instVars : [
		'ghostText',
		'acceptOnCR',
		'entryCompletion',
		'isEncrypted'
	],
	#category : #Spec-Core-Widgets
}

{ #category : #specs }
TextInputFieldModel class >> adapterName [

	^ #TextInputFieldAdapter
]

{ #category : #specs }
TextInputFieldModel class >> defaultSpec [
	<spec: #default>
	
	^ #(TextInputFieldAdapter
		adapt: #(model))
]

{ #category : #example }
TextInputFieldModel class >> example [
	^ self new
	 extent: 300 @ 25;
	 openWithSpec;
	 ghostText: 'This is a ghost';
	 text: 'This is a text'
]

{ #category : #morphic }
TextInputFieldModel >> accept: aText [

	textHolder value: aText.
	actionToPerformHolder value cull: aText.
	
	"Dummy changed to raise an announcement"
	actionPerformedHolder value: aText.
	self changed: #clearUserEdits.
]

{ #category : #api }
TextInputFieldModel >> acceptOnCR [
	"<api: #inspect>"
	"Return true if the text is accepted when the Enter key is stroked"

	^ acceptOnCR value
]

{ #category : #api }
TextInputFieldModel >> acceptOnCR: aBoolean [
	"<api: #boolean getter: #acceptOnCR registration: #whenAcceptOnCRChanged:>"
	"Set if the text is accepted when the Enter key is stroked or not"

	acceptOnCR value: aBoolean
]

{ #category : #accessing }
TextInputFieldModel >> actionToPerformHolder [

	^ actionToPerformHolder
]

{ #category : #api }
TextInputFieldModel >> beDecrypted [
	"<api: #do>"
	"Decrypt the entered text"
	
	self encrypted: false
]

{ #category : #api }
TextInputFieldModel >> beEncrypted [
"	<api: #do>"
	"Encrypt the entered text"
	
	self encrypted: true
]

{ #category : #api }
TextInputFieldModel >> enableGlobalsCompletion [
	self entryCompletion: self globalsEntryCompletion
]

{ #category : #accessing }
TextInputFieldModel >> encrypted [

	^ isEncrypted value
]

{ #category : #accessing }
TextInputFieldModel >> encrypted: aBoolean [

	isEncrypted value: aBoolean 
]

{ #category : #api }
TextInputFieldModel >> entryCompletion [
	"<api: #st getter: #entryCompletion registration: #whenEntryCompletionChanged:>"
	"Return an entry completion used to suggest text while typing"

	^ entryCompletion value
]

{ #category : #api }
TextInputFieldModel >> entryCompletion: anEntryCompletion [
	"<api: #st getter: #entryCompletion registration: #whenEntryCompletionChanged:>"
	"Set an entry completion used to suggest text while typing"

	entryCompletion value: anEntryCompletion.
]

{ #category : #focus }
TextInputFieldModel >> eventKeyStrokesForNextFocus [
	"String describing the keystroke to perform to jump to the next widget"	
		
	^ { Character tab asKeyCombination }
]

{ #category : #focus }
TextInputFieldModel >> eventKeyStrokesForPreviousFocus [
	"String describing the keystroke to perform to jump to the previous widget"
	
	^ { Character tab shift asKeyCombination }
]

{ #category : #api }
TextInputFieldModel >> ghostText [
	"<api: #inspect>"
	"Return the ghost text of the text zone"

	^ ghostText value
]

{ #category : #api }
TextInputFieldModel >> ghostText: aText [
	"<api: #string getter: #ghostText registration: #whenGhostTextChanged:>"
	"Set the ghost text of the text zone"

	ghostText value: aText translated.
]

{ #category : #private }
TextInputFieldModel >> globalsEntryCompletion [

	| applicants |
	applicants := (Array
				streamContents: [:strm | Symbol
						allSymbolTablesDo: [:each | (each notEmpty
									and: [each first canBeGlobalVarInitial
											and: [Smalltalk globals includesKey: each]])
								ifTrue: [strm nextPut: each]]]) sort.

	^ EntryCompletion new
				dataSourceBlock: [:currText | applicants];
				filterBlock: [:currApplicant :currText | currText size > 3
						and: [currApplicant asUppercase includesSubstring: currText asString asUppercase]].
]

{ #category : #initialization }
TextInputFieldModel >> initialize [

	super initialize.
	
	ghostText := '' asValueHolder.
	acceptOnCR := true asValueHolder.
	entryCompletion := nil asValueHolder.
	isEncrypted := false asValueHolder.
	
	ghostText  whenChangedDo: [ :txt | self changed: #ghostText: with: { txt } ].
	acceptOnCR whenChangedDo: [ :bool | self changed: #acceptOnCR: with: { bool } ].
	isEncrypted whenChangedDo: [ :bool | self changed: #encrypted: with: { bool } ].
]

{ #category : #NOCompletion }
TextInputFieldModel >> isCodeCompletionAllowed [
	
	^ false
]

{ #category : #api }
TextInputFieldModel >> removeEntryCompletion [
	"< api:#do>"
	"Remove the entry completion"
	
	self entryCompletion: nil
]

{ #category : #accessing }
TextInputFieldModel >> textHolder [

	^ textHolder
]

{ #category : #api-events }
TextInputFieldModel >> whenAcceptOnCRChanged: aBlock [
	"aBlock will be performed when acceptOnCR changed"
	
	acceptOnCR whenChangedDo: aBlock
]

{ #category : #api-events }
TextInputFieldModel >> whenEntryCompletionChanged: aBlock [
	"aBlock will be performed when entryCompletion changed"
	
	entryCompletion whenChangedDo: aBlock
]

{ #category : #api-events }
TextInputFieldModel >> whenGhostTextChanged: aBlock [
	"aBlock will be performed when ghostText changed"
	
	ghostText whenChangedDo: aBlock
]
