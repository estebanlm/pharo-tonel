"

"
Class {
	#name : #RBMultiEnvironment,
	#superclass : #RBBrowserEnvironmentWrapper,
	#instVars : [
		'environmentDictionaries'
	],
	#category : #Refactoring-Critics,
	#timestamp : ''
}

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBMultiEnvironment>>addClass: aClass into: aValue  [
	(environmentDictionaries at: aValue ifAbsentPut: [RBSelectorEnvironment new]) 
		addClass: aClass
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBMultiEnvironment>>addClass: aClass selector: aSymbol into: aValue  [
	(environmentDictionaries at: aValue ifAbsentPut: [RBSelectorEnvironment new]) 
		addClass: aClass
		selector: aSymbol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBMultiEnvironment>>asSelectorEnvironment [
	| s |
	s := RBSelectorEnvironment new.
	s label: self label.
	environmentDictionaries do: [:each | | env |
			env := each asSelectorEnvironment. 
			env classesDo: [:cls | env selectorsForClass: cls do:  [:sel | s addClass: cls selector: sel]]].
	^ s
	  
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBMultiEnvironment>>environments [
	^environmentDictionaries keys
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBMultiEnvironment>>includesCategory: aCategory [
	^ (super includesCategory: aCategory) and: [ environmentDictionaries anySatisfy: [ :env | env includesCategory: aCategory ] ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBMultiEnvironment>>includesClass: aClass [
	^ (super includesClass: aClass) and: [ environmentDictionaries anySatisfy: [ :env | env includesClass: aClass ] ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBMultiEnvironment>>includesProtocol: aProtocol in: aClass [
	^ (super includesProtocol: aProtocol in: aClass) and: [ environmentDictionaries anySatisfy: [ :env | env includesProtocol: aProtocol in: aClass ] ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBMultiEnvironment>>includesSelector: aSelector in: aClass [
	^ (super includesSelector: aSelector in: aClass) and: [ environmentDictionaries anySatisfy: [ :env | env includesSelector: aSelector in: aClass ] ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBMultiEnvironment>>initialize [
	super initialize.
	environmentDictionaries := Dictionary new.
	environment := RBSelectorEnvironment new
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBMultiEnvironment>>isEmpty [
	^environmentDictionaries isEmpty
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBMultiEnvironment>>packages [
	self shouldBeImplemented
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBMultiEnvironment>>problemCount [
	^environmentDictionaries size
]

{
	#category : #removing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBMultiEnvironment>>removeClass: aClass [
	environmentDictionaries keysDo: [ :key |
		(environmentDictionaries at: key) removeClass: aClass ]
]

{
	#category : #removing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBMultiEnvironment>>removeClass: aClass into: aValue  [
	(environmentDictionaries at: aValue ifAbsent: [RBSelectorEnvironment new]) 
		removeClass: aClass
]

{
	#category : #removing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBMultiEnvironment>>removeClass: aClass selector: aSelector into: aValue  [
	(environmentDictionaries at: aValue ifAbsentPut: [RBSelectorEnvironment new]) 
		removeClass: aClass
		selector: aSelector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBMultiEnvironment>>selectEnvironment: aValue  [
	environment := environmentDictionaries at: aValue
				ifAbsent: [RBSelectorEnvironment new]
]
