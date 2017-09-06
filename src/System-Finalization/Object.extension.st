Extension {
	#name : #Object
}

{
	#category : #'*System-Finalization',
	#timestamp : ' 8/31/2017 07:16:47'
}
Object>>mourn [
	"Sent by the new Finalization mechanism.
	All weak objects (instances of weak classes) and Ephemerons may be mourned if they point to an object that needs to be collected.
	
	This default implementation does nothing. To override in specific subclasses."
]
