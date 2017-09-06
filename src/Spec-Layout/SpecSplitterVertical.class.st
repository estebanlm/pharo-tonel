"
A SpecSplitterVertical is the description of the addition of a vertical splitter
"
Class {
	#name : #SpecSplitterVertical,
	#superclass : #SpecLayoutAdd,
	#instVars : [
		'commands'
	],
	#category : #Spec-Layout,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecSplitterVertical class>>commands: commands [

	^ self new
		commands: commands;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecSplitterVertical>>commands [
	
	^ commands
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecSplitterVertical>>commands: anObject [
	
	commands := anObject
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecSplitterVertical>>generateArguments [
	| index |

	index := self commands identityIndexOf: self.

	self arguments: { index }
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecSplitterVertical>>initialize [

	super initialize.

	selector := #newVSplitterAt:.
	layoutFrame := ((0@0 corner: 0@0) asLayoutFrame 
							rightOffset: 1).
	commands := nil.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecSplitterVertical>>isSplitter [

	^ true
]
