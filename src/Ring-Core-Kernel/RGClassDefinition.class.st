"
RGClassDefinition is the concrete representation of a class (no trait)
"
Class {
	#name : #RGClassDefinition,
	#superclass : #RGClassDescriptionDefinition,
	#instVars : [
		'metaClass',
		'comment',
		'classVariables',
		'category',
		'package',
		'sharedPools'
	],
	#category : #Ring-Core-Kernel,
	#timestamp : 'VeronicaUquillas 4/19/2011 16:01'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGClassDefinition class>>createSharedPoolNamed: aSymbol [
	"A shared pool is a class inheriting from #SharedPool"

	^(RGClassDefinition named: aSymbol)
			superclassName: #SharedPool;
			isPool: true;
			yourself
]

{
	#category : #'class variables',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGClassDefinition>>addClassVarNamed: aString [
	| var |
	var := (RGClassVariableDefinition named: aString) parent: self.
	self addVariable: var in: classVariables.
	^var
]

{
	#category : #'class variables',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGClassDefinition>>addClassVariable: aRCClassVariable [

	self addVariable: (aRCClassVariable parent: self) 
		in: classVariables
]

{
	#category : #'class variables',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGClassDefinition>>addClassVariables: aCollection [
	
	aCollection do: [:var | self addClassVarNamed: var ]
]

{
	#category : #'shared pools',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGClassDefinition>>addSharedPool: aRGPoolVariableDefinition [
	self 
		addVariable: (aRGPoolVariableDefinition parent: self) 
		in: sharedPools
]

{
	#category : #'shared pools',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGClassDefinition>>addSharedPoolNamed: poolName [
	| pool |
	pool:= (RGPoolVariableDefinition named:  poolName) parent: self.
	self addVariable: pool in: sharedPools.
	^pool
]

{
	#category : #'shared pools',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGClassDefinition>>addSharedPools: aCollection [
	aCollection do: [ :pool | self addSharedPoolNamed: pool ]
]

{
	#category : #'managing pool users',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGClassDefinition>>addUser: aRGClassDefinition [
	"The receiver registers the aRGClassDefinition as an user.  An reinforces its status as a shared pool."
	
	aRGClassDefinition isClass ifFalse:[ ^self ].
	(aRGClassDefinition theNonMetaClass sharedPoolNamed: self name) isNil
		ifTrue: [ aRGClassDefinition theNonMetaClass addSharedPoolNamed: self name ].
	self isPool: true.
	self users add: aRGClassDefinition theNonMetaClass
]

{
	#category : #'class variables',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGClassDefinition>>allClassVarNames [

	^self allClassVariables collect:[ :cvar| cvar name ]
]

{
	#category : #'class variables',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGClassDefinition>>allClassVariables [
	"Answer a collection of the receiver's classVariables, including those defined its superclasses"

	^self hasSuperclass 
		ifFalse:[ classVariables ]
		ifTrue:[ self superclass allClassVariables, classVariables ]
]

{
	#category : #'shared pools',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGClassDefinition>>allSharedPoolNames [
	^ self allSharedPools collect: [ :pool | pool name ]
]

{
	#category : #'shared pools',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGClassDefinition>>allSharedPools [
	"Answer a collection of the pools the receiver shares, including those defined  
	in the superclasses of the receiver."

	^ self hasSuperclass
		ifFalse: [ sharedPools ]
		ifTrue: [ self superclass allSharedPools , sharedPools ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGClassDefinition>>category [
	"retrieves a tag for its package"
	
	^category
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGClassDefinition>>category: aSymbol [
	"stores a tag for its package"

	category := aSymbol
]

{
	#category : #'class variables',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGClassDefinition>>classVarNamed: aString [

	^classVariables detect:[ :v| v name = aString asSymbol ] ifNone:[ nil ]
]

{
	#category : #'class variables',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGClassDefinition>>classVarNames [
	"Answer a collection of the names of the class variables defined in the receiver."
	
	^classVariables collect:[ :cvar| cvar name ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGClassDefinition>>classVariables [

	^classVariables
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGClassDefinition>>classVariables: aCollection [

	classVariables:= aCollection
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGClassDefinition>>comment [
	"Retrieves the comment definition object"

	^comment
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGClassDefinition>>comment: anObject [
	"Sets a RGCommentDefinition object based on the argument"
	
	comment := anObject isRingObject 
		ifFalse: [ 
			RGCommentDefinition new
				parent: self;
				content: anObject; 
				yourself ]
		ifTrue: [anObject ]
	
	 
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGClassDefinition>>hasComment [

	^comment isEmptyOrNil not
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGClassDefinition>>hasMetaclass [

	^metaClass notNil
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGClassDefinition>>hasStamp [

	^self stamp isEmptyOrNil not
]

{
	#category : #'managing pool users',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGClassDefinition>>includesUser: aRGBehaviorDefinition [

	^self users includes: aRGBehaviorDefinition
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGClassDefinition>>initialize [

	super initialize.
	classVariables:= OrderedCollection new.
	sharedPools:= OrderedCollection new.
]

{
	#category : #'managing pool users',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGClassDefinition>>isPool [
	"The receiver is a shared pool if it inherits from SharedPool"
	
	^self annotationNamed: self class isPoolKey 
		ifAbsent: [ self superclassName == #SharedPool ]
]

{
	#category : #'managing pool users',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGClassDefinition>>isPool: aBoolean [
	
	^self annotationNamed: self class isPoolKey put: aBoolean
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGClassDefinition>>isSameRevisionAs: aRGClassDefinition [
	"This method look for equality of the properties of the receiver"

	^(super isSameRevisionAs: aRGClassDefinition)
		and:[ self superclassName == aRGClassDefinition superclassName
		and:[ self category = aRGClassDefinition category 
		and:[ self classVarNames sorted = aRGClassDefinition classVarNames sorted 
		and:[ self sharedPoolNames sorted = aRGClassDefinition sharedPoolNames sorted  
		and:[ self traitCompositionSource = aRGClassDefinition traitCompositionSource 
		and:[ ((self hasComment and:[ self comment isSameRevisionAs: aRGClassDefinition comment ]) or:[ self hasComment not ])
		and:[ (self theMetaClass isSameRevisionAs: aRGClassDefinition theMetaClass) ] ] ] ] ] ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGClassDefinition>>package [
	"Retrieves the package in which this class is contained, if exists"
	
	^package
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGClassDefinition>>package: aRGPackage [
	"Sets the package in which this class is contained"
	
	package:= aRGPackage
]

{
	#category : #'class variables',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGClassDefinition>>removeClassVarNamed: aString [

	self removeVariable: (self classVarNamed: aString) from: classVariables
]

{
	#category : #'class variables',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGClassDefinition>>removeClassVariable: aRGClassVariableDefinition [

	self removeVariable: aRGClassVariableDefinition from: classVariables
]

{
	#category : #'shared pools',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGClassDefinition>>removeSharedPool: aRGPoolVariableDefinition [

	self removeVariable: aRGPoolVariableDefinition from: sharedPools
]

{
	#category : #'shared pools',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGClassDefinition>>removeSharedPoolNamed: poolName [

	self removeVariable: (self sharedPoolNamed: poolName) from: sharedPools
]

{
	#category : #'managing pool users',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGClassDefinition>>removeUser: aRGClassDefinition [
	"Removes this RGClassDefinition from the users of the receiver"
	
	aRGClassDefinition isClass ifFalse:[ ^self ].
	aRGClassDefinition theNonMetaClass removeSharedPoolNamed: self name.
	self users remove: aRGClassDefinition theNonMetaClass ifAbsent:[ ]
]

{
	#category : #'shared pools',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGClassDefinition>>sharedPoolNamed: poolName [

	^sharedPools detect:[ :v| v name = poolName asSymbol ] ifNone:[ nil ]
]

{
	#category : #'shared pools',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGClassDefinition>>sharedPoolNames [
	
	^sharedPools collect:[ :pool| pool name ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGClassDefinition>>sharedPools [
	"Keeps the pool variable relationship of the receiver"

	^ sharedPools
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGClassDefinition>>sharedPools: aCollection [
	sharedPools := aCollection
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGClassDefinition>>stamp [

	^self hasComment ifTrue:[ self comment stamp ] ifFalse:[ nil ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGClassDefinition>>stamp: aString [

	self hasComment
	ifTrue: [ self comment stamp: aString ]
	ifFalse:[ RGCommentDefinition new
						 parent: self; 
						 stamp: aString ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGClassDefinition>>theMetaClass [
	
	^metaClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGClassDefinition>>theNonMetaClass [

	^self
]

{
	#category : #'managing pool users',
	#timestamp : ' 8/31/2017 07:17:01'
}
RGClassDefinition>>users [
	"If the reciever is a SharedPool then retrieves its users"
	
	^self isPool
		ifTrue: [ self annotationNamed: self class usersKey ifAbsentPut: [ OrderedCollection new ] ]
		ifFalse:[ #() ]
]

{
	#category : #behavior,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGClassDefinition>>withMetaclass [
	"Registers explicitly the metaclass of a class"

	metaClass:= RGMetaclassDefinition class: self

]

{
	#category : #behavior,
	#timestamp : ' 8/31/2017 07:17:01'
}
RGClassDefinition>>withMetaclass: aRGMetaclassDefinition [
	"Registers explicitly the metaclass of a class"

	metaClass:= aRGMetaclassDefinition.
	metaClass baseClass: self.  

]
