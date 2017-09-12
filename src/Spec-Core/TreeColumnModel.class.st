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
	#category : #Spec-Core-Widgets
}

{ #category : #specs }
TreeColumnModel class >> adapterName [

	^ #TreeColumnAdapter
]

{ #category : #specs }
TreeColumnModel class >> defaultSpec [
	<spec: #default>
	
	^ #(TreeColumnAdapter
		adapt: #(model))
]

{ #category : #api }
TreeColumnModel >> container [

	^ container value
]

{ #category : #api }
TreeColumnModel >> container: aTreeModel [

	container value: aTreeModel
]

{ #category : #api }
TreeColumnModel >> displayBlock [

	^ displayBlock value
]

{ #category : #api }
TreeColumnModel >> displayBlock: aBlock [

	displayBlock value: aBlock
]

{ #category : #api }
TreeColumnModel >> headerAction [

	^ headerAction value
]

{ #category : #api }
TreeColumnModel >> headerAction: aBlock [

	headerAction value: aBlock
]

{ #category : #api }
TreeColumnModel >> headerFont [

	^ headerFont value
]

{ #category : #api }
TreeColumnModel >> headerFont: aFont [

	headerFont value: aFont
]

{ #category : #api }
TreeColumnModel >> headerIcon [

	^ headerIcon value
]

{ #category : #api }
TreeColumnModel >> headerIcon: anIcon [

	headerIcon value: anIcon
]

{ #category : #api }
TreeColumnModel >> headerLabel [

	^ headerLabel value
]

{ #category : #api }
TreeColumnModel >> headerLabel: aString [

	headerLabel value: aString
]

{ #category : #api }
TreeColumnModel >> initialWidth [

	^ initialWidth value
]

{ #category : #api }
TreeColumnModel >> initialWidth: anInteger [

	initialWidth value: anInteger
]

{ #category : #initialization }
TreeColumnModel >> initialize [

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

{ #category : #initialization }
TreeColumnModel >> registerEvents [

	displayBlock whenChangedDo: [ self changed: #displayBlockChanged ].
	resizable whenChangedDo: [ self changed: #resizableChanged ].
	headerLabel whenChangedDo: [ self changed: #headerLabelChanged ].
	headerFont whenChangedDo: [ self changed: #headerFontChanged ].
	headerIcon whenChangedDo: [ self changed: #headerIconChanged ]
]

{ #category : #api }
TreeColumnModel >> resizable [

	^ resizable value
]

{ #category : #api }
TreeColumnModel >> resizable: aBoolean [

	resizable value: aBoolean
]
