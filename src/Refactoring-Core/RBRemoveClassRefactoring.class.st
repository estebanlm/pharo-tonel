"
I am a refactoring for removing classes. 

My precondition verifies that the class name exists in this namespace and the class has no references, resp. users, if this is used to remove a trait.

If this class is ""empty"" (has no methods and no variables), any subclass is reparented to the superclass of this class. It is not allowed to remove non-empty classes when it has subclasses.
"
Class {
	#name : #RBRemoveClassRefactoring,
	#superclass : #RBRefactoring,
	#instVars : [
		'classNames'
	],
	#category : #Refactoring-Core-Refactorings,
	#timestamp : 'NicolaiHess 8/6/2016 12:33'
}

{
	#category : #'error messages',
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRemoveClassRefactoring class>>cannotRemoveTopLevelClassErrorMesssage [
	^ 'Cannot remove top level class', Character cr asString ,'when it has subclasses'
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRemoveClassRefactoring class>>classNames: aClassNameCollection  [
	^self new classNames: aClassNameCollection
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRemoveClassRefactoring class>>model: aRBSmalltalk classNames: aClassNameCollection  [
	^(self new)
		model: aRBSmalltalk;
		classNames: aClassNameCollection;
		yourself
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRemoveClassRefactoring>>classNames: aClassNameCollection  [
	classNames := aClassNameCollection
]

{
	#category : #preconditions,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRemoveClassRefactoring>>environmentWithReferencesTo: aClass [
	^ RBBrowserEnvironment new 
		referencesTo: (Smalltalk globals 
			associationAt: aClass 
			ifAbsent: [ aClass ])
]

{
	#category : #preconditions,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRemoveClassRefactoring>>environmentWithUsersOf: aTrait [
	^ RBClassEnvironment 
		onEnvironment: RBBrowserEnvironment new
		classes: aTrait realClass users
]

{
	#category : #preconditions,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRemoveClassRefactoring>>preconditionEmptyOrHasNoSubclasses: aClass [
	^ (RBCondition hasSubclasses: aClass) not
		|
			((RBCondition isEmptyClass: aClass)
				&
					((RBCondition withBlock: [ aClass superclass notNil ])
						errorMacro: 'Cannot remove top level class<n>when it has subclasses';
						yourself))
]

{
	#category : #preconditions,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRemoveClassRefactoring>>preconditionHasNoReferences: aClass [

	| env |
	
	env := self environmentWithReferencesTo: aClass.
	^ (RBCondition withBlock: [ env isEmpty ])
		errorMacro: aClass , ' is referenced.<n>Browse references?';
		errorBlock: [ self openBrowserOn: (env) ];
		yourself
]

{
	#category : #preconditions,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRemoveClassRefactoring>>preconditionHasNoUsers: aClassOrTrait [
	^ (RBCondition withBlock: [ aClassOrTrait realClass users isEmpty ])
		errorMacro: aClassOrTrait name , ' Trait is used.<n>Browse classes using it?';
		errorBlock: [ self openBrowserOn: (self environmentWithUsersOf: aClassOrTrait) ];
		yourself
]

{
	#category : #preconditions,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRemoveClassRefactoring>>preconditionIsNotMetaclass: aClass [
	^ ((RBCondition isMetaclass: aClass) errorMacro: 'Cannot remove just the metaclass') not
]

{
	#category : #preconditions,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRemoveClassRefactoring>>preconditions [
	^ classNames
		inject: RBCondition empty
		into: [ :sum :each | 
			| aClassOrTrait |
			aClassOrTrait := self model classNamed: each asSymbol.
			aClassOrTrait isNil
				ifTrue: [ self refactoringFailure: 'No such class or trait' ].
			sum
				& ( (self preconditionIsNotMetaclass: aClassOrTrait) 
					& (self preconditionHasNoReferences: each)
					& (self preconditionEmptyOrHasNoSubclasses: aClassOrTrait)
					& (self preconditionHasNoUsers: aClassOrTrait ) ) ]
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRemoveClassRefactoring>>removeClasses [
	classNames do: [:each | self model removeClassNamed: each]
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRemoveClassRefactoring>>reparentSubclasses [
	classNames do: 
			[:each | 
			| class |
			class := self model classNamed: each.
			self model reparentClasses: class subclasses copy to: class superclass]
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRemoveClassRefactoring>>storeOn: aStream  [
	aStream nextPut: $(.
	self class storeOn: aStream.
	aStream nextPutAll: ' classNames: '.
	classNames asArray storeOn: aStream.
	aStream nextPut: $)
]

{
	#category : #transforming,
	#timestamp : ' 8/31/2017 05:26:24'
}
RBRemoveClassRefactoring>>transform [
	self
		reparentSubclasses;
		removeClasses
]
