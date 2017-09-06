"
My subclasses define a way to find a name for a new Ombu log.  Names should not collide with an existing file in the same directory.
"
Class {
	#name : #OmSessionStoreNamingStrategy,
	#superclass : #Object,
	#category : #Ombu-Strategies,
	#timestamp : 'MartinDias 1/21/2017 01:29'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmSessionStoreNamingStrategy class>>availableStrategies [

	^ self allSubclasses reject: #hasAbstractMethods
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmSessionStoreNamingStrategy>>nextTo: aName in: aDirectory [
	"Answer a name for a new Ombu log, that should not collide with an existing file in the same directory."
	
	^ self subclassResponsibility
]
