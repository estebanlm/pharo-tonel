"
Cleanup working copies
"
Class {
	#name : #GoferCleanup,
	#superclass : #GoferWorking,
	#category : #Gofer-Core,
	#timestamp : 'TorstenBergmann 2/5/2014 09:34'
}

{
	#category : #cleaning,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferCleanup>>cleanup: aWorkingCopy [
	self cleanupCategories: aWorkingCopy.
	self cleanupProtocols: aWorkingCopy
]

{
	#category : #cleaning,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferCleanup>>cleanupCategories: aWorkingCopy [
	aWorkingCopy packageSet systemCategories do: [ :category |
		(Smalltalk organization classesInCategory: category) isEmpty
			ifTrue: [ Smalltalk organization removeSystemCategory: category ] ]
]

{
	#category : #cleaning,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferCleanup>>cleanupProtocols: aWorkingCopy [
	aWorkingCopy packageSet extensionClasses do: [ :class |
		(aWorkingCopy packageSet extensionCategoriesForClass: class) do: [ :category |
			(class organization listAtCategoryNamed: category) isEmpty
				ifTrue: [ class organization removeCategory: category ] ] ].
	aWorkingCopy packageSet classesAndMetaClasses do: [ :class |
		(aWorkingCopy packageSet coreCategoriesForClass: class) do: [ :category |
			(class organization listAtCategoryNamed: category) isEmpty
				ifTrue: [ class organization removeCategory: category ] ] ]
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 07:16:48'
}
GoferCleanup>>execute [
	self workingCopies
		do: [ :each | self cleanup: each ]
]
