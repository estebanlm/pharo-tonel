"
I'm the superclass keeping track of the state of the object (added/modified/removed) but according the kind of object the changes apply to. My subclasses KomitClass, KomitDefinition, KomitPackage and KomitMethod wrap MCAddition/MCRemoval/MCDefinition. 

While the hierarchy of MCDefinition is about the kind of change (addition, removal, definition),
the current hierarchy is about the kind of objects changes apply to.

Now it would be interested to see if this hierarchy has been created because of lack of awareness that the hierarchy of MCDefinition is already proposing such facilities. 

"
Class {
	#name : #KomitObject,
	#superclass : #Object,
	#instVars : [
		'added',
		'modified',
		'removed',
		'selected',
		'expanded'
	],
	#category : #Komitter-Models,
	#timestamp : 'StephaneDucasse 11/24/2015 19:09'
}

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitObject>><= aKomitObject  [

	^ self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitObject>>added [
	^ added
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitObject>>added: anObject [
	added := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitObject>>expanded [
	^ expanded
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitObject>>expanded: anObject [
	expanded := anObject
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitObject>>flush [
	
	added := false.
	modified := false.
	removed := false.
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitObject>>initialize [

	super initialize.

	added := false.
	modified := false.
	removed := false.
	
	selected := true.
	expanded := false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitObject>>isCommitable [

	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitObject>>isDefinition [

	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitObject>>isDirty [

	^ self added or: [ self modified or: [ self removed ] ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitObject>>isKomitClass [

	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitObject>>isMethod [

	^ false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitObject>>isPackage [

	^ false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitObject>>modified [
	^ modified
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitObject>>modified: anObject [
	modified := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitObject>>removed [
	^ removed
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitObject>>removed: anObject [
	removed := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitObject>>selected [
	^ selected
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitObject>>selected: anObject [
	selected := anObject
]
