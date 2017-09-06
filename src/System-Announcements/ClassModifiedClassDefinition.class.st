"
This announcement will be emitted when a class or a trait definition changes.

For example, when an instance variable is added or when the trait composition is modified in a class definition.
"
Class {
	#name : #ClassModifiedClassDefinition,
	#superclass : #ClassAnnouncement,
	#instVars : [
		'newClassDefinition',
		'oldClassDefinition'
	],
	#category : #System-Announcements-System-Classes,
	#timestamp : 'MartinDias 1/31/2014 16:31'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassModifiedClassDefinition class>>classDefinitionChangedFrom: oldClass to: newClass [
	^self new
			oldClassDefinition: oldClass;
			newClassDefinition: newClass;
			yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassModifiedClassDefinition>>classAffected [
	^self newClassDefinition
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassModifiedClassDefinition>>newClassDefinition [
	^newClassDefinition
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassModifiedClassDefinition>>newClassDefinition: aClass [
	newClassDefinition := aClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassModifiedClassDefinition>>oldClassDefinition [
	^oldClassDefinition
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
ClassModifiedClassDefinition>>oldClassDefinition: aClass [
	oldClassDefinition := aClass
]
