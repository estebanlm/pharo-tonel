"
Default superclass for application about dialogs.
"
Class {
	#name : #AboutDialogWindow,
	#superclass : #LongMessageDialogWindow,
	#category : #Polymorph-Widgets-Windows,
	#timestamp : 'gvc 5/18/2007 13:53'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:15'
}
AboutDialogWindow class>>open  [
	<script>
	
	^(self new) 
		open;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:15'
}
AboutDialogWindow class>>openForPharo [
	<script>
	| text dialog width |
	text := Smalltalk systemInformationString withCRs.
	width := 0.
	text
		linesDo: [ :l | 
			width := width
				max: (Smalltalk ui theme textFont widthOfStringOrText: l) ].
	dialog := self new entryText: text.
	dialog iconMorph image: (self iconNamed: #pharoIcon).
	dialog title: 'About Pharo'.
	dialog open.
	dialog textMorph
		minWidth: 20;
		minHeight: 20.
	dialog width: (width + 120 min: Display width - 50).
	dialog position: 25 @ 25
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:15'
}
AboutDialogWindow>>defaultLabel [
	"Answer the default label for the receiver."

	^'About' translated
]
