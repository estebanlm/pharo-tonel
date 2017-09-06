"
A LessonView displays a Lesson instance.

LessonView new open
"
Class {
	#name : #LessonView,
	#superclass : #Object,
	#instVars : [
		'shoutMorph',
		'window',
		'sourceTextModel'
	],
	#category : #ProfStef-Core,
	#timestamp : 'StephaneDucasse 7/10/2015 14:55'
}

{
	#category : #gui,
	#timestamp : ' 8/31/2017 05:26:23'
}
LessonView class>>menuOn: aBuilder [
	<LessonViewContextMenu>
	
	(aBuilder item: #'Do it' translated)
		keyText: 'd';
		selector: #doIt;
		help: nil;
		iconName: #smallDoIt.
	(aBuilder item: #'Print it' translated)
		keyText: 'p';
		selector: #printIt;
		help: nil;
		iconName: #smallPrintIt.
	(aBuilder item: #'Inspect it' translated)
		keyText: 'i';
		selector: #inspectIt;
		help: nil;
		iconName: #smallInspectIt.

]

{
	#category : #gui,
	#timestamp : ' 8/31/2017 05:26:23'
}
LessonView>>buildText [
	| scrolledText |
	scrolledText := self sourceTextModel newScrolledText
		beForSmalltalkScripting;
		beWrapped;
		yourself.
	scrolledText textArea font: StandardFonts codeFont.
	^ scrolledText
]

{
	#category : #gui,
	#timestamp : ' 8/31/2017 05:26:23'
}
LessonView>>buildWindow [
	^ SystemWindow labelled: 'PrStef lesson'.
	
]

{
	#category : #gui,
	#timestamp : ' 8/31/2017 05:26:23'
}
LessonView>>close [
	window delete.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
LessonView>>doItContext [
	^ nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
LessonView>>doItReceiver [
	^ nil
]

{
	#category : #hack,
	#timestamp : ' 8/31/2017 05:26:23'
}
LessonView>>hasBindingThatBeginsWith: aString [
	"this method should not be defined here, normally when the interaction model of the RubScrolledTextModel is set to nil the hasBindingThatBeginsWith: message is not sent. Check method RubScrolledTextModel hasBindingThatBeginsWith:. Now if we remove this method, we get an error with RubScrolledTextModel  which has a LessonView as interaction model. I have no idea where it is set."

	^ false
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:23'
}
LessonView>>initialize [

	super initialize.
	window := self buildWindow.
	shoutMorph := self buildText.
	window addMorph: shoutMorph frame: (0 @ 0 corner: 1 @ 1).
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:23'
}
LessonView>>isOpenInWindow [
	^ World systemWindows includes: window
]

{
	#category : #gui,
	#timestamp : ' 8/31/2017 05:26:23'
}
LessonView>>menu [
	^ (PragmaMenuBuilder pragmaKeyword: #LessonViewContextMenu model: self) menu.

]

{
	#category : #gui,
	#timestamp : ' 8/31/2017 05:26:23'
}
LessonView>>open [
	"menu: #shoutMorphFillMenu:."
	window openInWorld
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
LessonView>>selectedClassOrMetaClass [
	^ nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
LessonView>>shoutAboutToStyle: aPluggableShoutMorphOrView [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
LessonView>>shoutMorph [
	^ shoutMorph
]

{
	#category : #gui,
	#timestamp : ' 8/31/2017 05:26:23'
}
LessonView>>shoutMorphFillMenu: aMenu [
	^ aMenu addAllFrom: self menu
]

{
	#category : #gui,
	#timestamp : ' 8/31/2017 05:26:23'
}
LessonView>>showLesson: aLesson withTitle: aString [
	self window setLabel: aString.
	self sourceTextModel setText: aLesson lesson.
	self isOpenInWindow ifFalse: [ self open ]
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
LessonView>>sourceTextModel [
	^ sourceTextModel ifNil: [ sourceTextModel := RubScrolledTextModel new interactionModel: self ].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
LessonView>>text [
	^ self sourceTextModel getText asString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
LessonView>>window  [
	^ window
]
