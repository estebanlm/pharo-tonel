Extension { #name : #Morph }

{ #category : #'*Keymapping-Core' }
Morph >> allowsKeymapping [

	^ self valueOfProperty: #allowsKeymapping ifAbsent: [ true]
]

{ #category : #'*Keymapping-Core' }
Morph >> allowsKeymapping: aBoolean [

	^ self setProperty: #allowsKeymapping toValue: aBoolean
]

{ #category : #'*Keymapping-Core' }
Morph >> attachKeymapCategory: aCategory [
	self kmDispatcher attachCategory: aCategory.
]

{ #category : #'*Keymapping-Core' }
Morph >> attachKeymapCategory: aCategoryName onProperty: aProperty [
	self kmDispatcher attachCategory: aCategoryName onProperty: aProperty
]

{ #category : #'*Keymapping-Core' }
Morph >> attachKeymapCategory: aCategoryName targetting: anObject [
	self kmDispatcher attachCategory: aCategoryName targetting: anObject
]

{ #category : #'*Keymapping-Core' }
Morph >> bindKeyCombination: aShortcut toAction: anAction [
	self kmDispatcher bindKeyCombination: aShortcut asKeyCombination toAction: anAction
]

{ #category : #'*Keymapping-Core' }
Morph >> detachAllKeymapCategories [

	self kmDispatcher detachAllKeymapCategories
]

{ #category : #'*Keymapping-Core' }
Morph >> detachKeymapCategory: aCategoryName [

	self kmDispatcher detachKeymapCategory: aCategoryName.
]

{ #category : #'*Keymapping-Core' }
Morph >> detachKeymapCategory: aCategoryName targetting: anObject [

	self kmDispatcher detachKeymapCategory: aCategoryName targetting: anObject
]

{ #category : #'*Keymapping-Core' }
Morph >> dispatchKeystrokeForEvent: evt [ 
	self kmDispatcher dispatchKeystroke: evt 

]

{ #category : #'*Keymapping-Core' }
Morph >> handleKeystrokeWithKeymappings: aKeystrokeEvent [

	self allowsKeymapping ifTrue: [
		self dispatchKeystrokeForEvent: aKeystrokeEvent.
	].
]

{ #category : #'*Keymapping-Core' }
Morph >> hasKeymapCategoryNamed: aString [

	^ self kmDispatcher targets anySatisfy: [ :e | e category name = aString ].
]

{ #category : #'*Keymapping-Core' }
Morph >> initializeShortcuts: aKMDispatcher [
	"Where we may attach keymaps or even on:do: local shortcuts if needed."

	aKMDispatcher attachCategory: #MorphFocusCtrlNavigation
]

{ #category : #'*Keymapping-Core' }
Morph >> kmDispatcher [
	"When creating the KMDispatcher instance, load default shortcuts."

	^ self
		valueOfProperty: #kmDispatcher
		ifAbsentPut: [ 
			| kmd |
			kmd := KMDispatcher target: self.
			self initializeShortcuts: kmd.
			kmd ]
]

{ #category : #'*Keymapping-Core' }
Morph >> on: aShortcut do: anAction [
	
	^ self bindKeyCombination: aShortcut toAction: anAction 
]

{ #category : #'*Keymapping-Core' }
Morph >> removeKeyCombination: aShortcut [

	self kmDispatcher removeKeyCombination: aShortcut
]
