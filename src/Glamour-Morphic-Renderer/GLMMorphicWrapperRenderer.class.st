"

"
Class {
	#name : #GLMMorphicWrapperRenderer,
	#superclass : #GLMMorphicBrowserRenderer,
	#instVars : [
		'container'
	],
	#category : #Glamour-Morphic-Renderer,
	#timestamp : ''
}

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicWrapperRenderer>>render: aBrowser [
	| paneMorph |
	container := GLMMorphic containerMorph.
	paneMorph := self renderObject: aBrowser defaultPane.
	paneMorph layoutFrame: (LayoutFrame identity).
	container addMorphBack: paneMorph.
	aBrowser when: GLMBrowserClosed send: #actOnBrowserClosed: to: self.
	^ container
]
