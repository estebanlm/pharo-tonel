"
I am the base class for a HelpTopic/Builder for a set of classes.
I am used to create a list of pages for a class and all of its subclasses.
Unlike the ClassApiHelpBilder, I only put the class comments as page content and
ignore any method / method comments.
"
Class {
	#name : #RBClassesHelp,
	#superclass : #Model,
	#category : #Refactoring-Help,
	#timestamp : 'NicolaiHess 7/27/2016 22:17'
}

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:44'
}
RBClassesHelp class>>asHelpTopic [
	^ self buildClassHierarchyHelpFrom: self rootHelpClass
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:44'
}
RBClassesHelp class>>buildClassHierarchyHelpFrom: aRootClass [
	| topic |
	topic := HelpTopic named: aRootClass name.
	topic iconName: #classIcon.
	topic contents: aRootClass comment.
	aRootClass
		subclassesDo: [ :subclass | topic addSubtopic: (self buildClassHierarchyHelpFrom: subclass) ].
	^ topic
]

{
	#category : #building,
	#timestamp : ' 8/31/2017 05:26:44'
}
RBClassesHelp class>>rootHelpClass [
	^ self subclassResponsibility 
]
