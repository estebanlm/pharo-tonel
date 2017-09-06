"
A PragmaCollector is used in order to collect some Pragma instances. A PragmaCollector makes use of SystemChangeNotifier event notifications in order to maintain its contents up-to-date according to its filter: when a method is added, removed or updated, if the method is defined with a pragma which is acceptable according to its filter, then the collector contents is updated. A PragmaCollector makes use of an announcer in order to notify all registered listeners when a pragma is added, removed or updated. A PragmaAnnouncement is announced when a Pragma is added, removed or updated. Corresponding announcement classes are, respectiveley, PragmaAdded, PragmaRemoved and PragmaUpdated. 

Explore the result of the expression below. In the collected instance variable should be stored all pragmas of the system:
---------------------------
(PragmaCollector filter: [:pragma | true]) reset
---------------------------

In the following example, collected pragma are thoses with the 'primitive:' keyword (<primitive:>)
---------------------------
(PragmaCollector filter: [:prg | prg keyword = 'primitive:']) reset
---------------------------

Instance Variables	
	announcer:		<Announcer>	
	collected:		<Collection>
	filter:			<Block or MessageSend>
				
announcer
	the announcer which is used to announce the adding, the removing or the updating of a method with an acceptable pragma declaration

collected		
	the current collection of Pragma
	
filter
	a block or a message send which is used in order to filter the pragma. This is a one argument valuable. When evaluated, the candidate pragam is passed as argument and the result must be a boolean. 
	
"
Class {
	#name : #PragmaCollector,
	#superclass : #Model,
	#instVars : [
		'collected',
		'filter',
		'announcer',
		'announcing'
	],
	#category : #PragmaCollector,
	#timestamp : 'AlainPlantec 11/28/2009 01:09'
}

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 07:16:11'
}
PragmaCollector class>>allSystemPragmas [
	^ (Array
		streamContents: [:stream | SystemNavigation new
				allBehaviorsDo: [:behavior | Pragma
						withPragmasIn: behavior
						do: [:pragma | stream nextPut: pragma]]]) 
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:11'
}
PragmaCollector class>>filter: aOneArgValuable [
	^ self new filter: aOneArgValuable
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 07:16:11'
}
PragmaCollector>>addPragma: aPragma [
	"if aPragma is to be kept, then add it and announce its adding"
	(self keepPragma: aPragma)
		ifTrue: [self collected add: aPragma.
			self announce: (PragmaAdded pragma: aPragma)]
]

{
	#category : #'system changes',
	#timestamp : ' 8/31/2017 07:16:11'
}
PragmaCollector>>addedEventOccurs: anEvent [
	"method adding event occured: if the 
	concerned method contains a pragma then 
	try to update myself with it"

	Pragma
		withPragmasIn: anEvent methodClass
		do: [ :pragma | 
			pragma methodSelector = anEvent selector
				ifTrue: [ self addPragma: pragma ] ]
]

{
	#category : #subscription,
	#timestamp : ' 8/31/2017 07:16:11'
}
PragmaCollector>>announce: anAnnouncement [
	"see Announcements packages"

	self announcing ifTrue:	[ self announcer announce: anAnnouncement ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:11'
}
PragmaCollector>>announcing [
	^ announcing ifNil: [ announcing := true ]
]

{
	#category : #'system changes',
	#timestamp : ' 8/31/2017 07:16:11'
}
PragmaCollector>>classRemovedEventOccurs: anEvent [
	"a class has been removed: first see if the class is not my class
	because then I must be unplugged from system event notifications"
	anEvent classRemoved = self class
		ifTrue: [^ self noMoreNotifications].
	"remove all handler which are from the removed class"
	(self pragmasOfClass: anEvent classRemoved class)
		do: [:handler | self removePragma: handler] 
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:11'
}
PragmaCollector>>collect: aBlock [
	^ self collected collect: aBlock
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:11'
}
PragmaCollector>>collected [
	^ collected ifNil: [collected := OrderedCollection new] 
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:11'
}
PragmaCollector>>detect: aBlock [
	^ self collected detect: aBlock ifNone:[]
	
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:11'
}
PragmaCollector>>do: aBlock [
	self collected do: aBlock
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:11'
}
PragmaCollector>>filter [
	^ filter ifNil: [filter := [:prg | true]]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:11'
}
PragmaCollector>>filter: aOneArgValuable [
	filter := aOneArgValuable
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:11'
}
PragmaCollector>>ifNotEmpty: aBlock [
	self collected ifNotEmpty: aBlock
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:11'
}
PragmaCollector>>initialize [
	super initialize.
	self installSystemNotifications
]

{
	#category : #'system changes',
	#timestamp : ' 8/31/2017 07:16:11'
}
PragmaCollector>>installSystemNotifications [
	"Allows myself to be kept up-to-date regarding system changes"
	
	SystemAnnouncer uniqueInstance unsubscribe: self.
	
	SystemAnnouncer uniqueInstance weak
			when: ClassRemoved send: #classRemovedEventOccurs: to: self;
			when: MethodRemoved send: #removedEventOccurs: to: self;
			when: MethodAdded send: #addedEventOccurs: to: self;
			when: MethodModified send: #modifiedEventOccurs: to: self
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:11'
}
PragmaCollector>>isEmpty [
	^ self collected isEmpty
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:11'
}
PragmaCollector>>isNotEmpty [
	^ self collected isNotEmpty
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 07:16:11'
}
PragmaCollector>>keepPragma: aPragma [
	^ self filter value: aPragma

]

{
	#category : #'system changes',
	#timestamp : ' 8/31/2017 07:16:11'
}
PragmaCollector>>modifiedEventOccurs: anEvent [
	"
	a method has been updated: try to update an handler:
	1 - I already have one for the method, then
	do nothing, 
	2 - I do not have one but method has an acceptable
	pragma in it, then I try to add a new handler
	3 - I have one but changed method has no more
	acceptable pragma in it, then the handler is removed.
	"

	Pragma
		withPragmasIn: anEvent methodClass
		do: [ :pragma | 
			pragma methodSelector = anEvent selector
				ifTrue: [ (self
						detect: [ :oldprag | 
							oldprag methodSelector = pragma methodSelector
								and: [ oldprag methodClass = anEvent methodClass ] ])
						ifNotNil: [ :oldprag | ^ self updatePragma: oldprag ].
					^ self addPragma: pragma ] ].
	"No pragma but an handler for the method"
	(self
		pragmaWithSelector: anEvent selector
		inClass: anEvent methodClass)
		ifNotNil: [ :found | self removePragma: found ]
]

{
	#category : #'system changes',
	#timestamp : ' 8/31/2017 07:16:11'
}
PragmaCollector>>noMoreAnnounceWhile: aBlock [
	"unplug the announcer during aBlock"
	| oldAnnouncing |
	[oldAnnouncing := announcing. 
	announcing := false.
	aBlock value]
		ensure: [announcing := oldAnnouncing]
]

{
	#category : #'system changes',
	#timestamp : ' 8/31/2017 07:16:11'
}
PragmaCollector>>noMoreNotifications [
	"Do not receiver any system change notification anymore"
	SystemAnnouncer uniqueInstance unsubscribe: self.
]

{
	#category : #'system changes',
	#timestamp : ' 8/31/2017 07:16:11'
}
PragmaCollector>>noMoreNotificationsWhile: aBlock [
	"don not receive any system change notification during aBloc"
	self noMoreNotifications.
	[ aBlock value ] ensure: [ self installSystemNotifications ]
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:11'
}
PragmaCollector>>noneSatisfy: aBlock [
	^ self collected noneSatisfy: aBlock
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:11'
}
PragmaCollector>>pragmaWithSelector: aSelector inClass: aClass [
	"return the handler corresponding to a pragma method which selector is aSelector in class aClass"

	^ self
		detect: [ :prag | prag methodClass = aClass and: [ prag methodSelector = aSelector ] ]
]

{
	#category : #querying,
	#timestamp : ' 8/31/2017 07:16:11'
}
PragmaCollector>>pragmasOfClass: aClass  [
	"return all handlers of class aClass"
	^ self	select: [:prag | prag methodClass = aClass ]
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:11'
}
PragmaCollector>>reject: aBlock [
	^ self collected reject: aBlock 
]

{
	#category : #'dependents access',
	#timestamp : ' 8/31/2017 07:16:11'
}
PragmaCollector>>release [
	self noMoreNotifications.
	announcer := nil.
	collected := nil.
	super release
]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 07:16:11'
}
PragmaCollector>>removePragma: aPragma  [
	"remove an handler an announce it"
	self collected remove: aPragma ifAbsent: [].
	self announce: (PragmaRemoved pragma: aPragma)
]

{
	#category : #'system changes',
	#timestamp : ' 8/31/2017 07:16:11'
}
PragmaCollector>>removedEventOccurs: anEvent [
	"a method has been removed, remove any corresponding handler if found"

	(self
		detect: [ :prag | 
			prag methodSelector = anEvent selector
				and: [ prag methodClass = anEvent methodClass ] ])
		ifNotNil: [ :found | self removePragma: found ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:11'
}
PragmaCollector>>reset [
	"reinitialize current system settings"
	self
		noMoreAnnounceWhile: [self collected copy
				do: [:pragma | self removePragma: pragma].
			self class allSystemPragmas
				do: [:pragma | self addPragma: pragma]].
	self announce: (PragmaCollectorReset collector: self)
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:11'
}
PragmaCollector>>select: aBlock [
	^ self collected select: aBlock
	
]

{
	#category : #subscription,
	#timestamp : ' 8/31/2017 07:16:11'
}
PragmaCollector>>unsubscribe: anObject [
	"see Announcements packages"
	self announcer unsubscribe: anObject


]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 07:16:11'
}
PragmaCollector>>updatePragma: aPragma [
	"only announce that the pragma has been updated"
	self announcer announce: (PragmaUpdated pragma: aPragma)
]

{
	#category : #subscription,
	#timestamp : ' 8/31/2017 07:16:11'
}
PragmaCollector>>when: anAnnouncement send: aSelector to: anObject [
	"see Announcements packages"

	self announcer when: anAnnouncement send: aSelector to: anObject
]

{
	#category : #subscription,
	#timestamp : ' 8/31/2017 07:16:11'
}
PragmaCollector>>whenChangedSend: aSelector to: anObject [
	"record a change listener"
	
	self when: PragmaAnnouncement send: aSelector to: anObject

]

{
	#category : #subscription,
	#timestamp : ' 8/31/2017 07:16:11'
}
PragmaCollector>>whenResetSend: aSelector to: anObject [
	"record a change listener"

	self when: PragmaCollectorReset send: aSelector to: anObject
]
