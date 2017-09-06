"
A SpecTableLayoutSend is a spec layout action used when a selector is sent to the layout. It differs from SpecLayoutSend by being independent from specific layout.

"
Class {
	#name : #SpecTableLayoutSend,
	#superclass : #AbstractSpecLayoutAction,
	#category : #Spec-Layout,
	#timestamp : 'webwarrior 6/9/2014 19:37'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTableLayoutSend class>>selector: selector arguments: arguments [

	^ self new
		arguments: arguments;
		selector: selector;
		yourself
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecTableLayoutSend>>asSpecElements [

	^ {self selector.}, self arguments
]
