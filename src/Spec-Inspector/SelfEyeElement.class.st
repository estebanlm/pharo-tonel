"
I am an eye element for self
"
Class {
	#name : #SelfEyeElement,
	#superclass : #AbstractEyeElement,
	#category : #Spec-Inspector-Element,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SelfEyeElement>>accessorCode [
	^ self label
]

{
	#category : #action,
	#timestamp : ' 8/31/2017 05:26:18'
}
SelfEyeElement>>browseClassRefs [

	self hostClass isTrait 
		ifTrue: [self systemNavigation browseAllUsersOfTrait: self hostClass]
		ifFalse: [self systemNavigation browseAllCallsOnClass: self hostClass]
]

{
	#category : #action,
	#timestamp : ' 8/31/2017 05:26:18'
}
SelfEyeElement>>browseInstClassVariables [

	^ self systemNavigation browseClassVariables: self hostClass
]

{
	#category : #action,
	#timestamp : ' 8/31/2017 05:26:18'
}
SelfEyeElement>>browseInstVarDefs [

	^ self systemNavigation browseInstVarDefs: self hostClass
]

{
	#category : #action,
	#timestamp : ' 8/31/2017 05:26:18'
}
SelfEyeElement>>browseInstVarRefs [

	^ self systemNavigation browseInstVarRefs: self hostClass
]

{
	#category : #action,
	#timestamp : ' 8/31/2017 05:26:18'
}
SelfEyeElement>>classVarRefs [

	^ self systemNavigation browseClassVarRefs: self hostClass
]

{
	#category : #menu,
	#timestamp : ' 8/31/2017 05:26:18'
}
SelfEyeElement>>customSubMenu: aMenu [
	"Subclasse may add more menu items here"

	aMenu addGroup: [ :aGroup |
		aGroup addItem: [ :anItem |
			anItem name: 'Inst var refs...';
			action: [ self browseInstVarRefs ] ].
		aGroup addItem: [ :anItem |
			anItem name: 'Inst var defs...';
			action: [ self browseInstVarDefs ] ].
		aGroup addItem: [ :anItem |
			anItem name: 'Class var refs...';
			action: [ self classVarRefs ] ].
		aGroup addItem: [ :anItem |
			anItem name: 'Class variables';
			action: [ self browseInstClassVariables ] ].
		aGroup addItem: [ :anItem |
			anItem name: 'Class refs';
			action: [ self browseClassRefs ] ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SelfEyeElement>>label [
	^ 'self'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SelfEyeElement>>shouldShowInTree [
	^ false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
SelfEyeElement>>value [
	^ host
]
