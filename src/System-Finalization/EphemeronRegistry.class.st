"
I'm a registry of Ephemerons. My main responsibility is to hold Ephemeron instances to avoid that they are collected, and thus, guarantee their finalization.

As soon as an Ephemeron receives the #mourn message, it will tell me to remove himself from me using the #removeEphemeron: message.


!! Example of usage 

An ephemeron registry can be simply used by instantiating it and putting objects inside it:

registry := EphemeronRegistry new.
registry at: objectThatMayBeCollected put: somePropertyThatWouldBeHoldWeaklyDependingOnTheKey.

Notice that the key is the object that is important from the finalization point of view. As soon as the key is only rechable by the ephemeron registry, two things will happen:

- The key will be sent #finalize, giving the user the opportunity to override the hook and provide an application specific finalization
- They registry will forget the ephemeron. If the value of the ephemeron is only referenced by this ephemeron it will then be collected.

Ephemerons are created by the registry itself, and retrieved by the ephemeron registry in case the user needs to manipulate the ephemeron manually:

ephemeron := registry at: key put: value.


!! Implementation Details

This Ephemeron registry is implemented using an IdentitySet to hold the remembered Ephemeron instances. This avoid to scan for keys, and allows the usage of several ephemerons for the same object.
"
Class {
	#name : #EphemeronRegistry,
	#superclass : #Object,
	#instVars : [
		'ephemeronCollection'
	],
	#category : #System-Finalization,
	#timestamp : 'GuillermoPolito 5/30/2016 12:35'
}

{
	#category : #registration,
	#timestamp : ' 8/31/2017 07:16:47'
}
EphemeronRegistry>>at: key put: value [

	^ self registerEphemeron: (Ephemeron key: key value: value container: self)
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:47'
}
EphemeronRegistry>>initialize [

	super initialize.
	ephemeronCollection := IdentitySet new.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:47'
}
EphemeronRegistry>>isEmpty [

	^ ephemeronCollection isEmpty
]

{
	#category : #registration,
	#timestamp : ' 8/31/2017 07:16:47'
}
EphemeronRegistry>>registerEphemeron: anEphemeron [

	^ ephemeronCollection add: anEphemeron
]

{
	#category : #registration,
	#timestamp : ' 8/31/2017 07:16:47'
}
EphemeronRegistry>>removeEphemeron: anEphemeron [

	ephemeronCollection remove: anEphemeron
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:47'
}
EphemeronRegistry>>size [

	^ ephemeronCollection size
]
