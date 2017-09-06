"

"
Class {
	#name : #GLMCustomColumn,
	#superclass : #GLMCustomCell,
	#category : #Glamour-Browsers-Tabulator,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCustomColumn>>addRow: aBlockOrSymbol  [
	 
	| newRow cell | 
	cell := aBlockOrSymbol isSymbol 
		ifTrue: 
			[self browser 
				addNewPaneNamed: aBlockOrSymbol. 
			(GLMCustomRow new) 
				id: aBlockOrSymbol; 
				browser: self browser] 
		ifFalse: 
			[newRow := GLMCustomRow new browser: self browser. 
			aBlockOrSymbol value: newRow. 
			newRow]. 
	self children addLast: cell. 
	^cell
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCustomColumn>>addRow: aBlockOrSymbol size: anInteger  [
	 
	^(self addRow: aBlockOrSymbol) size: anInteger; span: 0
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCustomColumn>>addRow: aBlockOrSymbol span: anInteger  [
	 
	^(self addRow: aBlockOrSymbol) span: anInteger; size: 0
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCustomColumn>>isColumn  [
	 
	^true
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCustomColumn>>row: aBlockOrSymbol  [
	 
	^self addRow: aBlockOrSymbol
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCustomColumn>>row: aBlockOrSymbol size: anInteger  [
	 
	^self addRow: aBlockOrSymbol size: anInteger
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMCustomColumn>>row: aBlockOrSymbol span: anInteger  [
	 
	^self addRow: aBlockOrSymbol span: anInteger
]
