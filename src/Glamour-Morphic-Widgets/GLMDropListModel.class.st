"

"
Class {
	#name : #GLMDropListModel,
	#superclass : #Object,
	#instVars : [
		'list',
		'selectionIndex',
		'announcer',
		'glamourPresentation'
	],
	#category : #Glamour-Morphic-Widgets,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMDropListModel>>announcer [
	^ announcer ifNil: [announcer := GLMAnnouncer new]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMDropListModel>>glamourPresentation [

	^glamourPresentation
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMDropListModel>>glamourPresentation: anObject [
	glamourPresentation := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMDropListModel>>list [

	^list ifNil: [ list:= (self glamourPresentation displayValue 
									collect:[ :each| (self glamourPresentation formatedDisplayValueOf: each) asMorph ])]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMDropListModel>>list: anObject [
	list := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMDropListModel>>resetData [

	list := nil.
	selectionIndex := nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMDropListModel>>selectedItem [
	"Answer the currently selected item or nil if none."

	^self selectionIndex = 0
		ifTrue: [nil]
		ifFalse: [self glamourPresentation displayValue at: self selectionIndex]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMDropListModel>>selectionIndex [

	^ selectionIndex ifNil:[ selectionIndex:= self glamourPresentation selectedIndex ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMDropListModel>>selectionIndex: anObject [
	selectionIndex := anObject.
	self announcer announce: (
			GLMDropDownListMorphSelectionChanged new 
				selectionValue: self selectedItem;
				selectionIndex: selectionIndex;
				yourself)
]
