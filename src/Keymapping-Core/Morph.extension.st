Extension {
	#name : #Morph
}

{
	#category : #'*Keymapping-Core',
	#timestamp : ' 8/31/2017 05:26:19'
}
Morph>>allowsKeymapping [

	^ self valueOfProperty: #allowsKeymapping ifAbsent: [ true]
]

{
	#category : #'*Keymapping-Core',
	#timestamp : ' 8/31/2017 05:26:19'
}
Morph>>allowsKeymapping: aBoolean [

	^ self setProperty: #allowsKeymapping toValue: aBoolean
]

{
	#category : #'*Keymapping-Core',
	#timestamp : ' 8/31/2017 05:26:19'
}
Morph>>attachKeymapCategory: aCategory [
	self kmDispatcher attachCategory: aCategory.
]

{
	#category : #'*Keymapping-Core',
	#timestamp : ' 8/31/2017 05:26:19'
}
Morph>>attachKeymapCategory: aCategoryName onProperty: aProperty [
	self kmDispatcher attachCategory: aCategoryName onProperty: aProperty
]

{
	#category : #'*Keymapping-Core',
	#timestamp : ' 8/31/2017 05:26:19'
}
Morph>>attachKeymapCategory: aCategoryName targetting: anObject [
	self kmDispatcher attachCategory: aCategoryName targetting: anObject
]

{
	#category : #'*Keymapping-Core',
	#timestamp : ' 8/31/2017 05:26:19'
}
Morph>>bindKeyCombination: aShortcut toAction: anAction [
	self kmDispatcher bindKeyCombination: aShortcut asKeyCombination toAction: anAction
]

{
	#category : #'*Keymapping-Core',
	#timestamp : ' 8/31/2017 05:26:19'
}
Morph>>detachAllKeymapCategories [

	self kmDispatcher detachAllKeymapCategories
]

{
	#category : #'*Keymapping-Core',
	#timestamp : ' 8/31/2017 05:26:19'
}
Morph>>detachKeymapCategory: aCategoryName [

	self kmDispatcher detachKeymapCategory: aCategoryName.
]

{
	#category : #'*Keymapping-Core',
	#timestamp : ' 8/31/2017 05:26:19'
}
Morph>>detachKeymapCategory: aCategoryName targetting: anObject [

	self kmDispatcher detachKeymapCategory: aCategoryName targetting: anObject
]

{
	#category : #'*Keymapping-Core',
	#timestamp : ' 8/31/2017 05:26:19'
}
Morph>>dispatchKeystrokeForEvent: evt  [
	self kmDispatcher dispatchKeystroke: evt 

]

{
	#category : #'*Keymapping-Core',
	#timestamp : ' 8/31/2017 05:26:19'
}
Morph>>handleKeystrokeWithKeymappings: aKeystrokeEvent [

	self allowsKeymapping ifTrue: [
		self dispatchKeystrokeForEvent: aKeystrokeEvent.
	].
]

{
	#category : #'*Keymapping-Core',
	#timestamp : ' 8/31/2017 05:26:19'
}
Morph>>hasKeymapCategoryNamed: aString [

	^ self kmDispatcher targets anySatisfy: [ :e | e category name = aString ].
]

{
	#category : #'*Keymapping-Core',
	#timestamp : ' 8/31/2017 05:26:19'
}
Morph>>initializeShortcuts: aKMDispatcher [
	"Where we may attach keymaps or even on:do: local shortcuts if needed."

	aKMDispatcher attachCategory: #MorphFocusCtrlNavigation
]

{
	#category : #'*Keymapping-Core',
	#timestamp : ' 8/31/2017 05:26:19'
}
Morph>>kmDispatcher [
	"When creating the KMDispatcher instance, load default shortcuts."

	^ self
		valueOfProperty: #kmDispatcher
		ifAbsentPut: [ 
			| kmd |
			kmd := KMDispatcher target: self.
			self initializeShortcuts: kmd.
			kmd ]
]

{
	#category : #'*Keymapping-Core',
	#timestamp : ' 8/31/2017 05:26:19'
}
Morph>>on: aShortcut do: anAction [
	
	^ self bindKeyCombination: aShortcut toAction: anAction 
]

{
	#category : #'*Keymapping-Core',
	#timestamp : ' 8/31/2017 05:26:19'
}
Morph>>removeKeyCombination: aShortcut [

	self kmDispatcher removeKeyCombination: aShortcut
]
