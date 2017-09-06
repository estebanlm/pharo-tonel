"
A GLMMorphicPagerRenderer is xxxxxxxxx.

"
Class {
	#name : #GLMMorphicPagerRenderer,
	#superclass : #GLMMorphicFinderRenderer,
	#category : #Glamour-Morphic-Pager-Glamour,
	#timestamp : 'AndreiChis 6/28/2014 21:19'
}

{
	#category : #callbacks,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicPagerRenderer>>actOnPaneAdded: ann [
	container brickRoot pushPane: (self renderObject: ann pane).
]

{
	#category : #callbacks,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicPagerRenderer>>actOnPaneRemoved: ann [
	container brickRoot popPane
]

{
	#category : #callbacks,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicPagerRenderer>>actOnPaneReplaced: ann [
	container brickRoot popAndReplacePane: (self renderObject: ann newPane)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicPagerRenderer>>defaultScrollButtonIconRenderBlock [

	^ [ :object | {Form new. Form new} ]
]

{
	#category : #rendering,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMMorphicPagerRenderer>>render: aBrowser [
	|pagerModel|
	pagerModel := GLMPagerModel new
		isDependenciesShown: false;
		defaultNumberOfVisiblePages: aBrowser fixedSizePanes;
		minimumPageNumberForScrollbar: aBrowser minimumPageNumberForScrollbar.
	
	aBrowser scrollButtonIconRenderBlock ifNotNil: [
		"result value of the block is raw icon of the Form class"
		pagerModel scrollButtonIconRenderBlock: [ :index | aBrowser scrollButtonIconRenderBlock cull: ((aBrowser panes at: index) port: #entity) value ]
	].
	
	container := (GLMPagerBrick new
		pagerModel: pagerModel;
		yourself) asBrickedMorph.

	"container maxPanes: aBrowser fixedSizePanes."
	self registerAnnouncementsFor: aBrowser.  
	aBrowser panes
		do: [ :each | container brickRoot pushPane: (self renderObject: each) ].
	^ container
]
