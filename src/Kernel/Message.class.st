"
I represent a selector and its argument values.
	
Generally, the system does not use instances of Message for efficiency reasons. However, when a message is not understood by its receiver, the interpreter will make up an instance of me in order to capture the information involved in an actual message transmission. This instance is sent it as an argument with the message doesNotUnderstand: to the receiver.
"
Class {
	#name : #Message,
	#superclass : #Object,
	#instVars : [
		'selector',
		'args',
		'lookupClass'
	],
	#category : #Kernel-Methods,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:33'
}
Message class>>selector: aSymbol [
	"Answer an instance of me with unary selector, aSymbol."

	^self new setSelector: aSymbol arguments: (Array new: 0)
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:33'
}
Message class>>selector: aSymbol argument: anObject [
	"Answer an instance of me whose selector is aSymbol and single 
	argument is anObject."

	^self new setSelector: aSymbol arguments: { anObject }
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:33'
}
Message class>>selector: aSymbol arguments: anArray [
	"Answer an instance of me with selector, aSymbol, and arguments, 
	anArray."

	^self new setSelector: aSymbol arguments: anArray
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Message>>analogousCodeTo: anObject [
	"For MethodPropertires comparison."
	^self class == anObject class
	  and: [selector == anObject selector
	  and: [args = anObject arguments
	  and: [lookupClass == anObject lookupClass]]]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Message>>argument [
	"Answer the first (presumably sole) argument"

	^args at: 1
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Message>>argument: newValue [
	"Change the first argument to newValue and answer self"

	args at: 1 put: newValue
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Message>>arguments [
	"Answer the arguments of the receiver."

	^args
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:33'
}
Message>>asSendTo: anObject [
	^MessageSend message: self to: anObject
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Message>>hasArguments [
	^args notEmpty
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Message>>lookupClass [

	^ lookupClass
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:33'
}
Message>>lookupClass: aClass [

	lookupClass := aClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Message>>numArgs [
	"Answer the number of arguments in this message"

	^args size
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Message>>printOn: stream [

	args isEmpty ifTrue: [^ stream nextPutAll: selector].
	args with: selector keywords do: [:arg :word |
		stream nextPutAll: word.
		stream space.
		arg printOn: stream.
		stream space.
	].
	stream skip: -1.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Message>>selector [
	"Answer the selector of the receiver."

	^selector
]

{
	#category : #sending,
	#timestamp : ' 8/31/2017 07:16:33'
}
Message>>sendTo: receiver [
	"answer the result of sending this message to receiver"

	^ receiver perform: selector withArguments: args
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Message>>sends: aSelector [
	"answer whether this message's selector is aSelector"

	^selector == aSelector
]

{
	#category : #sending,
	#timestamp : ' 8/31/2017 07:16:33'
}
Message>>sentTo: receiver [
	"answer the result of sending this message to receiver"

	^ lookupClass
		ifNil: [ receiver perform: selector withArguments: args]
		ifNotNil: [ receiver perform: selector withArguments: args inSuperclass: lookupClass]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:33'
}
Message>>setSelector: aSymbol [

	selector := aSymbol.

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:33'
}
Message>>setSelector: aSymbol arguments: anArray [

	selector := aSymbol.
	args := anArray
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:33'
}
Message>>storeOn: aStream [
	"Refer to the comment in Object|storeOn:."

	aStream nextPut: $(;
	 nextPutAll: self class name;
	 nextPutAll: ' selector: ';
	 store: selector;
	 nextPutAll: ' arguments: ';
	 store: args;
	 nextPut: $)
]
