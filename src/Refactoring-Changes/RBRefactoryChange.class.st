"
I am the superclass of all refactoring change objects. 
All I have is a name for the refactoring, but I can perform one or more refactoring operations with the message #execute. 
I am a composite object. To know about my components, ask me with #changes and #changesSize. 
"
Class {
	#name : #RBRefactoryChange,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#category : #Refactoring-Changes,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryChange>>changeForClass: aClassName selector: aSelector  [
	^ nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryChange>>changeForMetaclass: aClassName selector: aSelector  [
	^ nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryChange>>changeStamp [
	^ Author changeStamp
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryChange>>changeString [
	^self class name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryChange>>changes [
	^Array with: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryChange>>changesSize [
	^1
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryChange>>displayString [
	^name isNil ifTrue: [self changeString] ifFalse: [name]
]

{
	#category : #performing-changes,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryChange>>execute [
	^self executeNotifying: []
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryChange>>executeNotifying: aBlock  [
	self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryChange>>name [
	^name isNil ifTrue: [self changeString] ifFalse: [name]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryChange>>name: aString [
	name := aString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
RBRefactoryChange>>renameChangesForClass: oldClassName to: newClassName [
	"We're in the middle of performing a rename operation. If we stored the class name, we need to change the class name to the new name to perform the compiles."

	self subclassResponsibility
]
