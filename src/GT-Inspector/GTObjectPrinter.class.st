"
This is a utility class for printing objects to Text or String.
"
Class {
	#name : #GTObjectPrinter,
	#superclass : #Object,
	#category : #GT-Inspector,
	#timestamp : 'TudorGirba 1/18/2014 14:29'
}

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTObjectPrinter class>>asNonTruncatedTextFrom: anObject [
	"I return a representation of the receiver in which all lines breaks 
	are replaced by spaces. I return a String unless there is an error 
	printing the object. In this case I return a Text highlighted in red."
	^ [ anObject asString replaceAll: String cr with: String space ] 
			on: Error 
			do: [ Text string: 'error printing' attribute: TextColor red ]
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTObjectPrinter class>>asTruncatedTextFrom: anObject [
	"I return a truncated representation of the receiver in which all lines breaks 
	are replaced by spaces. I return a String unless there is an error printing the
	object. In this case I return a Text highlighted in red."
	^ [ (anObject gtDisplayString copyReplaceAll: String cr with: String space) replaceAll: String lf with: String space ]
		on: Error
		do: [ Text string: 'error printing' attribute: TextColor red ]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTObjectPrinter>>asNonTruncatedTextFrom: anObject [
	^ self class asNonTruncatedTextFrom: anObject
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTObjectPrinter>>asTruncatedTextFrom: anObject [
	^ self class asTruncatedTextFrom: anObject
]
