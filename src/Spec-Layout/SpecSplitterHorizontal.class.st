"
A SpecSplitterHorizontal is a description of the addition of a horizontal splitter
"
Class {
	#name : #SpecSplitterHorizontal,
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
SpecSplitterHorizontal class>>commands: commands [

	^ self new
		commands: commands;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecSplitterHorizontal>>commands [
	
	^ commands
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecSplitterHorizontal>>commands: anObject [
	
	commands := anObject
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecSplitterHorizontal>>generateArguments [
	| index |

	index := self commands identityIndexOf: self.

	self arguments: { index }
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecSplitterHorizontal>>initialize [

	super initialize.

	selector := #newHSplitterAt:.
	layoutFrame  := (0@0 corner: 0@0) asLayoutFrame 
							bottomOffset: 1.
	commands := nil.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SpecSplitterHorizontal>>isSplitter [

	^ true
]
