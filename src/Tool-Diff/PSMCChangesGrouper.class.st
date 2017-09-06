"
I am a visitor on MCDefinition objects. I will group a collection of definitions into a tree that will be shown in the PSMCPatchMorph.
"
Class {
	#name : #PSMCChangesGrouper,
	#superclass : #Object,
	#instVars : [
		'nonClassChanges',
		'classes',
		'model',
		'currentOperation',
		'classChanges'
	],
	#category : #Tool-Diff,
	#timestamp : 'GuillermoPolito 8/21/2014 17:09'
}

{
	#category : #'helper methods',
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCChangesGrouper class>>group: aCollectionOfPatches [

	^ self new
		model: aCollectionOfPatches;
		group
]

{
	#category : #grouping,
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCChangesGrouper>>ensureClassChangeWrapperNamed: aClassName [
	
	(classes includes: aClassName)
		ifFalse: [ classes add: aClassName.
				classChanges add: (PSMCClassChangeWrapper with: aClassName model: model ) ]
]

{
	#category : #grouping,
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCChangesGrouper>>group [

	model do: [:operation | self visit: operation ].
	^ (nonClassChanges sorted: [:a :b | a item <= b item]),
		(classChanges sorted: [:a :b | a item <= b item])
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCChangesGrouper>>initialize [

	super initialize.
	classChanges := OrderedCollection new.
	nonClassChanges := OrderedCollection new.
	classes := Set new.
]

{
	#category : #grouping,
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCChangesGrouper>>model: aCollection  [

	model := aCollection.
]

{
	#category : #grouping,
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCChangesGrouper>>visit: aMCOperation [

	| previous |
	previous := currentOperation.
	currentOperation := aMCOperation.
	currentOperation definition accept: self.
	currentOperation := previous.
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCChangesGrouper>>visitClassDefinition: aMCClassDefinition  [
	
	self ensureClassChangeWrapperNamed: aMCClassDefinition fullClassName
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCChangesGrouper>>visitClassTraitDefinition: aMCClassTraitDefinition  [
	
	"Do nothing for class traits (similar to #visitMetaclassDefinition:)"
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCChangesGrouper>>visitDefaultDefinition: aDefinition [

	nonClassChanges add: aDefinition
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCChangesGrouper>>visitMetaclassDefinition: aMCClassDefinition  [
	
	"Do nothing for metaclasses"
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCChangesGrouper>>visitMethodDefinition: aMCMethodDefinition  [
	
	self ensureClassChangeWrapperNamed: aMCMethodDefinition fullClassName
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCChangesGrouper>>visitOrganizationDefinition: aMCOrganizationDefinition  [
	
	nonClassChanges add: (currentOperation patchWrapper model: model)
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCChangesGrouper>>visitScriptDefinition: aMCScriptDefinition [

	"do nothing for script definitions"
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 05:26:25'
}
PSMCChangesGrouper>>visitTraitDefinition: aMCTraitDefinition  [
	
	self ensureClassChangeWrapperNamed: aMCTraitDefinition fullClassName
]
