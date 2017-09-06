"

"
Class {
	#name : #LazyTabGroupTest,
	#superclass : #TestCase,
	#instVars : [
		'window',
		'tabs'
	],
	#category : #Glamour-Tests-Morphic,
	#timestamp : ''
}

{
	#category : #'setup - tear down',
	#timestamp : ' 8/31/2017 05:26:35'
}
LazyTabGroupTest>>setUp [
	tabs := LazyTabGroupMorph new.
	tabs addLazyPage: (PanelMorph new fillStyle: (SolidFillStyle color: Color red)) label: 'one'.
	tabs addLazyPage: (PanelMorph new fillStyle: (SolidFillStyle color: Color yellow)) label: (GLMLabelBrick new text: 'two').
	window := tabs openInWindow.

]

{
	#category : #'setup - tear down',
	#timestamp : ' 8/31/2017 05:26:35'
}
LazyTabGroupTest>>tearDown [
	window ifNotNil: [window delete]
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:35'
}
LazyTabGroupTest>>testIsRendered [
	self assert: tabs pages first isRendered not.
	tabs selectedPageIndex: 1.
	self assert: tabs pages first isRendered.
	self assert: tabs pages second isRendered not
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:35'
}
LazyTabGroupTest>>testPageChangedAnnouncement [
	| announcement page |
	announcement := 0.
	tabs announcer
		when: LazyTabPageChanged
		do: [ :ann | 
			announcement := announcement + 1.
			page := ann page ].
	tabs selectedPageIndex: 1.
	self assert: announcement equals: 1.
	self assert: (page isKindOf: LazyTabPage)
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:35'
}
LazyTabGroupTest>>testPageRemovedAnnouncement [
	| announcement |
	announcement := 0.
	tabs announcer when: LazyTabPageRemoved do: [ :ann | announcement := announcement + 1 ].
	tabs announcer when: LazyTabPageChanged do: [ :ann | announcement := announcement + 1 ].
	tabs removePage: tabs pages first.
	self assert: announcement equals: 1
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:35'
}
LazyTabGroupTest>>testRemoveAllPages [
	tabs removePage: tabs pages first.
	tabs removePage: tabs pages first.
	self assert: tabs pages isEmpty.
	self assert: tabs contentMorph submorphs isEmpty
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:35'
}
LazyTabGroupTest>>testRemovePage [
	tabs removePage: tabs pages first.
	self assert: tabs pages size equals: 1
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:35'
}
LazyTabGroupTest>>testSimpleCreation [
	self assert: tabs pages size equals: 2
]
