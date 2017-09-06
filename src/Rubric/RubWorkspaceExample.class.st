"
self open
"
Class {
	#name : #RubWorkspaceExample,
	#superclass : #Object,
	#instVars : [
		'textModel',
		'announcer',
		'bindings',
		'mustDeclareVariables'
	],
	#category : #Rubric-Editing-Widgets-Examples,
	#timestamp : '<historical>'
}

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubWorkspaceExample class>>exampleWindowWithScrolledText [

	^self open
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubWorkspaceExample class>>exampleWithCustomShortcut [

	 |  window text |
    text := RubScrolledTextMorph new.

    "define a custom shortcut  - notice  the call to textArea"

    text textArea removeKeyCombination: $s meta.
	 text setText: 'Hit cmd $s to revert the text'.
    text textArea on: $s meta do:[
        text setText: text text asString reverse].

    window := StandardWindow new.
    window addMorph: text fullFrame: (0@0 corner: 1@1) asLayoutFrame.
    window title: 'Custom shortcuts example'.
    window openInWorld.
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubWorkspaceExample class>>open [
	<script>
	(self windowWithScrolledText: (self new newScrolledText)) openInWorld

]

{
	#category : #'private - accessing',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubWorkspaceExample class>>spyAnnouncer [
	"Set it to true if you want to observe textsurface announcements"
	^ false
]

{
	#category : #'private - accessing',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubWorkspaceExample class>>title [
	^ 'Rubric workspace example'
]

{
	#category : #'private - utilities',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubWorkspaceExample class>>windowWithScrolledText: aScrolledText  [
	| w |
	w := StandardWindow new.
	w title: self title.
	self spyAnnouncer ifTrue: [aScrolledText textArea announcer open].
	w addMorph: aScrolledText fullFrame: (0@0 corner: 1@1) asLayoutFrame.
	^w
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubWorkspaceExample>>acceptString: aString [
	textModel setText: aString asText.
	 ^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubWorkspaceExample>>announcer [
	^ announcer ifNil: [ announcer := Announcer new ]
]

{
	#category : #shout,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubWorkspaceExample>>bindingOf: aString  [
	
	mustDeclareVariables ifTrue: [^ nil].
	"I want to have workspace that force the user to declare  
	variables. Still subclasses may want to do something else"
	bindings isNil
		ifTrue: [self initializeBindings].
	(bindings includesKey: aString)
		ifFalse: [bindings at: aString put: nil].
	^ bindings associationAt: aString
]

{
	#category : #'code pane menu',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubWorkspaceExample>>codePaneMenu: aMenu shifted: shifted  [
	"Note that unless we override perform:orSendTo:, 
	PluggableTextController will respond to all menu items in a 
	text pane"
	"Not tested"
]

{
	#category : #'user interface',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubWorkspaceExample>>getText [
	^ textModel getText
]

{
	#category : #shout,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubWorkspaceExample>>guessTypeForName: aString [
	| binding |
	
	bindings isNil ifFalse: [ 
		binding := bindings 
			at: aString
			ifAbsent: [ nil ].
		binding isNil
			ifFalse: [ ^ binding class ] ].

	^ nil
]

{
	#category : #shout,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubWorkspaceExample>>hasBindingOf: aString [
	^(self guessTypeForName: aString) notNil
]

{
	#category : #shout,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubWorkspaceExample>>hasBindingThatBeginsWith: aString [
	^false
]

{
	#category : #shout,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubWorkspaceExample>>initialize [
	super initialize.
	textModel := RubScrolledTextModel new
		interactionModel: self;
		yourself.
	mustDeclareVariables := false
]

{
	#category : #completion,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubWorkspaceExample>>isCodeCompletionAllowed [

	^ true.
]

{
	#category : #'user interface',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubWorkspaceExample>>newScrolledText [
	| st |
	st := textModel newScrolledText 
		beWrapped;
		autoAccept: true;
		withLineNumbers;
		withGhostText: 'Workspace: a place where you can code and test scripts';
		withAnnotation;
		yourself.
	st ghostTextRuler fontName: 'Bitmap DejaVu Sans' pointSize: 18; textColor: Color gray lighter; centered.
	^st
]

{
	#category : #'user interface',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubWorkspaceExample>>setText: aText from: aView  [
	^ self acceptString: aText string
]

{
	#category : #shout,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubWorkspaceExample>>shoutAboutToStyle: ATextView [
	^ true
]
