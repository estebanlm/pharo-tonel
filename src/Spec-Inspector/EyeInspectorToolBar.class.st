"
Toolbar to explore previous or next inpected elements
"
Class {
	#name : #EyeInspectorToolBar,
	#superclass : #ComposableModel,
	#instVars : [
		'previousButton',
		'nextButton',
		'inspectorChoice',
		'isUpdating'
	],
	#category : #Spec-Inspector,
	#timestamp : '<historical>'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeInspectorToolBar class>>defaultSpec [
	<spec>
	^ SpecLayout composed
		newRow: [ :r | 
			r
				add: #previousButton width: 24;
				add: #nextButton width: 28;
				add: #inspectorChoice
		];
	yourself.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeInspectorToolBar>>history [
	^ self inspectorWrapper history
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeInspectorToolBar>>initialize [
	isUpdating := false.
	super initialize.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeInspectorToolBar>>initializeWidgets [
	" nothing to do"
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeInspectorToolBar>>inspectorChoice [
	inspectorChoice
		ifNil: [ 
			inspectorChoice := self instantiate: DropListModel.
			inspectorChoice
				whenSelectedItemChanged: [ :inspectorType |
					self preventUpdatesDuring: [
						self inspectorType: inspectorType ]]].
	^ inspectorChoice
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeInspectorToolBar>>inspectorType [
	^ self inspectorWrapper inspectorType
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeInspectorToolBar>>inspectorType: anInspectorClass [
	^ self inspectorWrapper inspectorType: anInspectorClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeInspectorToolBar>>inspectorTypes [
	^ self inspectorWrapper inspectorTypes
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeInspectorToolBar>>inspectorWrapper [
	^ self owner
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeInspectorToolBar>>nextButton [
	nextButton
		ifNil: [ 
			nextButton := self instantiate: ButtonModel.
			nextButton 
				label: '>';
				action: [ 
					self inspectorWrapper inspectNext.
					self update. ]].
	^ nextButton
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeInspectorToolBar>>preventUpdatesDuring: aBlock [
	"Used to prevent back-firing when the toolbar is update from the outside"
	isUpdating ifTrue: [ 
		^ self ].
	isUpdating := true.
	aBlock ensure: [ isUpdating := false ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeInspectorToolBar>>previousButton [
	previousButton
		ifNil: [ 
			previousButton := self instantiate: ButtonModel.
			previousButton label: '<'.
			previousButton
				action: [ 
					self inspectorWrapper inspectPrevious.
					self update. ] ].
	^ previousButton
]

{
	#category : #event-handling,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeInspectorToolBar>>update [
	self preventUpdatesDuring: [ 
		self updateInspectorChoice.
		self updateInspectorType.
		self previousButton enabled: self history hasPrevious.
		self nextButton enabled: self history hasNext ]
]

{
	#category : #event-handling,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeInspectorToolBar>>updateInspectorChoice [
	self inspectorTypes
		ifNotNil: [ :variants | 
			self inspectorChoice listItems = variants
				ifTrue: [  ^ self ].
			self inspectorChoice
				items: variants;
				displayBlock: [ :label | label ]]
]

{
	#category : #event-handling,
	#timestamp : ' 8/31/2017 05:26:18'
}
EyeInspectorToolBar>>updateInspectorType [
	
	
	self inspectorType
		ifNotNil: [ :inspectorClass | 
			self inspectorChoice selectedItem = inspectorClass
				ifTrue: [  ^ self ].
			self inspectorChoice setSelectedItem: inspectorClass ].
]
