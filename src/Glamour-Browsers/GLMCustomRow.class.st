"

"
Class {
	#name : #GLMCustomRow,
	#superclass : #GLMCustomCell,
	#category : #Glamour-Browsers-Tabulator,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCustomRow>>addColumn: aBlockOrSymbol  [
	 
	| newColumn cell | 
	cell := aBlockOrSymbol isSymbol 
		ifTrue: 
			[self browser 
				addNewPaneNamed: aBlockOrSymbol. 
			(GLMCustomColumn new) 
				id: aBlockOrSymbol; 
				browser: self browser] 
		ifFalse: 
			[newColumn := GLMCustomColumn new browser: self browser. 
			aBlockOrSymbol value: newColumn. 
			newColumn]. 
	self children addLast: cell. 
	^cell
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCustomRow>>addColumn: aBlockOrSymbol size: anInteger  [
	 
	^(self addColumn: aBlockOrSymbol) size: anInteger; span: 0
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCustomRow>>addColumn: aBlockOrSymbol span: anInteger  [
	 
	^(self addColumn: aBlockOrSymbol) span: anInteger; size: 0
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCustomRow>>column: aBlockOrSymbol  [
	 
	^self addColumn: aBlockOrSymbol
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCustomRow>>column: aBlockOrSymbol size: anInteger  [
	 
	^self addColumn: aBlockOrSymbol size: anInteger
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCustomRow>>column: aBlockOrSymbol span: anInteger  [
	 
	^self addColumn: aBlockOrSymbol span: anInteger
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCustomRow>>isRow  [
	 
	^true
]
