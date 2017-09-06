"
I keep some examples on how to use a PluggableToggleButtonMorph
"
Class {
	#name : #PluggableToggleButtonMorphExample,
	#superclass : #PluggableButtonMorphExample,
	#category : #Morphic-Examples-Widgets,
	#timestamp : '<historical>'
}

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableToggleButtonMorphExample class>>exampleToggleButton [
	<example>
	^ self new buildToggleButton openInWindow
	
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableToggleButtonMorphExample class>>exampleToggleButtonNoLabel [
	<example>
	^ self new buildToggleButtonNoLabel openInWindow
	
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableToggleButtonMorphExample class>>exampleToggleButtonWithIcon [
	<example>
	^ self new buildToggleButtonWithIcon openInWindow
	
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableToggleButtonMorphExample>>buildToggleButton [
	^ PluggableToggleButtonMorph
		on: self 
		getState: nil
		action:  #toggleAction:
		label: #label 
		menu: nil. 	
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableToggleButtonMorphExample>>buildToggleButtonNoLabel [
	^ PluggableToggleButtonMorph
		on: self 
		getState: nil
		action:  #toggleAction:
		label: nil 
		icon: #icon
		menu: nil. 	
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableToggleButtonMorphExample>>buildToggleButtonWithIcon [
	^ PluggableToggleButtonMorph
		on: self 
		getState: nil
		action:  #toggleAction:
		label: #label 
		icon: #icon
		menu: nil. 	
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:14'
}
PluggableToggleButtonMorphExample>>toggleAction: aBoolean [
	self inform: (aBoolean
		ifTrue: [ 'Button pressed' ]
		ifFalse: [ 'Button unpressed' ])
]
