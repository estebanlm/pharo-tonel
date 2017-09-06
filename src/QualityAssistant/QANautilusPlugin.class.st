"
I plug nautilus with a feedback from smalllint
"
Class {
	#name : #QANautilusPlugin,
	#superclass : #AbstractNautilusPlugin,
	#instVars : [
		'morph',
		'currentEntity'
	],
	#category : #QualityAssistant,
	#timestamp : 'YuriyTymchuk 3/17/2015 17:33'
}

{
	#category : #position,
	#timestamp : ' 8/31/2017 05:26:37'
}
QANautilusPlugin class>>defaultPosition [

	^ #bottom 
]

{
	#category : #installing,
	#timestamp : ' 8/31/2017 05:26:37'
}
QANautilusPlugin class>>install [

	self isInstalled ifFalse: [
		Nautilus pluginClasses:
			(Nautilus pluginClasses copyWith:
				{ self . self defaultPosition }) ]
]

{
	#category : #installing,
	#timestamp : ' 8/31/2017 05:26:37'
}
QANautilusPlugin class>>isInstalled [

	^ Nautilus pluginClasses anySatisfy: [ :pluginBinding | 
			pluginBinding first = self ]
]

{
	#category : #display,
	#timestamp : ' 8/31/2017 05:26:37'
}
QANautilusPlugin class>>pluginName [
	^ 'Quality Assistant'
]

{
	#category : #information,
	#timestamp : ' 8/31/2017 05:26:37'
}
QANautilusPlugin class>>possiblePositions [

	^ { #middle . #bottom }
]

{
	#category : #installing,
	#timestamp : ' 8/31/2017 05:26:37'
}
QANautilusPlugin class>>uninstall [

	Nautilus pluginClasses:
		(Nautilus pluginClasses reject: [ :each | 
			each first = self ])
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:37'
}
QANautilusPlugin class>>unload [

	self uninstall 
]

{
	#category : #'announcement handling',
	#timestamp : ' 8/31/2017 05:26:37'
}
QANautilusPlugin>>classSelected: anAnnouncement [

	currentEntity := anAnnouncement selectedClass.
	self updateMorph  
]

{
	#category : #'announcement handling',
	#timestamp : ' 8/31/2017 05:26:37'
}
QANautilusPlugin>>critiqueBanned: ann [

	ann entity = self currentEntity ifTrue: [ 
		self updateMorph ]
]

{
	#category : #'interaction delegation',
	#timestamp : ' 8/31/2017 05:26:37'
}
QANautilusPlugin>>critiqueSelected: aCritique [
	aCritique sourceAnchor providesInterval ifTrue: [ 
		self model codeTextMorph
			setSelection: aCritique sourceAnchor interval;
			takeKeyboardFocus ]
]

{
	#category : #properties,
	#timestamp : ' 8/31/2017 05:26:37'
}
QANautilusPlugin>>currentEntity [

	^ currentEntity
]

{
	#category : #display,
	#timestamp : ' 8/31/2017 05:26:37'
}
QANautilusPlugin>>display [

   morph := QANautilusPluginMorph new.
	morph pluginDelegate: self.
	
	self updateMorph.
		
	^ morph
]

{
	#category : #'announcement handling',
	#timestamp : ' 8/31/2017 05:26:37'
}
QANautilusPlugin>>methodSelected: anAnnouncement [

	currentEntity := anAnnouncement selectedMethod.
	self updateMorph  
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
QANautilusPlugin>>morph [
	^ morph
]

{
	#category : #'announcement handling',
	#timestamp : ' 8/31/2017 05:26:37'
}
QANautilusPlugin>>otherSelected: anAnnouncement [

	 (anAnnouncement class == NautilusPackageSelected or:
	[ anAnnouncement class == NautilusProtocolSelected ]) ifFalse: [ ^ self ].

	currentEntity := nil.
	self updateMorph  
]

{
	#category : #'announcement handling',
	#timestamp : ' 8/31/2017 05:26:37'
}
QANautilusPlugin>>packageSelected: anAnnouncement [

	currentEntity := anAnnouncement selectedPackage package.
	self updateMorph  

]

{
	#category : #registration,
	#timestamp : ' 8/31/2017 05:26:37'
}
QANautilusPlugin>>registerTo: aModel [

	aModel announcer
		when: NautilusPackageSelected  send: #packageSelected:  to: self;
 		when: NautilusClassSelected    send: #classSelected:  to: self; 
		when: NautilusProtocolSelected send: #otherSelected:  to: self; 	 
		when: NautilusMethodSelected   send: #methodSelected: to: self.
		
	ReSystemAnnouncer uniqueInstance weak
		when: ReCritiqueBanned
		send: #critiqueBanned:
		to: self
	
]

{
	#category : #'announcement handling',
	#timestamp : ' 8/31/2017 05:26:37'
}
QANautilusPlugin>>updateMorph [
	morph ifNil: [ ^ self ].
	
	morph entity: self currentEntity
	
]
