"
I am the adapter used to build a MenuMorph from a MenuModel
"
Class {
	#name : #MorphicMenuAdapter,
	#superclass : #AbstractMorphicAdapter,
	#category : #Spec-MorphicAdapters,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicMenuAdapter class>>adaptAsPopup: aComposableModel [
	^ self new
		adaptAsPopup: aComposableModel;
		yourself
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicMenuAdapter>>adaptAsPopup: aComposableModel [

	model := aComposableModel.
	aComposableModel addDependent: self.
	widget := self buildWidgetPopup.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicMenuAdapter>>basicMenuPopUp [

	^  MenuMorph new
		addIfNeededTitle: self title andIcon: self icon
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicMenuAdapter>>buildWidget [

	^ ToolDockingBarMorph new
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		adoptMenuModel: self model
		yourself
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicMenuAdapter>>buildWidgetPopup [
	widget := self basicMenuPopUp.
	self menuGroups
		do: [ :group | 
			| items |
			items := group buildWithSpec.
			items do: [ :item | widget addMorphBack: item ] ]
		separatedBy: [ widget addLine ].
	^ widget
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicMenuAdapter>>icon [

	^ self model icon
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicMenuAdapter>>menuGroups [
	^ self model menuGroups reject: [ :e | e isEmpty ]
]

{
	#category : #'spec protocol',
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicMenuAdapter>>openAt: aPoint  [

	self widgetDo: [ :w | w invokeAt: (aPoint + (2@7)) in: World allowKeyboard: true ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:18'
}
MorphicMenuAdapter>>title [

	^ self model title
]
