"
Morph with an inset border by default and theme access.
"
Class {
	#name : #ComposableMorph,
	#superclass : #MorphicModel,
	#traits : 'TEasilyThemed',
	#classTraits : 'TEasilyThemed classTrait',
	#category : #Polymorph-Widgets,
	#timestamp : 'gvc 5/18/2007 13:32'
}

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:15'
}
ComposableMorph>>defaultBorderColor [
	"Answer the default border color/fill style for the receiver"
	
	^#inset
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:15'
}
ComposableMorph>>defaultBorderWidth [
	"Answer the default border width for the receiver."
	
	^ 1
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
ComposableMorph>>defaultTitle [
	"Answer the default title label for the receiver."

	^'Composite' translated
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:15'
}
ComposableMorph>>newWindow [
	"Answer a new window with the receiver as model,
	except when the receiver is a morph."

	|w|
	w := StandardWindow new
		model: (self isMorph ifFalse: [self]);
		title: self defaultTitle;
		addMorph: self
		fullFrame: LayoutFrame identity;
		yourself.
	self borderWidth: 0.
	^w
]
