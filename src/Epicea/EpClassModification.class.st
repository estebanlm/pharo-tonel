"
I represent the modification of a class.
"
Class {
	#name : #EpClassModification,
	#superclass : #EpClassChange,
	#instVars : [
		'oldClass',
		'newClass'
	],
	#category : #Epicea-Model,
	#timestamp : 'MartinDias 12/12/2014 14:45'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpClassModification class>>oldClass: anOldClass newClass: aNewClass [

	^ self basicNew
		initializeOldClass: anOldClass
		newClass: aNewClass;
		yourself

]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpClassModification>>accept: aVisitor [

	^ aVisitor visitClassModification: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpClassModification>>behaviorAffected [
	^ newClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpClassModification>>behaviorAffectedName [
	^ newClass name
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpClassModification>>hasMetaclassChanges [
	"FIX should compare metaclasses as a whole"

	^ oldClass theMetaClass instVarNames ~= newClass theMetaClass instVarNames
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpClassModification>>hasNonMetaclassChanges [

	^ oldClass classVarNames ~= newClass classVarNames
		or: [ oldClass instVarNames ~= newClass instVarNames
				or: [ oldClass sharedPoolNames ~= newClass sharedPoolNames
						or: [ oldClass superclassName ~= newClass superclassName ] ] ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpClassModification>>initializeOldClass: anOldClass newClass: aNewClass [

	self initialize.
	oldClass := anOldClass asEpiceaRingDefinition theNonMetaClass.
	newClass := aNewClass asEpiceaRingDefinition theNonMetaClass.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpClassModification>>newClass [

	^ newClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
EpClassModification>>oldClass [

	^ oldClass
]
