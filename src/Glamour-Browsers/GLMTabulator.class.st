"
A GLMTabulator is an explicit browser that allows us to place panes in columns and rows.
"
Class {
	#name : #GLMTabulator,
	#superclass : #GLMExplicitBrowser,
	#instVars : [
		'cell'
	],
	#category : #Glamour-Browsers-Tabulator,
	#timestamp : '<historical>'
}

{
	#category : #layout,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTabulator>>addColumn: aBlockOrSymbol  [
	 
	^self cellOrRow addColumn: aBlockOrSymbol
]

{
	#category : #layout,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTabulator>>addColumn: aBlockOrSymbol size: anInteger  [
	 
	^(self addColumn: aBlockOrSymbol) size: anInteger; span: 0
]

{
	#category : #layout,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTabulator>>addColumn: aBlockOrSymbol span: anInteger  [
	 
	^(self addColumn: aBlockOrSymbol) span: anInteger
]

{
	#category : #layout,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTabulator>>addRow: aBlockOrSymbol  [
	 
	^self cellOrColumn addRow: aBlockOrSymbol
]

{
	#category : #layout,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTabulator>>addRow: aBlockOrSymbol size: anInteger  [
	 
	^(self addRow: aBlockOrSymbol) size: anInteger; span: 0
]

{
	#category : #layout,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTabulator>>addRow: aBlockOrSymbol span: anInteger  [
	 
	^(self addRow: aBlockOrSymbol) span: anInteger
]

{
	#category : #layout,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTabulator>>cell  [
	 
	^cell
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTabulator>>cellOrColumn  [
	 
	^cell ifNil: [cell := GLMCustomColumn new browser: self]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTabulator>>cellOrRow  [
	 
	^cell ifNil: [cell := GLMCustomRow new browser: self]
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTabulator>>column: aBlockOrSymbol  [
	 
	^self addColumn: aBlockOrSymbol
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTabulator>>column: aBlockOrSymbol size: anInteger  [
	 
	^self addColumn: aBlockOrSymbol size: anInteger
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTabulator>>column: aBlockOrSymbol span: anInteger  [
	 
	^self addColumn: aBlockOrSymbol span: anInteger
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTabulator>>initializeScriptingDefaults [
	super initializeScriptingDefaults.
	self cell isNil
		ifTrue: [ self addColumn: #pane ].
	self transmissions
		detect: [ :each | each originatesAt: (self pane port: #entity) ]
		ifNone: [ 
			self
				transmit 
				to: (self panes first port: #entity);
				from: #outer port: #entity;
				andShow: [ :a | a custom: GLMFlexiblePresentation new ] ]
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTabulator>>renderGlamorouslyOn: aRenderer  [
	 
	^aRenderer renderTabulator: self
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTabulator>>row: aBlockOrSymbol  [
	 
	^self addRow: aBlockOrSymbol
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTabulator>>row: aBlockOrSymbol size: anInteger  [
	 
	^self addRow: aBlockOrSymbol size: anInteger
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMTabulator>>row: aBlockOrSymbol span: anInteger  [
	 
	^self addRow: aBlockOrSymbol span: anInteger
]
