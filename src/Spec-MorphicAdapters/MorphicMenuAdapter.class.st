"
I am the adapter used to build a MenuMorph from a MenuModel
"
Class {
	#name : #MorphicMenuAdapter,
	#superclass : #AbstractMorphicAdapter,
	#category : #Spec-MorphicAdapters
}

{ #category : #'instance creation' }
MorphicMenuAdapter class >> adaptAsPopup: aComposableModel [
	^ self new
		adaptAsPopup: aComposableModel;
		yourself
]

{ #category : #initialization }
MorphicMenuAdapter >> adaptAsPopup: aComposableModel [

	model := aComposableModel.
	aComposableModel addDependent: self.
	widget := self buildWidgetPopup.
]

{ #category : #private }
MorphicMenuAdapter >> basicMenuPopUp [

	^  MenuMorph new
		addIfNeededTitle: self title andIcon: self icon
]

{ #category : #private }
MorphicMenuAdapter >> buildWidget [

	^ ToolDockingBarMorph new
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		adoptMenuModel: self model
		yourself
]

{ #category : #private }
MorphicMenuAdapter >> buildWidgetPopup [
	widget := self basicMenuPopUp.
	self menuGroups
		do: [ :group | 
			| items |
			items := group buildWithSpec.
			items do: [ :item | widget addMorphBack: item ] ]
		separatedBy: [ widget addLine ].
	^ widget
]

{ #category : #protocol }
MorphicMenuAdapter >> icon [

	^ self model icon
]

{ #category : #protocol }
MorphicMenuAdapter >> menuGroups [
	^ self model menuGroups reject: [ :e | e isEmpty ]
]

{ #category : #'spec protocol' }
MorphicMenuAdapter >> openAt: aPoint [ 

	self widgetDo: [ :w | w invokeAt: (aPoint + (2@7)) in: World allowKeyboard: true ]
]

{ #category : #protocol }
MorphicMenuAdapter >> title [

	^ self model title
]
