"
I provide various actions for browsing a Context object. These actions are loaded by the debugger in the context menu of a stack.
"
Trait {
	#name : #GTBrowsingActions,
	#traits : '{}',
	#classTraits : '{}',
	#category : #GT-Debugger-Actions,
	#timestamp : 'AndreiChis 12/30/2015 11:21'
}

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTBrowsingActions>>browseClassRefs [

	self currentContext ifNotNil: [ :aContext || class|
		class := aContext methodClass theNonMetaClass.
		class isTrait 
			ifTrue: [ self systemNavigation browseAllUsersOfTrait: class ]
			ifFalse: [ self systemNavigation browseAllCallsOnClass: class ] ]

]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTBrowsingActions>>browseClassVarRefs [
	| cls |
	cls := self currentClass.
	(cls notNil and: [cls isTrait not])
		ifTrue: [self systemNavigation  browseClassVarRefs: cls]
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTBrowsingActions>>browseClassVariables [
	"Browse the class variables of the selected class."
	| cls |
	cls := self currentClass.
	(cls notNil and: [cls isTrait not])
		ifTrue: [self systemNavigation  browseClassVariables: cls]

]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTBrowsingActions>>browseInstVarRefs [
	| cls |
	cls := self currentClassOrMetaClass.
	(cls notNil and: [cls isTrait not])
		ifTrue: [self systemNavigation browseInstVarRefs: cls]
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTBrowsingActions>>browseMessages [
	"Present a menu of all messages sent by the current message. 
	Open a message set browser of all implementors of the message chosen."

	self currentMessageName ifNotNil: [   
		self systemNavigation browseAllImplementorsOf: self currentMessageName ]
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTBrowsingActions>>browseMethodFull [
	"Create and schedule a full Browser and then select the current class and message."

	self currentClassOrMetaClass ifNotNil: [ 
		Smalltalk tools browser 
			openOnClass: self currentClassOrMetaClass
			selector: self currentMessageName ]
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTBrowsingActions>>browseSendersOfMessages [
	"Present a menu of the current message, as well as all messages sent by it.  Open a message set browser of all senders of the selector chosen."

	self currentMessageName ifNotNil: [   
		self systemNavigation browseAllSendersOf: self currentMessageName ]
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTBrowsingActions>>browseVersions [
	"Create and schedule a message set browser on all versions of the 
	currently selected message selector."

	Smalltalk tools versionBrowser browseVersionsForClass: self currentClassOrMetaClass selector: self currentMessageName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTBrowsingActions>>currentClass [

	^ self currentContext methodClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTBrowsingActions>>currentClassOrMetaClass [

	^ self currentContext methodClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTBrowsingActions>>currentContext [
	
	^ self debugger currentContext
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTBrowsingActions>>currentMessageName [

	^ self currentContext methodSelector
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTBrowsingActions>>fileOutMessage [
	"Put a description of the selected message on a file"

	self currentMessageName ifNotNil: [
		Cursor write showWhile:
			[ self currentClassOrMetaClass fileOutMethod: self currentMessageName ] ]
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTBrowsingActions>>inspectInstances [
	"Inspect all instances of the selected class."

	self currentClassOrMetaClass ifNotNil: [ :aClass |
		aClass theNonMetaClass inspectAllInstances ]
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTBrowsingActions>>inspectSubInstances [
	"Inspect all instances of the selected class and all its subclasses"

	self currentClassOrMetaClass ifNotNil: [ :aClass |
		aClass theNonMetaClass inspectSubInstances ]
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTBrowsingActions>>methodHierarchy [
	"Create and schedule a method browser on the hierarchy of implementors."

	self systemNavigation 
			methodHierarchyBrowserForClass: self currentClassOrMetaClass 
			selector: self currentMessageName

]
