"
A MTGroup is a convenient way to group software dependencies (instances of MTDependency). 

Instance Variables
	- dependencies : A collection of dependencies defiing the group.

"
Class {
	#name : #MTGroup,
	#superclass : #MTDependency,
	#category : #Versionner-Core-DependenciesModel,
	#timestamp : '<historical>'
}

{
	#category : #visiting,
	#timestamp : ' 8/31/2017 05:26:38'
}
MTGroup>>acceptVisitor: anMTProjectVisitor [
	anMTProjectVisitor visitGroup: self
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:38'
}
MTGroup>>addDependency: aDependency [
	super addDependency: aDependency.
	self project ifNotNil: [ self project announcer announce: (MTProjectModelChanged project: self) ].
]

{
	#category : #displaying,
	#timestamp : ' 8/31/2017 05:26:38'
}
MTGroup>>displayString [
	^ name
]
