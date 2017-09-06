"

"
Class {
	#name : #GLMMorphicDashboardRenderer,
	#superclass : #GLMMorphicBrowserRenderer,
	#category : #Glamour-Morphic-Renderer,
	#timestamp : ''
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicDashboardRenderer>>render: aBrowser [
	| container |
	container := GLMPanelMorph new.
	container
		fillStyle: Color transparent;
		changeProportionalLayout;
		hResizing: #spaceFill;
		vResizing: #spaceFill.
	aBrowser panes reverseDo: [ :aGLMPane | self renderPane: aGLMPane inUI: container from: aBrowser ].
	aBrowser when: GLMBrowserClosed send: #actOnBrowserClosed: to: self.
	^ container
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicDashboardRenderer>>renderPane: aPane inUI: aMorph from: aDashboard [
	aMorph addMorph: (self renderObject: aPane) fullFrame: (aDashboard layoutOfPaneNamed: aPane name)
]
