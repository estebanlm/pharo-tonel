"
I represent a tree column. I am used to specify how to render nodes, as well as the header title, icon , action on click and properties (resizable, initial width)
"
Class {
	#name : #TreeColumnModel,
	#superclass : #AbstractWidgetModel,
	#instVars : [
		'container',
		'displayBlock',
		'initialWidth',
		'resizable',
		'headerLabel',
		'headerFont',
		'headerIcon',
		'headerAction'
	],
	#category : #Spec-Core-Widgets,
	#timestamp : '<historical>'
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeColumnModel class>>adapterName [

	^ #TreeColumnAdapter
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeColumnModel class>>defaultSpec [
	<spec: #default>
	
	^ #(TreeColumnAdapter
		adapt: #(model))
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeColumnModel>>container [

	^ container value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeColumnModel>>container: aTreeModel [

	container value: aTreeModel
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeColumnModel>>displayBlock [

	^ displayBlock value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeColumnModel>>displayBlock: aBlock [

	displayBlock value: aBlock
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeColumnModel>>headerAction [

	^ headerAction value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeColumnModel>>headerAction: aBlock [

	headerAction value: aBlock
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeColumnModel>>headerFont [

	^ headerFont value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeColumnModel>>headerFont: aFont [

	headerFont value: aFont
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeColumnModel>>headerIcon [

	^ headerIcon value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeColumnModel>>headerIcon: anIcon [

	headerIcon value: anIcon
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeColumnModel>>headerLabel [

	^ headerLabel value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeColumnModel>>headerLabel: aString [

	headerLabel value: aString
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeColumnModel>>initialWidth [

	^ initialWidth value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeColumnModel>>initialWidth: anInteger [

	initialWidth value: anInteger
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeColumnModel>>initialize [

	super initialize.

	container := nil asValueHolder.
	displayBlock := [ :node | node printString ] asValueHolder.
	initialWidth := 100 asValueHolder.
	resizable := true asValueHolder.
	headerLabel := nil asValueHolder.
	headerFont := StandardFonts defaultFont asValueHolder.
	headerIcon := nil asValueHolder.
	headerAction := nil asValueHolder.
	
	self registerEvents
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeColumnModel>>registerEvents [

	displayBlock whenChangedDo: [ self changed: #displayBlockChanged ].
	resizable whenChangedDo: [ self changed: #resizableChanged ].
	headerLabel whenChangedDo: [ self changed: #headerLabelChanged ].
	headerFont whenChangedDo: [ self changed: #headerFontChanged ].
	headerIcon whenChangedDo: [ self changed: #headerIconChanged ]
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeColumnModel>>resizable [

	^ resizable value
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 05:26:18'
}
TreeColumnModel>>resizable: aBoolean [

	resizable value: aBoolean
]
