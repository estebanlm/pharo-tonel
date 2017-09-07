"
A ProtocolOrganizer is part of a ClassOrganizer. 

It manages the protocols of the class that owns it
"
Class {
	#name : #ProtocolOrganizer,
	#superclass : #Object,
	#instVars : [
		'allProtocol',
		'protocols'
	],
	#category : #Kernel-Protocols,
	#timestamp : '<historical>'
}

{
	#category : #import,
	#timestamp : ' 8/31/2017 07:16:33'
}
ProtocolOrganizer class>>fromSpec: aSpec [
	
	^ self new
		fromSpec: aSpec;
		yourself
]

{
	#category : #'protocol - adding',
	#timestamp : ' 8/31/2017 07:16:33'
}
ProtocolOrganizer>>addProtocol: aProtocol [

	^ protocols add: aProtocol
]

{
	#category : #'protocol - adding',
	#timestamp : ' 8/31/2017 07:16:33'
}
ProtocolOrganizer>>addProtocolNamed: aName [
	^ protocols add: (Protocol name: aName)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
ProtocolOrganizer>>allMethods [

	^ self protocols flatCollect: [:p | p methods ].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
ProtocolOrganizer>>allProtocol [

	^ allProtocol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
ProtocolOrganizer>>allProtocols [

	^ { allProtocol }, protocols asArray
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
ProtocolOrganizer>>allProtocolsNames [

	^ self allProtocols collect: #name
]

{
	#category : #'protocol - adding',
	#timestamp : ' 8/31/2017 07:16:33'
}
ProtocolOrganizer>>classify: aSymbol inProtocolNamed: aProtocolName [
	| name protocol |
	
	name := aProtocolName.
	name = allProtocol name
		ifTrue: [ name := Protocol unclassified ].
		
	"maybe here we should check if this method already belong to another protocol"
	(self protocolsOfSelector: aSymbol) do: [:p | p removeMethod: aSymbol ].
	protocol := self getProtocolNamed: name ifNone: [ self addProtocolNamed: name ].
	
	protocol addMethod: aSymbol
	
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:33'
}
ProtocolOrganizer>>existsProtocolNamed: aProtocolName [
	
	^self allProtocols anySatisfy: [ :e | e name = aProtocolName ] 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
ProtocolOrganizer>>extensionProtocols [
	^ self protocols select: #isExtensionProtocol
]

{
	#category : #importing,
	#timestamp : ' 8/31/2017 07:16:33'
}
ProtocolOrganizer>>fromSpec: aSpec [
	
	aSpec do: [:spec || name methods |
		name := spec first asSymbol.
		methods := spec allButFirst asSet.
		self addProtocol: (Protocol 
								name: name
								methods: methods) ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 07:16:33'
}
ProtocolOrganizer>>getProtocolNamed: aByteString ifNone: aBlockClosure [
	
	^ protocols detect: [:e | e name = aByteString ] ifNone: aBlockClosure 
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:33'
}
ProtocolOrganizer>>hasProtocolNamed: aString [

	^ self allProtocols anySatisfy: [ :each | each name = aString ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:33'
}
ProtocolOrganizer>>includesSelector: selector [
	^ protocols anySatisfy: [ :each | each includesSelector: selector ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:33'
}
ProtocolOrganizer>>initialize [
	super initialize.
	self reset
]

{
	#category : #'backward compatibility',
	#timestamp : ' 8/31/2017 07:16:33'
}
ProtocolOrganizer>>methodsInProtocolNamed: aName [
	aName = AllProtocol defaultName 
		ifTrue: [ ^ self allMethods ].

	^ (self protocolNamed: aName) methods
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:33'
}
ProtocolOrganizer>>moveMethodsFrom: fromProtocolNamed to: toProtocolNamed [
	| fromProtocol toProtocol |
	
	fromProtocol := self protocolNamed: fromProtocolNamed.
	toProtocol := self protocolNamed: toProtocolNamed.
	
	toProtocol addAllMethodsFrom: fromProtocol.
	fromProtocol removeAllMethods.
	
	^ toProtocol.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
ProtocolOrganizer>>protocolNamed: aName [

	^ self 
		protocolNamed: aName 
		ifAbsent: [ Protocol empty ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
ProtocolOrganizer>>protocolNamed: aString ifAbsent: aBlock [
	^  self allProtocols 
		detect: [ :e | e name = aString ] 
		ifNone: aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
ProtocolOrganizer>>protocols [

	^ protocols asArray
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
ProtocolOrganizer>>protocolsNames [

	^ protocols 
		collect: #name 
		as: Array
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 07:16:33'
}
ProtocolOrganizer>>protocolsOfSelector: aSelector [

	^ (self protocols select: [:each | each includesSelector: aSelector ]) asArray
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 07:16:33'
}
ProtocolOrganizer>>protocolsSorted [
	^ (self protocols collect: #name as: Array) sort
		copyWithFirst: allProtocol name
]

{
	#category : #'protocol - removing',
	#timestamp : ' 8/31/2017 07:16:33'
}
ProtocolOrganizer>>removeEmptyProtocols [
	| removedProtocols |
	removedProtocols := protocols select: [:e | e isEmpty and: [ e canBeRemoved ] ].
	removedProtocols do: [:each | self removeProtocol: each].
	^removedProtocols
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
ProtocolOrganizer>>removeMethod: aSymbol [

	(self protocolsOfSelector: aSymbol) do: [ :p | p removeMethod: aSymbol ]
]

{
	#category : #'protocol - removing',
	#timestamp : ' 8/31/2017 07:16:33'
}
ProtocolOrganizer>>removeProtocol: aProtocol [
	
	aProtocol canBeRemoved
		ifFalse: [ 
			"Virtual protocols who cannot be removed should not raise an error"
			aProtocol isVirtualProtocol 
				ifTrue: [ ^ self ].
			ProtocolRemovalException signal ].
	
	^ protocols 
		remove: aProtocol
		ifAbsent: [ ]
]

{
	#category : #'protocol - removing',
	#timestamp : ' 8/31/2017 07:16:33'
}
ProtocolOrganizer>>removeProtocolNamed: aName [
	| protocolToRemove |
	
	protocolToRemove := self protocolNamed: aName.
	^ self removeProtocol: protocolToRemove
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
ProtocolOrganizer>>renameProtocol: oldName into: newName [
	(self existsProtocolNamed: newName) 
		ifTrue: [ 
			self moveMethodsFrom: oldName to: newName.
			self removeProtocolNamed: oldName ] 
		ifFalse: [ 
			^ (self protocolNamed: oldName)
				name: newName;
				yourself ].
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:33'
}
ProtocolOrganizer>>reset [
	protocols := IdentitySet new.
	allProtocol := AllProtocol protocolOrganizer: self.
]
