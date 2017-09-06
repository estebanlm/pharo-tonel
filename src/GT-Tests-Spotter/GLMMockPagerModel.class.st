"

"
Class {
	#name : #GLMMockPagerModel,
	#superclass : #GLMPagerModel,
	#category : #GT-Tests-Spotter-Scripting-Mocks,
	#timestamp : ''
}

{
	#category : #panes,
	#timestamp : ' 8/31/2017 05:26:42'
}
GLMMockPagerModel>>popPane: isSmooth [
	self flag: 'the spotter-model will not pop its step unless the UI allows it by this call - hmmmmm'.
	self notifyPagePoped: nil
]

{
	#category : #scrolling,
	#timestamp : ' 8/31/2017 05:26:42'
}
GLMMockPagerModel>>scrollToPane: pageIndex callback: aBlock [
	self flag: 'this method gets called directly from the gt-spotter model - hmmmmm'.
	aBlock value
]
