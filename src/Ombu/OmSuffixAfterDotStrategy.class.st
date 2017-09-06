"
I generate a name by attaching a suffix after last dot in the name received as argument. 

My subclasses implement the concrete ways to do it.
"
Class {
	#name : #OmSuffixAfterDotStrategy,
	#superclass : #OmSessionStoreNamingStrategy,
	#category : #Ombu-Strategies,
	#timestamp : 'MartinDias 1/21/2017 16:06'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmSuffixAfterDotStrategy>>nextSuffix [

	^ self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmSuffixAfterDotStrategy>>nextTo: aName in: aDirectory [
	
	^ String streamContents: [ :stream |
		stream
			nextPutAll: (aName copyUpToLast: $.);
			nextPut: $.;
			nextPutAll: self nextSuffix ]
]
