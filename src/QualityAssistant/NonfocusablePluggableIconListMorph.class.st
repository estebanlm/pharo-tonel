"
Same as PluggableIconListMorph list but does not accept focus 
"
Class {
	#name : #NonfocusablePluggableIconListMorph,
	#superclass : #PluggableIconListMorph,
	#category : #QualityAssistant,
	#timestamp : 'YuriyTymchuk 5/6/2015 17:44'
}

{
	#category : #display,
	#timestamp : ' 8/31/2017 05:26:37'
}
NonfocusablePluggableIconListMorph>>itemMorphFor: anObject index: anIndex [
	
	^ (super itemMorphFor: anObject index: anIndex)
		hResizing: #spaceFill;
		yourself
]

{
	#category : #'event handling',
	#timestamp : ' 8/31/2017 05:26:37'
}
NonfocusablePluggableIconListMorph>>takesKeyboardFocus [
	^ false 
]
