"
I am a class installer that does not expose the class to the global environment nor announces that a new class has been created.
As it's name suggest it is used for anonymous classes, for instance in Tests.
"
Class {
	#name : #AnonymousClassInstaller,
	#superclass : #AbstractClassInstaller,
	#category : #Slot-ClassBuilder,
	#timestamp : '<historical>'
}

{
	#category : #notifications,
	#timestamp : ' 8/31/2017 07:16:35'
}
AnonymousClassInstaller>>classAdded: aClass inCategory: aCategory [

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
AnonymousClassInstaller>>classAt: aName ifAbsent: aBlock [
	^ aBlock value
]

{
	#category : #notifications,
	#timestamp : ' 8/31/2017 07:16:35'
}
AnonymousClassInstaller>>classDefinitionDeeplyChangedFrom: oldClass to: newClass by: classModification [

]

{
	#category : #notifications,
	#timestamp : ' 8/31/2017 07:16:35'
}
AnonymousClassInstaller>>classDefinitionShallowChangedFrom: oldClass to: newClass by: classModification [

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:35'
}
AnonymousClassInstaller>>environment: anEnvironment [

]

{
	#category : #migrating,
	#timestamp : ' 8/31/2017 07:16:35'
}
AnonymousClassInstaller>>migrateClasses: old to: new using: anInstanceModification [

]

{
	#category : #notifications,
	#timestamp : ' 8/31/2017 07:16:35'
}
AnonymousClassInstaller>>recategorize: aClass to: aCategory [

]
