Extension {
	#name : #SmalltalkImage
}

{
	#category : #'*Slot',
	#timestamp : ' 8/31/2017 07:16:35'
}
SmalltalkImage>>anonymousClassInstaller [
	"Answer the class responsible of creating classes in the system."
	
	^ AnonymousClassInstaller
]

{
	#category : #'*Slot',
	#timestamp : ' 8/31/2017 07:16:35'
}
SmalltalkImage>>classBuilder [
	"Answer the object responsible of creating subclasses of myself in the system."
	
	^ self classInstaller new builder
]

{
	#category : #'*Slot',
	#timestamp : ' 8/31/2017 07:16:35'
}
SmalltalkImage>>classInstaller [
	"Answer the class responsible of creating classes in the system."
	
	^ PharoClassInstaller
]
