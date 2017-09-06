"
This class plays the role of the announcer for events raised by the Pharo system.

BEWARE: You should not need to subclass me. Think about just using me to send your announces (if you need system behavior) or using your own announcers as instance or class  variables.
"
Class {
	#name : #SystemAnnouncer,
	#superclass : #Announcer,
	#instVars : [
		'suspended',
		'private',
		'storedAnnouncements'
	],
	#classInstVars : [
		'announcer'
	],
	#category : #System-Announcements-Core,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
SystemAnnouncer class>>announcer: anAnnouncer [
	announcer := anAnnouncer
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:17:00'
}
SystemAnnouncer class>>reset [

	"unregister all current weak subscriptions because it can cause a memory leak"
	announcer subscriptions subscriptions
 		select: [:each | each isKindOf: LegacyWeakSubscription] 
		thenDo: [:each | each weakRegistry remove: each subscriber ifAbsent: []]. 
	Smalltalk garbageCollect.
		
	announcer := nil.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:17:00'
}
SystemAnnouncer class>>restoreAllNotifications [
	"self restoreAllNotifications"
	
	| collector |
	self reset.
	collector := PragmaCollector filter: [ :pragma | pragma keyword = #systemEventRegistration ].
	collector reset.
	collector do: [ :pragma |
		pragma methodClass theNonMetaClass perform: pragma methodSelector ]
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:17:00'
}
SystemAnnouncer class>>uniqueInstance [
	"Answer a system annoncer."
	
	^ announcer ifNil: [ announcer := self new ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:17:00'
}
SystemAnnouncer class>>unload [
	self uniqueInstance unsubscribe: self
]

{
	#category : #announce,
	#timestamp : ' 8/31/2017 07:17:00'
}
SystemAnnouncer>>announce: anAnnouncement [
	self isSuspended 
		ifFalse: [ 
			self private announce: anAnnouncement.
			super announce: anAnnouncement ]
		ifTrue:[
			storedAnnouncements ifNotNil:[ storedAnnouncements add: anAnnouncement ]
		].
]

{
	#category : #triggering,
	#timestamp : ' 8/31/2017 07:17:00'
}
SystemAnnouncer>>class: aClass oldComment: oldComment newComment: newComment oldStamp: oldStamp newStamp: newStamp [
	"A class was commented in the system."

	self announce: (ClassCommented class: aClass oldComment: oldComment newComment: newComment oldStamp: oldStamp newStamp: newStamp)
]

{
	#category : #triggering,
	#timestamp : ' 8/31/2017 07:17:00'
}
SystemAnnouncer>>class: aClass recategorizedFrom: oldCategory to: newCategory  [
	self announce: (ClassRecategorized 
						class: aClass
						recategorizedFrom: oldCategory
						to: newCategory)
]

{
	#category : #triggering,
	#timestamp : ' 8/31/2017 07:17:00'
}
SystemAnnouncer>>classAdded: aClass inCategory: aCategoryName  [
	self announce: (ClassAdded class: aClass category: aCategoryName)
]

{
	#category : #triggering,
	#timestamp : ' 8/31/2017 07:17:00'
}
SystemAnnouncer>>classCategoryAdded: aClassCategoryName [

	self announce: (CategoryAdded categoryName: aClassCategoryName)
]

{
	#category : #triggering,
	#timestamp : ' 8/31/2017 07:17:00'
}
SystemAnnouncer>>classCategoryRemoved: aClassCategoryName [

	self announce: (CategoryRemoved categoryName: aClassCategoryName)
]

{
	#category : #triggering,
	#timestamp : ' 8/31/2017 07:17:00'
}
SystemAnnouncer>>classCategoryRenamedFrom: anOldClassCategoryName to: aNewClassCategoryName [

	self announce: (CategoryRenamed
					classCategoryRenamedFrom: anOldClassCategoryName 
					to: aNewClassCategoryName)
]

{
	#category : #triggering,
	#timestamp : ' 8/31/2017 07:17:00'
}
SystemAnnouncer>>classCommented: aClass [
	"A class with the given name was commented in the system."

	self announce: (ClassCommented classCommented: aClass)
]

{
	#category : #triggering,
	#timestamp : ' 8/31/2017 07:17:00'
}
SystemAnnouncer>>classDefinitionChangedFrom: oldClass to: newClass [
	self announce: (ClassModifiedClassDefinition classDefinitionChangedFrom: oldClass to: newClass)
]

{
	#category : #triggering,
	#timestamp : ' 8/31/2017 07:17:00'
}
SystemAnnouncer>>classModificationAppliedTo: aClassOrTrait [
	self announce: (ClassModificationApplied toClass: aClassOrTrait)
]

{
	#category : #triggering,
	#timestamp : ' 8/31/2017 07:17:00'
}
SystemAnnouncer>>classParentOf: aClass renamedFrom: oldName to: newName [
	self announce: (ClassParentRenamed classParentOf: aClass renamedFrom: oldName to: newName)
]

{
	#category : #triggering,
	#timestamp : ' 8/31/2017 07:17:00'
}
SystemAnnouncer>>classRemoved: aClass fromCategory: aCategoryName  [
	self announce: (ClassRemoved class: aClass category: aCategoryName)
]

{
	#category : #triggering,
	#timestamp : ' 8/31/2017 07:17:00'
}
SystemAnnouncer>>classRenamed: aClass from: oldClassName to: newClassName inCategory: aCategoryName  [
	self announce: (ClassRenamed 
				class: aClass
				category: aCategoryName
				oldName: oldClassName
				newName: newClassName)
]

{
	#category : #triggering,
	#timestamp : ' 8/31/2017 07:17:00'
}
SystemAnnouncer>>classReorganized: aClass [
	self announce: (ClassReorganized class: aClass)
]

{
	#category : #triggering,
	#timestamp : ' 8/31/2017 07:17:00'
}
SystemAnnouncer>>classRepackaged: aClass from: aPackage to: anotherPackage [
	self announce: (ClassRepackaged
						classRepackaged: aClass
						oldPackage: aPackage 
						newPackage: anotherPackage)
]

{
	#category : #triggering,
	#timestamp : ' 8/31/2017 07:17:00'
}
SystemAnnouncer>>classTagAdded: tagName inPackage: aPackage [

	self announce: (ClassTagAdded in: aPackage tag: tagName)
]

{
	#category : #triggering,
	#timestamp : ' 8/31/2017 07:17:00'
}
SystemAnnouncer>>classTagRemoved: tagName fromPackage: aPackage [

	self announce: (ClassTagRemoved in: aPackage tag: tagName)
]

{
	#category : #triggering,
	#timestamp : ' 8/31/2017 07:17:00'
}
SystemAnnouncer>>classTagRenamed: tagName inPackage: aPackage to: newTagName [

	self announce: (ClassTagRenamed in: aPackage tag: tagName to: newTagName)
]

{
	#category : #triggering,
	#timestamp : ' 8/31/2017 07:17:00'
}
SystemAnnouncer>>evaluated: textOrStream [
	^ self evaluated: textOrStream context: nil.
]

{
	#category : #triggering,
	#timestamp : ' 8/31/2017 07:17:00'
}
SystemAnnouncer>>evaluated: expression context: aContext [
	self announce: (ExpressionEvaluated 
				expression: expression
				context: aContext)
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:00'
}
SystemAnnouncer>>isSuspended [
	^suspended ifNil: [ suspended := false ]
]

{
	#category : #triggering,
	#timestamp : ' 8/31/2017 07:17:00'
}
SystemAnnouncer>>methodAdded: aMethod  [
	"A method with the given selector was added to aClass, but not put in a protocol."

	self announce: (MethodAdded method: aMethod)
]

{
	#category : #triggering,
	#timestamp : ' 8/31/2017 07:17:00'
}
SystemAnnouncer>>methodChangedFrom: oldMethod to: newMethod oldProtocol: oldProtocol [

	self announce: (MethodModified methodChangedFrom: oldMethod to: newMethod oldProtocol: oldProtocol)
]

{
	#category : #triggering,
	#timestamp : ' 8/31/2017 07:17:00'
}
SystemAnnouncer>>methodRecategorized: method oldProtocol: oldProtocol [

	self announce: (MethodRecategorized method: method oldProtocol: oldProtocol)
]

{
	#category : #triggering,
	#timestamp : ' 8/31/2017 07:17:00'
}
SystemAnnouncer>>methodRemoved: aMethod protocol: protocol origin: aBehavior [
	"A method with the given selector was removed from the class."

	self announce: (MethodRemoved methodRemoved: aMethod protocol: protocol origin: aBehavior)
]

{
	#category : #triggering,
	#timestamp : ' 8/31/2017 07:17:00'
}
SystemAnnouncer>>methodRepackaged: aMethod from: aPackage to: anotherPackage [
	self announce: (MethodRepackaged
						methodRepackaged: aMethod
						oldPackage: aPackage 
						newPackage: anotherPackage)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:00'
}
SystemAnnouncer>>private [
	^private ifNil: [ private := Announcer new ]
]

{
	#category : #triggering,
	#timestamp : ' 8/31/2017 07:17:00'
}
SystemAnnouncer>>protocolAdded: aString inClass: aClass [
	self announce: (ProtocolAdded new 
		classReorganized: aClass;
		protocol: aString;
		yourself)
]

{
	#category : #triggering,
	#timestamp : ' 8/31/2017 07:17:00'
}
SystemAnnouncer>>protocolRemoved: aString inClass: aClass [
	self announce: (ProtocolRemoved new 
		classReorganized: aClass;
		protocol: aString;
		yourself)
]

{
	#category : #triggering,
	#timestamp : ' 8/31/2017 07:17:00'
}
SystemAnnouncer>>protocolRenamedFrom: oldName to: newName inClass: aClass [
	self
		announce:
			(ProtocolRenamed new
				classReorganized: aClass;
				oldProtocolName: oldName;
				newProtocolName: newName;
				yourself)
]

{
	#category : #triggering,
	#timestamp : ' 8/31/2017 07:17:00'
}
SystemAnnouncer>>snapshotDone: isNewImage [

	self announce: (SnapshotDone isNewImage: isNewImage)
]

{
	#category : #announce,
	#timestamp : ' 8/31/2017 07:17:00'
}
SystemAnnouncer>>suspendAllWhile: aBlock [
	| oldSuspended |
	oldSuspended := self isSuspended.
	suspended := true.
	^aBlock ensure: [ suspended := oldSuspended ]
]

{
	#category : #announce,
	#timestamp : ' 8/31/2017 07:17:00'
}
SystemAnnouncer>>suspendAllWhileStoring: aBlock [
	| reentring |
	" Suspend all the announcements, storing them in an OrderedCollection, then returns this collection"
	
	reentring := storedAnnouncements isNotNil.
	
	reentring ifFalse:[
		storedAnnouncements := OrderedCollection new.
	].

	[ 
		self suspendAllWhile: aBlock.
		^ storedAnnouncements.
	] ensure:[
		reentring ifFalse:[
			storedAnnouncements := nil.
		]
	]
]

{
	#category : #triggering,
	#timestamp : ' 8/31/2017 07:17:00'
}
SystemAnnouncer>>traitDefinitionChangedFrom: oldTrait to: newTrait [
	self announce: (ClassModifiedClassDefinition classDefinitionChangedFrom: oldTrait to: newTrait)
]

{
	#category : #subscription,
	#timestamp : ' 8/31/2017 07:17:00'
}
SystemAnnouncer>>unsubscribe: anObject [
	self private unsubscribe: anObject.	
	super unsubscribe: anObject.

]
