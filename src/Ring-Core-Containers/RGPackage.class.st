"
RGPackage is the representation for packages.
A package manages classes, methods and children packages as elements.
A package can also know in which package is defined

"
Class {
	#name : #RGPackage,
	#superclass : #RGContainer,
	#instVars : [
		'package'
	],
	#category : #Ring-Core-Containers,
	#timestamp : 'VeronicaUquillas 4/20/2011 17:18'
}

{
	#category : #adding/removing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGPackage>>addElement: aRGDefinition in: aCollection [

	aRGDefinition package: self.
	super addElement: aRGDefinition in: aCollection.
]

{
	#category : #'managing container',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGPackage>>addInContainer: anRGContainer [

	anRGContainer addPackage: self
]

{
	#category : #adding/removing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGPackage>>addMethod: aRGMethodDefinition [
	"aRGMethodDefinition needs to satisfy the status isMethod"

	aRGMethodDefinition isMethod ifFalse:[ ^self ].
	aRGMethodDefinition package: self.	"Needed to evaluate #isExtension if it was not set in advance"
	self 
		addElement: aRGMethodDefinition 
		in: (aRGMethodDefinition isExtension 
			ifTrue: [ self extensionMethods ]
			ifFalse:[ super methods ])
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGPackage>>categories [
	"Retrieves class categories of the receiver"
	
	^self elements at: #categories
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGPackage>>categories: aCollection [
	"Set the class categories collection"
	
	self elements at: #categories put: (aCollection asOrderedCollection)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGPackage>>classNames [

	^ self classes isDictionary
		ifTrue: [ self classes keys ]
		ifFalse:[ self classes collect:[ :class|  class name ] ]	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGPackage>>classes [
	"Retrieves a collection (by default a dictionary) of classes defined in the receiver and classes holding extension methods"
	
	^self definedClasses, self extendedClasses 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGPackage>>definedClassNames [

	^ super classNames
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGPackage>>definedTraits [
	"Retrieves the traits defined in the receiver"

	^self traits
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGPackage>>definesClass: aRGBehaviorDefinition [
	"Returns true if the receiver includes aRGBehaviorDefinition in the defined classes"

	^ self includesClass: aRGBehaviorDefinition
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGPackage>>definesOrExtendsClass: aRGBehaviorDefinition [
	"Returns true whether the class, aRGBehaviorDefinition, is one locally defined classes of the receiver or 
	if the receiver extends such class (that is defined in another package)"
	
	^ (self definesClass: aRGBehaviorDefinition) or:[ self extendsClass: aRGBehaviorDefinition ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGPackage>>extendedClassNames [

	^ self extendedClasses isDictionary
		ifTrue: [ self extendedClasses keys ]
		ifFalse:[ self extendedClasses collect:[ :each| each name ]]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGPackage>>extendedClasses [
	"Retrieves the classes holding the extension methods and returns a dictionary as well"
	|  classesOfExt |
	classesOfExt := Dictionary new.
	
	self extensionMethods
		do:[ :mth| (classesOfExt includesKey: mth parentName)
					ifFalse:[ classesOfExt at: mth parentName put: mth parent ] ].
	
	^classesOfExt
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGPackage>>extendedSelectors [
	"Retrieves the names of the methods"
	
	^ self extensionMethods keys
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGPackage>>extendsClass: aRGBehaviorDefinition [
	"Returns true if the receiver extends aRGBehaviorDefinition (that is defined in another package)"
	
	^ self extendedClasses includes: aRGBehaviorDefinition
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGPackage>>extensionMethods [
	"Retrieves extension methods"
	
	^self elements at: #extensionMethods
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGPackage>>extensionMethods: aCollection [
	"Set the extension methods collection"
	
	self elements at: #extensionMethods put: aCollection
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGPackage>>initialize [

	super initialize.
	self withoutPackages.	"By default the receiver has no child packages"
	self extensionMethods: IdentityDictionary new.		
	self categories: OrderedCollection new.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGPackage>>isPackage [

	^true
]

{
	#category : #lookup,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGPackage>>lookupClassNamed: className [
	"Look for the class named className in the receiver's defined classes or in any of its package children"
	| class |
	
	class:= self classNamed: className.
	class ifNotNil:[ ^class ].
	
	self packages
		do:[ :each| class:= each lookupClassNamed: className.
				    class ifNotNil:[ ^class ] ].
	^nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGPackage>>methods [
	"Retrieves all the methods defined in the receiver. 
	#methods holds the methods of defined classes"
	
	^super methods, self extensionMethods 
]

{
	#category : #metrics,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGPackage>>numberOfLinesOfCode [
	
	^ self 
		annotationNamed: #numberOfLinesOfCode
		ifAbsentPut: [
			| number |
			number := self classes inject: 0 into: [ :sum :each | sum + each numberOfLinesOfCode + each theMetaClass numberOfLinesOfCode ].
			number := self methods inject: number into: [ :sum :each | sum + each numberOfLinesOfCode ].
			number ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGPackage>>package [
	"Retrieves the  package in which self is contained"

	^package
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGPackage>>package: aRGPackage [
	"Sets the outer package of the receiver if exists"

	package:= aRGPackage
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGPackage>>parent [
	"Retrieves the environment linked to this package"
	
	^self environment
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGPackage>>printOn: aStream [
	aStream
		nextPutAll: self class name;
		nextPutAll: '(';
		nextPutAll: self name;
		nextPutAll: ')'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGPackage>>realPackage [

	^ RPackageOrganizer default packageNamed: self name
]

{
	#category : #adding/removing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGPackage>>removeMethod: aRGMethodDefinition [

	self 
		removeElement: aRGMethodDefinition 
		from: (aRGMethodDefinition isExtension 
				ifTrue: [ self extensionMethods ]
				ifFalse:[ super methods ])
]

{
	#category : #adding/removing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGPackage>>withoutCategories [

	self removeElementsCategorized: #categories
]
