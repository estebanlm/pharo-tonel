"

"
Class {
	#name : #GLMExpanderLabelNodeModel,
	#superclass : #MorphTreeNodeModel,
	#instVars : [
		'containerTree'
	],
	#category : #Glamour-Morphic-Widgets,
	#timestamp : ''
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMExpanderLabelNodeModel class>>with: anObject in: aTreeModel [
	^ (self with: anObject) containerTree: aTreeModel; yourself
]

{
	#category : #callbacks,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMExpanderLabelNodeModel>>childrenItems [
	^ OrderedCollection 
		with: ((GLMExpanderContentsNodeModel with: (self->self item)) containerNode: self)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMExpanderLabelNodeModel>>containerTree [
	^ containerTree
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMExpanderLabelNodeModel>>containerTree: anObject [
	containerTree := anObject
]

{
	#category : #callbacks,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMExpanderLabelNodeModel>>contents [
	^ self childrenItems
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMExpanderLabelNodeModel>>displayText [
	^ UITheme current 
		newTextIn: World
		text: (self item presentations titleValue ifNil: ['noname']) 
]

{
	#category : #callbacks,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMExpanderLabelNodeModel>>elementColumn [
	| row tags tagsFilter |
	row := OrderedCollection with: (self displayText).
	
"	tags:= self containerTree glamourPresentation tagsFor: self item to: #show.
	tagsFilter := self containerTree glamourPresentation tagsFor: self item to: #filter.
	tags withIndexDo:[ :each :index | 
			row addLast: (self buttonForTag: each 
									  filter: (tagsFilter at: index ifAbsentPut:[ each ])) ].
"	^ (UITheme current newRowIn: World for: row) fillStyle: Color veryLightGray
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMExpanderLabelNodeModel>>icon [
	^ nil
]
