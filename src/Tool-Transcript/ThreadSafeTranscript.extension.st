Extension { #name : #ThreadSafeTranscript }

{ #category : #'*Tool-Transcript' }
ThreadSafeTranscript >> interactionModel [
	^ self
]

{ #category : #'*Tool-Transcript' }
ThreadSafeTranscript class >> menuCommandOn: aBuilder [
	<worldMenu>
	(aBuilder item: #'Transcript')
		action: [ Smalltalk tools transcript open ];
		order: 0.30;
		parent: #Tools;
		help: 'Transcript';
		keyText: 'o, t';
		icon: self taskbarIcon.
	aBuilder withSeparatorAfter
]

{ #category : #'*Tool-Transcript' }
ThreadSafeTranscript class >> open [ 
	"self open"
	
	^ self new open 
]

{ #category : #'*Tool-Transcript' }
ThreadSafeTranscript >> open [
	"self new open"
	^ self openLabel: self title

]

{ #category : #'*Tool-Transcript' }
ThreadSafeTranscript >> openLabel: aString [
	| window m |
	window := (SystemWindow labelled: aString) model: self.
	m := RubPluggableTextMorph new
		getTextSelector: #contents;
		setTextSelector: #clear;
		on: self;
		beForSmalltalkScripting.
	window addMorph: m frame: (0 @ 0 corner: 1 @ 1).
	^ window openInWorld
]
