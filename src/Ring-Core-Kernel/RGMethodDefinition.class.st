"
RGMethodDefinition is a concrete representation of methods. It can be used to build browser for methods that are not in the image. It is polymorphic with CompiledMethod. 

* We can ask a RGMethodDefinition for its selector using the selector message.
Example:
	(Point>>#dist:) asRingDefinition selector
		-> #dist

We can also ask the ring object representation of its class or the Smalltalk class actually implementing the corresponding compiledMethod. 

* To access the ring class definition name, use parentName
	aRGMethodDefinition parentName
	
Example:
	(Point>>#dist:) asRingDefinition parentName
		->  #Point
		
* If you have a complete model where classes and methods are ring definition, to access the ring class definition , use parent
	aRGMethodDefinition parent
	
Example:
	aRGMethodDefinition(Point>>#dist:) parent
		->  aRGClassDefinition(Point)
		
* If you want to access the smalltalk class that contains the compiledMethod that is represented by a ringMethodDefinition, use realParent
	aRGMethodDefinition realParent
	
Example:
	(Point>>#dist:) asRingDefinition realParent
		->  Point
		

Now a RingEntityDefinition offers two APIs: one that is generic and works for all the source code entities and this is the one we just 
presented: parent, parentName and realParent. Having such interface is important to build generic tools that could manipulate 
any entities in a polymorphic way (yes no isKindOf: everywhere).

In addition, a ring method definition offers a specific interface that should only be used when you know that you are solely manipulate
specific entity such as class element: method definition, class comment, and variables. 

Here is the equivalence table

	realParent 				realClass
	parent					ringClass
	parentName			className


* The message class returns the class of the object :).

Example:
	(Point>>#dist:) asRingDefinition class
		->  RingMethodDefinition
		
* The message className returns the name of the ring class defining the reingMethodDefinition.

Example:
	(Point>>#dist:) asRingDefinition className
		->  #Point		
		
* If you have a complete model where classes and methods are ring definition, to access the ring class definition , use parent
	aRGMethodDefinition ringClass
	
Example:
	aRGMethodDefinition(Point>>#dist:) ringClass
		->  aRGClassDefinition(Point)
		
		
* If you want to access the smalltalk class that contains the compiledMethod that is represented by a ringMethodDefinition, use realClass
	aRGMethodDefinition realClass
	
Example:
	(Point>>#dist:) asRingDefinition realClass
		->  Point


"
Class {
	#name : #RGMethodDefinition,
	#superclass : #RGElementDefinition,
	#instVars : [
		'protocol',
		'sourceCode',
		'stamp',
		'package'
	],
	#category : #Ring-Core-Kernel,
	#timestamp : 'VeronicaUquillas 9/18/2011 16:00'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition class>>class: aRGBehaviorDefinition selector: aString [
	"Create a ring method definition from a ring class and a selector"

	^(self class: aRGBehaviorDefinition)
		selector: aString asSymbol;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition class>>className: aString selector: aSelector isMetaSide: aBoolean [

	^ (self class: (RGClassDefinition named: aString) selector: aSelector) isMetaSide: aBoolean; yourself
]

{
	#category : #elements-annotations,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition class>>isExtensionKey  [

	^#isExtension
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition class>>realClass: aClass selector: aString [
	"Creates a ring method definition from a Smalltalk class and a selector <compiledMethod>"

	^(aClass>>aString asSymbol) asActiveRingDefinition
]

{
	#category : #categories,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition class>>unclassifiedProtocolName [
	"Return the string labeling the unclassified protocol."

	^ 'as yet unclassified'
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition>><= aRGMethodDefinition [
	"Sort method definitions according to: 1. class name - 2. class comment - 3. method selector - 4. timestamp"

	self parentName < aRGMethodDefinition parentName ifTrue: [^true].
	self parentName > aRGMethodDefinition parentName ifTrue: [^false].

	self flag: 'This ugly test is needed right now because the old system is used to represent 
	class comment as method with Comment selector. And to mix comment and methods'.
	aRGMethodDefinition isComment ifTrue: [^false].
	
	^(self selector < aRGMethodDefinition selector) 
 		  or: [ (self selector == aRGMethodDefinition selector) and: [
    			  self timeStamp <= aRGMethodDefinition timeStamp ]]
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition>>= aRGMethodDefinition [
	"This method look for equality of the key properties of the receiver"


	^(super = aRGMethodDefinition)
		and: [ self selector == aRGMethodDefinition selector]
]

{
	#category : #'managing container',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition>>addInContainer: aRGContainer [

	aRGContainer addMethod: self
	
]

{
	#category : #traits,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition>>argumentNames [
	"Return an array with the argument names of the method's selector"

	self isActive
		ifTrue: [ ^ self compiledMethod argumentNames ].
	^ self ast ifNotNil:[:ast | ast arguments collect: #name ]
]

{
	#category : #'type of methods',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition>>asActive [

	"Sets the receiver as active object, which will allow itself to retrieve its data from the compiled method"
	self annotationNamed: self class statusKey put: #active
]

{
	#category : #'type of methods',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition>>asHistorical [

	"Sets the receiver as historical object, which will allow itself to retrieve its data using the sourcePointer"
	self annotationNamed: self class statusKey put: #historical.
	self sourcePointer ifNil:[ | pointer compiledMethod |
		pointer := 0.
		compiledMethod := self compiledMethod.
		compiledMethod notNil ifTrue: [
			pointer := compiledMethod sourcePointer ].
		pointer isZero
			ifFalse:[ self sourcePointer: pointer ] ]
]

{
	#category : #'type of methods',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition>>asPassive [

	"Sets the receiver as passive object, which will allow itself to retrieve its data that was assigned in its creation"
	self annotationNamed: self class statusKey put: #passive
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition>>ast [
	self isActive
		ifTrue: [ ^ self compiledMethod ast ].
	^  self sourceCode ifNotNil: [ ^ self astFromSource ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition>>astFromSource [
	^ RBParser parseMethod: self sourceCode
]

{
	#category : #'stamp values',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition>>author  [

	^self 
		annotationNamed: self class authorKey
		ifAbsentPut: [ self class parseAuthorAliasFrom: self stamp ]
]

{
	#category : #'stamp values',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition>>author: aString  [

	self annotationNamed: self class authorKey put: aString 
]

{
	#category : #'backward compatibility',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition>>category [

	^ self protocol
]

{
	#category : #'to remove as soon as possible',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition>>classIsMeta [

	^self isMetaSide
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition>>compiledMethod [
	"Retrieves the compiled method of this definition if exists"
	
	| rClass |
	(rClass := self realClass) notNil
		ifTrue: [ (rClass includesSelector: self selector)
			ifTrue: [ ^rClass >> self selector ] ].
			
	^nil
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition>>containsHalt [
	
	^ self method containsHalt
]

{
	#category : #'type of methods',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition>>fromActiveToHistorical [
	"If the receiver was generated as an active method, it can be converted to a historical one by reading the data of the compiled method (if exists)"
	
	self isActive ifTrue: [
		self asHistorical ]
]

{
	#category : #'type of methods',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition>>fromActiveToPassive [
	"If the receiver was generated as an active method, it can be converted to a passive one by reading the data of the compiled method (if exists)"

	| compiledMethod |
	self isActive
		ifFalse: [ ^ self ].
	compiledMethod := self compiledMethod.
	compiledMethod notNil
		ifTrue: [ 
			self protocol: compiledMethod category.
			self sourceCode: compiledMethod sourceCode.
			self stamp: compiledMethod timeStamp ].
	self asPassive
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition>>fullName [
	"Keeps a unique description for the receiver. As annotation to avoid converting each time is invoked"
	
	^self annotationNamed: self class fullNameKey
		ifAbsentPut: [ (self parentName, '>>', self selector) asSymbol ]
]

{
	#category : #'source pointers',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition>>getPreambleFrom: aFileStream at: position [
	^ SourceFiles getPreambleFrom: aFileStream at: position
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition>>hasStamp [

	^stamp isEmptyOrNil not
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition>>hash [

	^super hash bitXor: self selector hash
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition>>isAbstract [
	self isActive
		ifTrue: [ ^ self compiledMethod isAbstract ].
	^ false
]

{
	#category : #'type of methods',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition>>isActive [

	"A ring method isActive when it needs to access the compiledMethod for retrieving its data"
	^(self annotationNamed: self class statusKey) 
		ifNil:[ false ] 
		ifNotNil:[ :status| status == #active ]
]

{
	#category : #traits,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition>>isBinarySelector [
	^self selector
		allSatisfy: [:each | each isSpecial]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition>>isDefined [
	"Answer whether the receiver exists in the environment"
	
	| rClass |
	self selector isDoIt ifTrue:[ ^false ].
	rClass := self realClass.
	^rClass notNil and: [ rClass includesSelector: self selector ]
]

{
	#category : #SUnit-support,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition>>isErrorTest [
	"Is the receiver a test method that raised an error?"

	^ self methodClass isTestCase
		and: [ self methodClass methodRaisedError: self selector ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition>>isExtension [
	"The receiver is an extension when is defined in a different package to the one of its parent.
	Ring allows to set this property. If not assigned tries to find its value "
	
	^self 
		annotationNamed: self class isExtensionKey
		ifAbsent: [  
			(self parent notNil and:[ self package notNil ])
				ifTrue: [ | value |
					       value :=  self parent package ~= self package.
						 self annotationNamed: self class isExtensionKey put: value.
						 value ]
				ifFalse: [ self protocol ifNil:[ false ] ifNotNil:[ :prot|  prot beginsWith: '*' ] ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition>>isExtension: aBoolean [
	"Explicitily set that the receiver is an extension"
	
	self annotationNamed: self class isExtensionKey put: aBoolean 
]

{
	#category : #SUnit-support,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition>>isFailedTest [
	"Is the receiver a test method that failed?"

	^ self methodClass isTestCase
		and: [ self methodClass methodFailed: self selector ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition>>isFromTrait [

	"Return true for methods that have been included from Traits"
	^ self origin isTrait and: [ self origin ~= self methodClass ]
]

{
	#category : #'type of methods',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition>>isHistorical [

	"A ring method can be used to point an old version of the receiver, in this case it will use the sourcePointer to retrieve its information"
	^(self annotationNamed: self class statusKey) 
		ifNil:[ false ] 
		ifNotNil:[ :status| status == #historical ]
]

{
	#category : #'managing container',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition>>isIncludedInContainer: aRGContainer [

	^aRGContainer includesMethod: self
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition>>isLocalSelector [
	"Answer whether the receiver exists in the environment as a local implementation"
	
	| rClass |
	rClass:= self realClass.
	^rClass notNil and: [ rClass includesLocalSelector: self selector ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition>>isMethod [

	^true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition>>isOverridden [
	self isActive
		ifTrue: [ ^ self compiledMethod isOverridden ].
	^ false
]

{
	#category : #SUnit-support,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition>>isPassedTest [
	"Is the receiver a test method that passed?"

	^ self methodClass isTestCase
		and: [ self methodClass methodPassed: self selector ]
]

{
	#category : #'type of methods',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition>>isPassive [

	"A ring method isPassive when it retrieves the data that was assigned in its creation.
	By default is passive"
	^(self annotationNamed: self class statusKey) 
		ifNil:[ true ] 
		ifNotNil:[ :status| status == #passive ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition>>isSameRevisionAs: aRGMethodDefinition [
	"This method look for equality of the properties of the receiver"
	"Stamp is ignored as in many cases a method is saved without containing any change. However it appears as changed due to a different stamp"
	self flag: 'needs to be evaluated'.

	^(super isSameRevisionAs: aRGMethodDefinition)
		and: [ self selector = aRGMethodDefinition selector 
			and: [ self protocol = aRGMethodDefinition protocol
				and: [ self sourceCode = aRGMethodDefinition sourceCode ] ] ]
]

{
	#category : #SUnit-support,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition>>isTestMethod [
	"Is the receiver a TestCase test method?"

	| selectorString |
	self methodClass isTestCase
		ifFalse: [ ^ false ].
	self numArgs isZero
		ifFalse: [ ^ false ].
	selectorString := self selector asString.

	"for some reason unary selectors starting with 'should' are supposed
	to be treated as test methods"
	^ (selectorString beginsWith: 'test') or: [ selectorString beginsWith: 'should' ]
]

{
	#category : #'to remove as soon as possible',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition>>isValid [
	"verifies that the receiver is locally defined in the class and that is not a DoIt"

	^self isDefined
]

{
	#category : #literals,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition>>literals [
	
	"bad code but I do not know how to properly retrieve the good compiled method using a RGMethodDefinition"


	^ self compiledMethod literals.
]

{
	#category : #'backward compatibility',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition>>messages [
	self isActive
		ifTrue: [ ^ self method messages ].
	^ self ast ifNotNil: [ :ast | ast sentMessages ] ifNil: [ #() ]
]

{
	#category : #'backward compatibility',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition>>method [

	^self compiledMethod
]

{
	#category : #'backward compatibility',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition>>methodClass [
	"Return the class to which the receiver belongs to."
	
	^ self realClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition>>numArgs [
	^ self selector asString numArgs
]

{
	#category : #metrics,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition>>numberOfLinesOfCode [

	^ self annotationNamed: #numberOfLinesOfCode ifAbsentPut: [ self sourceCode lineCount ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition>>origin [
	"Return the real oring of this method."
	^ self compiledMethod 
		ifNil: [ self methodClass ]
		ifNotNil: [ :compileMethod| compileMethod origin ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition>>package [
	"Retrieves the package in which this class is contained, if exists"
	
	^package
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition>>package: aRGPackage [

	package:= aRGPackage
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition>>printOn: aStream  [

	self parentName ifNotNil: [
		aStream nextPutAll: self parentName;
				  nextPutAll: '>>' ].
	aStream print: self selector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition>>protocol [

	self isActive 
		ifTrue: [ ^ self compiledMethod ifNil: [ protocol ] ifNotNil: [ self compiledMethod protocol ]].
	self isHistorical
		ifTrue: [ ^ self protocolAtPointer ifNil: [ self compiledMethod ifNil: [ protocol ] ifNotNil:[ :cm | cm protocol ] ] ].
	^ protocol			
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition>>protocol: anObject [

	protocol := anObject
]

{
	#category : #'source pointers',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition>>protocolAtPointer [

	"A RGMethodDefinition that was set as historical will retrieve the protocol using the sourcePointer"

	^ self sourcePointer notNil
		ifTrue: [ SourceFiles protocolAt: self sourcePointer ]
		ifFalse:[ nil ]
]

{
	#category : #operations,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition>>recompile [
	self method recompile
]

{
	#category : #'managing container',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition>>removeFromContainer: aRGContainer [

	aRGContainer removeMethod: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition>>selector [
	"Retrieves the name of the method"

	^name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition>>selector: aSymbol [
	"The name of a method is known as #selector"

	name := aSymbol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition>>sourceCode [

	self isActive 
		ifTrue: [ ^ self compiledMethod ifNil:[ sourceCode ] ifNotNil: [ self compiledMethod sourceCode ]].
	self isHistorical
		ifTrue: [ ^ self sourceCodeAtPointer ifNil:[ self compiledMethod ifNil:[ sourceCode ] ifNotNil:[ :cm| cm sourceCode ] ] ].	
	^ sourceCode
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition>>sourceCode: anObject [

	sourceCode := anObject
]

{
	#category : #'source pointers',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition>>sourceCodeAtPointer [

	"A RGMethodDefinition that was set as historical will retrieve the sourceCode using the sourcePointer"

	^ self sourcePointer notNil
		ifTrue: [ SourceFiles sourceCodeAt: self sourcePointer ]
		ifFalse:[ nil ]
]

{
	#category : #'source pointers',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition>>sourcePointer [
	"Retrieves the sourcePointer for this definition if exists"
	
	^ self isActive 
		ifTrue: [ self compiledMethod sourcePointer ]
		ifFalse: [ self annotationNamed: self class sourcePointerKey ]
]

{
	#category : #'source pointers',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition>>sourcePointer: aNumber [

	self annotationNamed:  self class sourcePointerKey put: aNumber 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition>>stamp [

	self isActive 
		ifTrue: [ ^ self compiledMethod timeStamp ].
	self isHistorical
		ifTrue: [ ^ self stampAtPointer ifNil:[ self compiledMethod ifNil:[ stamp ] ifNotNil:[ :cm| cm timeStamp ] ] ].
	^ stamp
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition>>stamp: anObject [
	"stores an author alias and a timestamp"
	
	stamp := anObject
]

{
	#category : #'source pointers',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition>>stampAtPointer	 [

	"A RGMethodDefinition that was set as historical will retrieve the stamp using the sourcePointer"

	^ self sourcePointer notNil
		ifTrue: [ SourceFiles timeStampAt: self sourcePointer ]
		ifFalse:[ nil ]
]

{
	#category : #'backward compatibility',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition>>symbolic [

	^ self method symbolic
]

{
	#category : #'stamp values',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition>>timeStamp  [

	^self annotationNamed: self class timeStampKey 
		ifAbsentPut: [ self class 
							parseTimestampFrom: self stamp 
							default: (DateAndTime epoch) ]
]

{
	#category : #'stamp values',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGMethodDefinition>>timeStamp: aTimestamp  [

	self annotationNamed: self class timeStampKey put: aTimestamp 
]
