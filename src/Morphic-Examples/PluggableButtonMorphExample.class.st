"
I keep some examples on how to use a PluggableButtonMorph
"
Class {
	#name : #PluggableButtonMorphExample,
	#superclass : #Model,
	#instVars : [
		'label',
		'state',
		'icon'
	],
	#category : #Morphic-Examples-Widgets,
	#timestamp : '<historical>'
}

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableButtonMorphExample class>>exampleButton [
	<example>
	self new buildButton openInWindow
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableButtonMorphExample class>>exampleButtonFont [
	<example>
	self new buildButton
		font: (LogicalFont familyName: 'Source Sans Pro' pointSize: 24);
	  openInWindow
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableButtonMorphExample class>>exampleButtonNoLabel [
	<example>
	self new buildButtonNoLabel openInWindow
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableButtonMorphExample class>>exampleButtonWithIcon [
	<example>
	self new buildButtonWithIcon openInWindow
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableButtonMorphExample class>>exampleButtonWithIconBottom [
	<example>
	self new buildButtonWithIconBottom openInWindow
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableButtonMorphExample class>>exampleButtonWithIconRight [
	<example>
	self new buildButtonWithIconRight openInWindow
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableButtonMorphExample class>>exampleButtonWithIconTop [
	<example>
	self new buildButtonWithIconTop openInWindow
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableButtonMorphExample>>action [
	self inform: 'Button pressed'
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableButtonMorphExample>>buildButton [
	^ PluggableButtonMorph
		on: self 
		getState: nil
		action:  #action 
		label: #label 
		menu: nil. 	
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableButtonMorphExample>>buildButtonNoLabel [
	^ PluggableButtonMorph
		on: self 
		getState: nil 
		action:  #action 
		label: nil 
		icon: #icon
		menu: nil. 	
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableButtonMorphExample>>buildButtonWithIcon [
	^ PluggableButtonMorph
		on: self 
		getState: nil 
		action:  #action 
		label: #label 
		icon: #icon
		menu: nil. 	
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableButtonMorphExample>>buildButtonWithIconBottom [
	^ (PluggableButtonMorph
		on: self 
		getState: nil 
		action:  #action 
		label: #label 
		icon: #icon
		menu: nil)
		beIconBottom. 	
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableButtonMorphExample>>buildButtonWithIconRight [
	^ (PluggableButtonMorph
		on: self 
		getState: nil 
		action:  #action 
		label: #label 
		icon: #icon
		menu: nil)
		beIconRight. 	
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableButtonMorphExample>>buildButtonWithIconTop [
	^ (PluggableButtonMorph
		on: self 
		getState: nil 
		action:  #action 
		label: #label 
		icon: #icon
		menu: nil)
		beIconTop. 	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableButtonMorphExample>>icon [
	^ icon
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableButtonMorphExample>>icon: anObject [
	icon := anObject
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableButtonMorphExample>>initialize [
	super initialize.
	label := 'Test label'.
	state := #on.
	icon := self iconNamed: #smallOkIcon
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableButtonMorphExample>>label [
	^ label
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableButtonMorphExample>>label: anObject [
	label := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableButtonMorphExample>>state [
	^ state
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableButtonMorphExample>>state: anObject [
	state := anObject
]
