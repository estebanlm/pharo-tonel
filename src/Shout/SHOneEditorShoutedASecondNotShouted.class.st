"
In this example, the view has two text editors. 
Try it with:

SHOneEditorShoutedASecondNotShouted  new open.

The top view is supposed to be used for code editing and the other for comment editing.
Only the code editor view has to be highligthed whereas the comment editor is never highligthed. In this case, the model must implement a #shoutAboutToStyle: method which returns true. When the view is built, the comment pane is setup to forbid code styling by sending #styled: to it with false as argument. See the #open method and the #styled: sent.

Instance Variables:
	code	<Text>
	comment	<Text>
"
Class {
	#name : #SHOneEditorShoutedASecondNotShouted,
	#superclass : #Model,
	#instVars : [
		'code',
		'comment'
	],
	#category : #Shout-Examples,
	#timestamp : 'AlainPlantec 9/20/2011 17:23'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:28'
}
SHOneEditorShoutedASecondNotShouted>>code [
	^ code ifNil: [code := '' asText]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:28'
}
SHOneEditorShoutedASecondNotShouted>>code: someText [
	code := someText.
	self changed: #code
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:28'
}
SHOneEditorShoutedASecondNotShouted>>comment [
	^ comment ifNil: [comment := '' asText]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:28'
}
SHOneEditorShoutedASecondNotShouted>>comment: someText [
	comment := someText.
	self changed: #comment
]

{
	#category : #view,
	#timestamp : ' 8/31/2017 05:26:28'
}
SHOneEditorShoutedASecondNotShouted>>open [
	| window codeEditor commentEditor |
	window := (StandardWindow labelled: 'A styled editor and a not styled one for the same model') model: self.
	codeEditor := window newTextEditorFor:  self getText:  #code setText: #code: getEnabled: nil. 
	commentEditor := window newTextEditorFor:  self getText:  #comment setText: #comment: getEnabled: nil. 
	"now, comment must not be highlighted: just send #styled: to the editor with false as argument"
	commentEditor styled: false.
	window addMorph: codeEditor frame: (0@0 extent: 1@0.5).
	window addMorph: commentEditor frame: (0@0.5 extent: 1@1).
	^ window openInWorld
]

{
	#category : #shout,
	#timestamp : ' 8/31/2017 05:26:28'
}
SHOneEditorShoutedASecondNotShouted>>shoutAboutToStyle: aTextView [
	^ true
]
