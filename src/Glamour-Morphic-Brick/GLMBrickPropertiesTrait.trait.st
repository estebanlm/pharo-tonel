"
I declare api and logic to work with properties of a Brick, such as color, shadow, renderer and more
"
Trait {
	#name : #GLMBrickPropertiesTrait,
	#traits : 'GLMBrickExtensionTrait',
	#classTraits : 'GLMBrickExtensionTrait classTrait',
	#category : #Glamour-Morphic-Brick-Traits,
	#timestamp : 'AliakseiSyrel 1/30/2015 10:49'
}

{
	#category : #brick-properties-events,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickPropertiesTrait>>announce: anAnnouncement [

	self announcer announce: anAnnouncement
]

{
	#category : #brick-properties-events,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickPropertiesTrait>>announce: aSymbol event: anEvent [

	self announcer subscriptions glmSubscriptions do: [ :each |
		each announcementClass = aSymbol ifTrue: [
			(each handlesAnnouncement: aSymbol ) ifTrue: [
				[ each action cull: anEvent cull: self ] 
					on: UnhandledError fork: [:ex | ex pass ] ] ] ]
]

{
	#category : #brick-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickPropertiesTrait>>announcer [

	^ self explicitRequirement
]

{
	#category : #brick-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickPropertiesTrait>>border [

	^ self valueOfProperty: #brickBorder ifAbsentPut: [ GLMBrickBorder new ]
	
]

{
	#category : #brick-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickPropertiesTrait>>border: aBorder [

	self setProperty: #brickBorder toValue: aBorder
]

{
	#category : #brick-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickPropertiesTrait>>borderColor [
	
	^ self border color
]

{
	#category : #brick-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickPropertiesTrait>>borderColor: anObject [
	<brickBuilderProperty: #'Look&Feel' name: 'Border color' as: #brickBuilderEvaluate getter: #borderColor model: #GLMUIBuilderTextFieldProperty>

	self border color: anObject
]

{
	#category : #brick-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickPropertiesTrait>>borderDo: aBlock [

	aBlock cull: self border.
	^ self
]

{
	#category : #brick-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickPropertiesTrait>>borderWidth [

	^ self border width
]

{
	#category : #brick-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickPropertiesTrait>>borderWidth: anObject [
	<brickBuilderProperty: #'Look&Feel' name: 'Border width' as: #brickBuilderEvaluate getter: #borderWidth model: #GLMUIBuilderTextFieldProperty>

	self border width: anObject
]

{
	#category : #brick-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickPropertiesTrait>>color [

	^ self valueOfProperty: #brickBackgroundColor ifAbsent: [ self themer backgroundColor ]
]

{
	#category : #brick-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickPropertiesTrait>>color: aColor [
	<brickBuilderProperty: #'Look&Feel' name: 'Color' as: #brickBuilderEvaluate getter: #color model: #GLMUIBuilderTextFieldProperty>

	self setProperty: #brickBackgroundColor toValue: aColor
]

{
	#category : #brick-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickPropertiesTrait>>data [

	^ self valueOfProperty: #brickDataObject ifAbsentPut: [ nil ]
]

{
	#category : #brick-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickPropertiesTrait>>data: anObject [

	^ self setProperty: #brickDataObject  toValue:  anObject
]

{
	#category : #private-extension,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickPropertiesTrait>>hasProperty: aSymbol [

	^ self explicitRequirement
]

{
	#category : #brick-properties-testing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickPropertiesTrait>>isColorSet [

	^ self hasProperty: #brickBackgroundColor
]

{
	#category : #brick-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickPropertiesTrait>>markBorderColor: aColor width: anInteger [

	self setProperty: #brickMarkBorderColor toValue: aColor.
	self setProperty: #brickMarkBorderWidth toValue: anInteger
]

{
	#category : #brick-properties-events,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickPropertiesTrait>>onThemerChanged [

]

{
	#category : #private-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickPropertiesTrait>>privateThemer [

	^ self valueOfProperty: #brickThemer ifAbsentPut: [ nil ]
]

{
	#category : #private-extension,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickPropertiesTrait>>removeProperty: aSymbol [
	
	^ self explicitRequirement
]

{
	#category : #brick-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickPropertiesTrait>>renderer [

	^ self valueOfProperty: #brickRenderer ifAbsentPut: [ nil ]
]

{
	#category : #brick-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickPropertiesTrait>>renderer: aRenderer [

	self setProperty: #brickRenderer toValue: aRenderer
]

{
	#category : #private-extension,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickPropertiesTrait>>setProperty: aSymbol toValue: anObject [
	
	^ self explicitRequirement
]

{
	#category : #brick-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickPropertiesTrait>>shadowColor [

	^ self valueOfProperty: #brickShadowColor ifAbsentPut: [ Color transparent ]
]

{
	#category : #brick-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickPropertiesTrait>>shadowColor: aColor [
	<brickBuilderProperty: #'Look&Feel' name: 'Shadow Color' as: #brickBuilderEvaluate getter: #shadowColor model: #GLMUIBuilderTextFieldProperty>

	self setProperty: #brickShadowColor toValue: aColor
]

{
	#category : #brick-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickPropertiesTrait>>shadowInset [
	^ self valueOfProperty: #brickShadowInset ifAbsentPut: [ 0 ]
]

{
	#category : #brick-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickPropertiesTrait>>shadowInset: aNumber [
	self setProperty: #brickShadowInset toValue: aNumber
]

{
	#category : #brick-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickPropertiesTrait>>shadowOffset [
	^ self valueOfProperty: #brickShadowOffset ifAbsentPut: [ 0@0 ]
]

{
	#category : #brick-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickPropertiesTrait>>shadowOffset: aPoint [
	self setProperty: #brickShadowOffset toValue: aPoint
]

{
	#category : #brick-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickPropertiesTrait>>shadowWidth [

	^ self valueOfProperty: #brickShadowWidth ifAbsentPut: [ 0 ]
]

{
	#category : #brick-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickPropertiesTrait>>shadowWidth: anInteger [
	<brickBuilderProperty: #'Look&Feel' name: 'Shadow Width' as: #asInteger getter: #shadowWidth model: #GLMUIBuilderTextFieldProperty>

	self setProperty: #brickShadowWidth toValue: anInteger
]

{
	#category : #brick-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickPropertiesTrait>>themer [

	^ self privateThemer
		ifNotNil: [ self privateThemer ]
		ifNil: [ self hasOwner
			ifTrue: [ self owner themer ]
			ifFalse: [ self theme brickThemer ] ]
]

{
	#category : #brick-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickPropertiesTrait>>themer: aThemer [

	self setProperty: #brickThemer toValue: aThemer.
	self themerChanged
]

{
	#category : #brick-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickPropertiesTrait>>themerChanged [

	self onThemerChanged.
	self subbricks do: #themerChanged
]

{
	#category : #private-extension,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickPropertiesTrait>>valueOfProperty: aSymbol [
	
	^ self explicitRequirement
]

{
	#category : #private-extension,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickPropertiesTrait>>valueOfProperty: aSymbol ifAbsent: aBlock [
	
	^ self explicitRequirement
]

{
	#category : #private-extension,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickPropertiesTrait>>valueOfProperty: aSymbol ifAbsentPut: aBlock  [
	
	^ self explicitRequirement
]

{
	#category : #brick-properties-events,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickPropertiesTrait>>when: aventName do: aBlock [

	self announcer when: aventName do: aBlock
]

{
	#category : #brick-properties-events,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickPropertiesTrait>>when: aventName send: aSymbol to: aReceiver [

	self announcer when: aventName send: aSymbol to: aReceiver
]

{
	#category : #brick-properties,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMBrickPropertiesTrait>>with: aBlock [

	aBlock cull: self
]
