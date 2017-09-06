"
Any message sent to me is returned as a Message object.

""Message catcher"" creates an instance of me.

"
Class {
	#name : #MessageCatcher,
	#superclass : #ProtoObject,
	#instVars : [
		'accumulator'
	],
	#category : #Kernel-Methods,
	#timestamp : '<historical>'
}

{
	#category : #'reflective operations',
	#timestamp : ' 8/31/2017 07:16:33'
}
MessageCatcher>>doesNotUnderstand: aMessage [

	accumulator ifNotNil: [accumulator add: aMessage].
	^ aMessage
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:33'
}
MessageCatcher>>privAccumulator [

	^ accumulator
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:33'
}
MessageCatcher>>privAccumulator: collection [

	accumulator := collection
]
