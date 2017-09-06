"
A SpecLayoutAdd represents the action to add a subwidget into a spec layout
"
Class {
	#name : #SpecLayoutAdd,
	#superclass : #SpecLayoutSend,
	#instVars : [
		'layoutFrame',
		'subwidget'
	],
	#category : #Spec-Layout,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayoutAdd class>>subwidget: subwidget layoutFrame: aLayoutFrame [

	^ self new
		subwidget: subwidget 
		layoutFrame: aLayoutFrame asLayoutFrame; 
		yourself
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayoutAdd>>bottomFraction [

	^ layoutFrame bottomFraction
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayoutAdd>>bottomFraction: aNumber [

	layoutFrame bottomFraction: aNumber 
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayoutAdd>>bottomOffset [

	^ layoutFrame bottomOffset 
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayoutAdd>>bottomOffset: aNumber [

	layoutFrame bottomOffset: aNumber
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayoutAdd>>fractions [
	^ layoutFrame fractionRectangle
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayoutAdd>>generateArguments [
	
	self arguments: {{subwidget .#layout:. layoutFrame generateSpec}}.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayoutAdd>>initialize [

	super initialize.
	self selector: #add:.
	layoutFrame := LayoutFrame identity.
	subwidget := nil.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayoutAdd>>layoutFrame [

	^ layoutFrame
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayoutAdd>>layoutFrame: newFrame [

	layoutFrame := newFrame asLayoutFrame
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayoutAdd>>leftFraction [

	^ layoutFrame leftFraction 
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayoutAdd>>leftFraction: aNumber [

	layoutFrame leftFraction: aNumber

]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayoutAdd>>leftOffset [

	^ layoutFrame leftOffset
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayoutAdd>>leftOffset: aNumber [

	^ layoutFrame leftOffset: aNumber
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayoutAdd>>offsets [
	"to deprecate 
	"
	self flag: #fix.
	^ layoutFrame leftOffset  @ layoutFrame topOffset corner:  layoutFrame rightOffset  @ layoutFrame bottomOffset 
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayoutAdd>>rightFraction [

	^ layoutFrame rightFraction
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayoutAdd>>rightFraction: aNumber [

	^ layoutFrame rightFraction: aNumber
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayoutAdd>>rightOffset [

	^ layoutFrame rightOffset
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayoutAdd>>rightOffset: aNumber [

	layoutFrame rightOffset: aNumber
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayoutAdd>>subwidget [
	^ subwidget
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayoutAdd>>subwidget: anObject [
	subwidget := anObject
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayoutAdd>>subwidget: aSpec fractions: frac offsets: off [

	subwidget := aSpec isSymbol
				ifTrue: [{#model. aSpec}]
				ifFalse: [
					aSpec isCollection
						ifTrue: [
							aSpec isEmpty 
								ifTrue: [ "should raise an error" ]
								ifFalse: [ aSpec first == #model 
											ifTrue: [ aSpec ]
											ifFalse: [ {#model}, aSpec ]]]
						ifFalse: [ 
							"Not a symbol or a collection. We assume it's an object to add directly (like a morph by example)"
							aSpec ]].
	self fractions: frac.
	self offsets: off.
	
	self generateArguments
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayoutAdd>>subwidget: aSpec layoutFrame: aLayoutFrame [
	
	subwidget := aSpec isSymbol
				ifTrue: [{#model. aSpec}]
				ifFalse: [
					aSpec isCollection
						ifTrue: [
							aSpec isEmpty 
								ifTrue: [ "should raise an error" ]
								ifFalse: [ aSpec first == #model 
											ifTrue: [ aSpec ]
											ifFalse: [ {#model}, aSpec ]]]
						ifFalse: [ 
							"Not a symbol or a collection. We assume it's an object to add directly (like a morph by example)"
							aSpec ]].
	
	layoutFrame := aLayoutFrame.
	self generateArguments
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayoutAdd>>topFraction [

	^ layoutFrame topFraction
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayoutAdd>>topFraction: aNumber [

	layoutFrame topFraction: aNumber
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayoutAdd>>topOffset [

	^ layoutFrame topOffset
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecLayoutAdd>>topOffset: aNumber [

	layoutFrame topOffset: aNumber
]
