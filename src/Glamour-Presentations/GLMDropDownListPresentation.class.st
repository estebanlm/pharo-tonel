"
A GLMDropDownListPresentation is takes a list of objects and displays them in a drop down view.

For an example see GLMBasicExamples>>#dropDownList
"
Class {
	#name : #GLMDropDownListPresentation,
	#superclass : #GLMFormatedPresentation,
	#instVars : [
		'selectedIndex'
	],
	#category : #Glamour-Presentations,
	#timestamp : 'AndreiChis 10/3/2014 18:23'
}

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMDropDownListPresentation>>defaultValidate: anObject on: aPort [
	"we only allow objects that are in the display value"

	(aPort name == #selection) ifFalse: [ ^ true ].
	self entity isNil ifTrue: [ ^ false ].
	^ self displayValue includes: anObject 
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMDropDownListPresentation>>renderGlamorouslyOn: aRenderer  [
	self registerAnnouncements.
	^ aRenderer renderDropDownListPresentation: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMDropDownListPresentation>>selectedIndex [
	^ selectedIndex ifNil:[ selectedIndex := 0 ] 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMDropDownListPresentation>>selectedIndex: index [
	
	selectedIndex:= index
]
