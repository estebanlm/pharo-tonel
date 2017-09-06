"
A GLMStacker is an explicit browser that allows us to stack panes on top of each other and typically show them as tabs.
"
Class {
	#name : #GLMStacker,
	#superclass : #GLMExplicitBrowser,
	#category : #Glamour-Browsers-Other,
	#timestamp : '<historical>'
}

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMStacker>>aPane: aBlockOrSymbol [
	^ self addNewPaneNamed: aBlockOrSymbol
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMStacker>>panes: blocksOrSymbols [
	^ blocksOrSymbols do: [:each | self aPane: each]
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMStacker>>renderGlamorouslyOn: aRenderer  [
	^aRenderer renderStacker: self
]
