"
MorphExtension provides access to extra instance state that is not required in most simple morphs.  This allows simple morphs to remain relatively lightweight while still admitting more complex structures as necessary.  The otherProperties field takes this policy to the extreme of allowing any number of additional named attributes, albeit at a certain cost in speed and space.
"
Class {
	#name : #MorphExtension,
	#superclass : #Object,
	#instVars : [
		'locked',
		'visible',
		'sticky',
		'balloonText',
		'externalName',
		'eventHandler',
		'otherProperties',
		'fillStyle',
		'layoutPolicy',
		'layoutFrame',
		'layoutProperties',
		'borderStyle',
		'cornerStyle',
		'actionMap',
		'clipSubmorphs'
	],
	#category : #Morphic-Core-Kernel,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphExtension>>actionMap [
	"Answer the value of actionMap"

	^actionMap ifNil: [self valueOfProperty: #actionMap ifAbsent: []]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphExtension>>actionMap: anObject [
	"Set the value of actionMap"

	actionMap := anObject
]

{
	#category : #'accessing - other properties',
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphExtension>>assureOtherProperties [
	"creates an otherProperties for the receiver if needed"
	otherProperties ifNil: [self initializeOtherProperties].
	^ otherProperties
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphExtension>>balloonText [
	^ balloonText
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphExtension>>balloonText: newValue [
	balloonText := newValue
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphExtension>>borderStyle [
	"Answer the value of borderStyle"

	^borderStyle
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphExtension>>borderStyle: anObject [
	"Set the value of borderStyle"

	borderStyle := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphExtension>>clipSubmorphs [
	"Answer the value of clipSubmorphs"

	^clipSubmorphs
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphExtension>>clipSubmorphs: anObject [
	"Set the value of clipSubmorphs"

	clipSubmorphs := anObject
]

{
	#category : #connectors-copying,
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphExtension>>copyWeakly [
	"list of names of properties whose values should be weak-copied when veryDeepCopying a morph.  See DeepCopier."

	^ #(formerOwner)
	"add yours to this list" 

	"formerOwner should really be nil at the time of the copy, but this will work just fine."
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphExtension>>cornerStyle [
	"Answer the value of cornerStyle"

	^cornerStyle ifNil: [#square]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphExtension>>cornerStyle: anObject [
	"Set the value of cornerStyle"

	cornerStyle := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphExtension>>eventHandler [
	"answer the receiver's eventHandler"
	^ eventHandler 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphExtension>>eventHandler: newValue [
	eventHandler := newValue
]

{
	#category : #viewer,
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphExtension>>externalName [
	^ externalName
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphExtension>>externalName: aString  [
	"change the receiver's externalName"
	externalName := aString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphExtension>>fillStyle [
	"Answer the value of fillStyle"

	^ fillStyle
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphExtension>>fillStyle: anObject [
	"Set the value of fillStyle"

	fillStyle := anObject
]

{
	#category : #'accessing - other properties',
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphExtension>>hasProperty: aSymbol  [
	"Answer whether the receiver has the property named aSymbol"
	| property |
	otherProperties ifNil: [^ false].
	property := otherProperties at: aSymbol ifAbsent: [].
	property ifNil: [^ false].
	property == false ifTrue: [^ false].
	^ true
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphExtension>>initialize [
	
	locked := false.
	visible := true.
	sticky := false.


]

{
	#category : #'accessing - other properties',
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphExtension>>initializeOtherProperties [
	"private - initializes the receiver's otherProperties"
	otherProperties :=  SmallIdentityDictionary new
]

{
	#category : #other,
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphExtension>>inspectElement [
	"Create and schedule an Inspector on the otherProperties and the 
	named properties."
	| key obj |
	key := UIManager default 
				chooseFrom: self sortedPropertyNames 
				values: self sortedPropertyNames
				title: 'Inspect which property?' translated.
	key
		ifNil: [^ self].
	obj := otherProperties
				at: key
				ifAbsent: ['nOT a vALuE'].
	obj = 'nOT a vALuE'
		ifTrue: [(self perform: key) inspect
			"named properties"]
		ifFalse: [obj inspect]
]

{
	#category : #other,
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphExtension>>isDefault [
	"Return true if the receiver is a default and can be omitted"
	locked == true
		ifTrue: [^ false].
	visible == false
		ifTrue: [^ false].
	sticky == true
		ifTrue: [^ false].
	balloonText ifNotNil: [^ false].
	externalName ifNotNil: [^ false].
	eventHandler ifNotNil: [^ false].
	otherProperties ifNotNil: [otherProperties isEmpty ifFalse: [^ false]].
	^ true
]

{
	#category : #'accessing - layout properties',
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphExtension>>layoutFrame [

	^layoutFrame
]

{
	#category : #'accessing - layout properties',
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphExtension>>layoutFrame: aLayoutFrame [

	layoutFrame := aLayoutFrame
]

{
	#category : #'accessing - layout properties',
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphExtension>>layoutPolicy [

	^layoutPolicy
]

{
	#category : #'accessing - layout properties',
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphExtension>>layoutPolicy: aLayoutPolicy  [
	
	layoutPolicy := aLayoutPolicy
]

{
	#category : #'accessing - layout properties',
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphExtension>>layoutProperties [

	^layoutProperties
]

{
	#category : #'accessing - layout properties',
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphExtension>>layoutProperties: newProperties  [
	"Return the current layout properties associated with the receiver"

	layoutProperties := newProperties
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphExtension>>locked [
	"answer whether the receiver is Locked"
	^ locked
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphExtension>>locked: aBoolean  [
	"change the receiver's locked property"
	locked := aBoolean
]

{
	#category : #'accessing - other properties',
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphExtension>>otherProperties [
	"answer the receiver's otherProperties"
	^ otherProperties
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphExtension>>printOn: aStream [
	"Append to the argument, aStream, a sequence of characters that 
	identifies the receiver."

	super printOn: aStream.
	aStream
		space;
		nextPut: $(;
		print: self identityHash;
		nextPut: $).
	locked == true
		ifTrue: [ aStream nextPutAll: ' [locked] ' ].
	visible == false
		ifTrue: [ aStream nextPutAll: '[not visible] ' ].
	sticky == true
		ifTrue: [ aStream nextPutAll: ' [sticky] ' ].
	balloonText ifNotNil: [ aStream nextPutAll: ' [balloonText] ' ].
	externalName
		ifNotNil: [ 
			aStream
				nextPutAll: ' [externalName = ' , externalName;
				nextPutAll: ' ] ' ].
	eventHandler
		ifNotNil: [ 
			aStream
				nextPutAll: ' [eventHandler = ' , eventHandler printString;
				nextPutAll: '] ' ].
	(otherProperties isNil or: [ otherProperties isEmpty ])
		ifTrue: [ ^ self ].
	aStream nextPutAll: ' [other: '.
	self otherProperties
		keysDo: [ :aKey | 
			aStream
				nextPutAll: ' (' , aKey , ' -> ' , (self otherProperties at: aKey) printString;
				nextPutAll: ')' ].
	aStream nextPut: $]
]

{
	#category : #connectors-copying,
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphExtension>>propertyNamesNotCopied [
	"list of names of properties whose values should be deleted when veryDeepCopying a morph.
	See DeepCopier."

	^ #(connectedConstraints connectionHighlights highlightedTargets)
	"add yours to this list" 

]

{
	#category : #'accessing - other properties',
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphExtension>>removeOtherProperties [
	"Remove the 'other' properties"
	otherProperties := nil
]

{
	#category : #'accessing - other properties',
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphExtension>>removeProperty: aSymbol  [
	"removes the property named aSymbol if it exists"
	otherProperties ifNil: [^ self].
	otherProperties removeKey: aSymbol ifAbsent: [].
	otherProperties isEmpty ifTrue: [self removeOtherProperties]
]

{
	#category : #'accessing - other properties',
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphExtension>>setProperty: aSymbol toValue: abObject  [
	"change the receiver's property named aSymbol to anObject"
	self assureOtherProperties at: aSymbol put: abObject
]

{
	#category : #'accessing - other properties',
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphExtension>>sortedPropertyNames [
	"answer the receiver's property names in a sorted way"

	| props |
	props := (Array new: 10) writeStream.
	locked == true ifTrue: [props nextPut: #locked].
	visible == false ifTrue: [props nextPut: #visible].
	sticky == true ifTrue: [props nextPut: #sticky].
	balloonText ifNotNil: [props nextPut: #balloonText].
	externalName ifNotNil: [props nextPut: #externalName].
	eventHandler ifNotNil: [props nextPut: #eventHandler].
	 otherProperties ifNotNil: [otherProperties associationsDo: [:a | props nextPut: a key]].
	^props contents sort: [:s1 :s2 | s1 <= s2]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphExtension>>sticky [
	^ sticky
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphExtension>>sticky: aBoolean  [
	"change the receiver's sticky property"
	sticky := aBoolean
]

{
	#category : #'accessing - other properties',
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphExtension>>valueOfProperty: aSymbol  [
"answer the value of the receiver's property named aSymbol"
	^ self
		valueOfProperty: aSymbol
		ifAbsent: []
]

{
	#category : #'accessing - other properties',
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphExtension>>valueOfProperty: aSymbol ifAbsent: aBlock  [
	"if the receiver possesses a property of the given name, answer  
	its value. If not then evaluate aBlock and answer the result of  
	this block evaluation"
	otherProperties ifNil: [^ aBlock value].
	^ otherProperties at: aSymbol ifAbsent: [^ aBlock value]
]

{
	#category : #'accessing - other properties',
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphExtension>>valueOfProperty: aSymbol ifAbsentPut: aBlock  [
	"If the receiver possesses a property of the given name, answer  
	its value. If not, then create a property of the given name, give 
	it the value obtained by evaluating aBlock, then answer that  
	value"
	^self assureOtherProperties at: aSymbol ifAbsentPut: aBlock
]

{
	#category : #connectors-copying,
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphExtension>>veryDeepFixupWith: deepCopier  [
	"If target and arguments fields were weakly copied, fix them here.
	If they were in the tree being copied, fix them up, otherwise point to the originals!!"

	super veryDeepFixupWith: deepCopier.
	otherProperties ifNil: [ ^self ].

	"Properties whose values are only copied weakly replace those values if they were copied via another path"
	self copyWeakly do: [ :propertyName |
		otherProperties at: propertyName ifPresent: [ :property |
			otherProperties at: propertyName
				put: (deepCopier references at: property ifAbsent: [ property ])]].

]

{
	#category : #connectors-copying,
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphExtension>>veryDeepInner: deepCopier  [
	"Copy all of my instance variables.
	Some otherProperties need to be not copied at all, but shared. Their names are given by copyWeakly.
	Some otherProperties should not be copied or shared. Their names are given by propertyNamesNotCopied.
	This is special code for the dictionary. See DeepCopier, and veryDeepFixupWith:."

	| namesOfWeaklyCopiedProperties weaklyCopiedValues |
	super veryDeepInner: deepCopier.
	locked := locked veryDeepCopyWith: deepCopier.
	visible := visible veryDeepCopyWith: deepCopier.
	sticky := sticky veryDeepCopyWith: deepCopier.
	balloonText := balloonText veryDeepCopyWith: deepCopier.
	externalName := externalName veryDeepCopyWith: deepCopier.
	eventHandler := eventHandler veryDeepCopyWith: deepCopier. 	"has its own restrictions"
	
	fillStyle := fillStyle veryDeepCopyWith: deepCopier.
	layoutPolicy := layoutPolicy veryDeepCopyWith: deepCopier.
	layoutFrame := layoutFrame veryDeepCopyWith: deepCopier.
	layoutProperties := layoutProperties veryDeepCopyWith: deepCopier.
	borderStyle := borderStyle  veryDeepCopyWith: deepCopier.
	cornerStyle := cornerStyle veryDeepCopyWith: deepCopier.
	actionMap := actionMap veryDeepCopyWith: deepCopier.
	clipSubmorphs := clipSubmorphs veryDeepCopyWith: deepCopier.

	otherProperties ifNil: [ ^self ].

	otherProperties := otherProperties copy.
	self propertyNamesNotCopied do: [ :propName | otherProperties removeKey: propName ifAbsent: [] ].

	namesOfWeaklyCopiedProperties := self copyWeakly.
	weaklyCopiedValues := namesOfWeaklyCopiedProperties collect: [  :propName | otherProperties removeKey: propName ifAbsent: [] ].

	"Now copy all the others."
	otherProperties := otherProperties veryDeepCopyWith: deepCopier.

	"And replace the weak ones."
	namesOfWeaklyCopiedProperties with: weaklyCopiedValues do: [ :name :value | value ifNotNil: [ otherProperties at: name put: value ]].

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphExtension>>visible [
	"answer whether the receiver is visible"
	^ visible
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:11'
}
MorphExtension>>visible: newValue [
	visible := newValue
]
