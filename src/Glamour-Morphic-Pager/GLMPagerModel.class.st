"

"
Class {
	#name : #GLMPagerModel,
	#superclass : #Object,
	#instVars : [
		'numberOfVisiblePages',
		'announcer',
		'firstVisiblePageIndex',
		'pagesCount',
		'lastVisiblePageIndex',
		'selectedPageIndex',
		'focusedMorphs',
		'focusedPageIndex',
		'virtualFirstVisiblePageIndex',
		'virtualLastVisiblePageIndex',
		'scrollButtonIconRenderBlock',
		'isDependenciesShown',
		'scrollToRightTask',
		'isNotificationsAllowed',
		'scrollingDelay',
		'minimumPageNumberForScrollbar'
	],
	#category : #Glamour-Morphic-Pager-Model,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>actualNumberOfVisiblePages [
	"returns actual number of visible pages based on first and last visible page indexes"

	(firstVisiblePageIndex = lastVisiblePageIndex) & (firstVisiblePageIndex = 0) ifTrue: [ ^ 0 ].
	^ lastVisiblePageIndex - firstVisiblePageIndex + 1.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>announcer [
	^ announcer ifNil: [ announcer := Announcer new ]
]

{
	#category : #focus,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>assignFocusableMorph: aMorph withPaneAt: paneIndex [
	"assigns previosely focused morph with corresponding pane"
	
	focusedMorphs at: paneIndex put: aMorph.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>circleButtonSize [
	^ 22
]

{
	#category : #scrolling,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>convertIndexToValue: anIndex [
	
	^ self convertIndexToValue: anIndex with: self size
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>convertIndexToValue: anIndex with: numberOfPagers [
	"private"
	numberOfPagers = self actualNumberOfVisiblePages
		ifTrue: [ ^ 0 ]
		ifFalse: [ ^ (anIndex - 1) / (numberOfPagers - self actualNumberOfVisiblePages ) ]
]

{
	#category : #scrolling,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>convertValueToIndex: aValue [
	
	^ (self size - self actualNumberOfVisiblePages) * aValue + 1.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>defaultNumberOfVisiblePages [
	^ 2
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>defaultNumberOfVisiblePages: anInteger [
	"use it only when the number of pages is 0"
	self size = 0 ifFalse: [ GLMPagerException signal: 'You can change default number of visible pages only when there is no pages' ].
	numberOfVisiblePages := anInteger.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>dependencyButtonSize [
	^ self isDependenciesShown ifTrue: [ self circleButtonSize ] ifFalse: [ 0 ].
]

{
	#category : #panes,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>diminishToLeft [

	self actualNumberOfVisiblePages = 1 ifTrue: [ ^ self ].
	self virtualLastVisiblePageIndex: (self lastVisiblePageIndex - 1).
	self recomputeState.
]

{
	#category : #panes,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>diminishToRight [

	self actualNumberOfVisiblePages = 1 ifTrue: [ ^ self ].
	self virtualFirstVisiblePageIndex: (self firstVisiblePageIndex + 1).
	self recomputeState.
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>doNotNotifyDuring: aBlock [
	|allowed|
	allowed := self isNotificationsAllowed.
	isNotificationsAllowed := false.
	aBlock cull: self.
	allowed ifTrue: [ isNotificationsAllowed := true ]
]

{
	#category : #panes,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>enlargeToLeft [

	self virtualFirstVisiblePageIndex: (self firstVisiblePageIndex - 1).
	self recomputeState.
]

{
	#category : #panes,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>enlargeToRight [

	self virtualLastVisiblePageIndex: (self lastVisiblePageIndex + 1).
	self recomputeState.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>firstVisiblePageIndex [
	^ firstVisiblePageIndex
]

{
	#category : #focus,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>focusPaneAt: pageIndex [
	"tries to focus previosely focused morph at specified pane by its index"
	
	( self isFocusedMorphVisibleAt: pageIndex ) ifTrue: [
		focusedPageIndex := pageIndex.
		(self focusedMorphAt: pageIndex) activeHand newKeyboardFocus: (self focusedMorphAt: pageIndex).
		self notifyFocusedPageChanged.
	].
]

{
	#category : #focus,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>focusedMorphAt: pageIndex [
	"returns previosely focused morph in the pane or nil if no morph was focused"
	
	^ focusedMorphs at: pageIndex ifAbsent: [ nil ]
]

{
	#category : #focus,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>focusedMorphChanged: aMorph at: pageIndex [
	"call this method if a morph was focused in a pane with specified index. As a result corresponding pane will be marked as selected"
	
	
	self assignFocusableMorph: aMorph withPaneAt: pageIndex.
	
	focusedPageIndex = pageIndex ifFalse: [ 
		focusedPageIndex := pageIndex.
		self notifyFocusedPageChanged ]
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>focusedPageIndex [
	^ focusedPageIndex
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>initialize [
	super initialize.

	pagesCount := 0.
	selectedPageIndex := 0.
	focusedMorphs := Dictionary new.
	isDependenciesShown := false.
		
	numberOfVisiblePages := self defaultNumberOfVisiblePages.
	
	firstVisiblePageIndex:= 0.
	lastVisiblePageIndex:= 0.
	
	self invariant.
]

{
	#category : #invariant,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>invariant [
	"If any of these exceptions rise, please notify us through moose-dev mail list. Your help is appreciated"
	
	self isDebug ifFalse: [ ^ self ].
	
	pagesCount >= 0 ifFalse: [ GLMPagerException signal: 'The number of page must be non negative' ].

	pagesCount > 1 ifTrue: [
		firstVisiblePageIndex >= 1 ifFalse: [GLMPagerException signal: 'First visible page index must be > 1 if number of pages > 0'].
		lastVisiblePageIndex >= 1 ifFalse: [GLMPagerException signal: 'Last visible page index must be > 1 if number of pages > 0'].
		lastVisiblePageIndex <= pagesCount ifFalse: [ GLMPagerException signal: 'Last visible page index must be less or equals to the number of pages' ].
		self actualNumberOfVisiblePages <= numberOfVisiblePages ifFalse: [ GLMPagerException signal: 'Actual number of visible pages must be less or equals to current number of visible pages' ].
		selectedPageIndex >= 1 ifFalse: [ GLMPagerException signal: 'Selected page index must be greater or equals then 1 if number of pages is more than 1' ].
	].

	pagesCount = 1 ifTrue: [ 
		firstVisiblePageIndex = 1 ifFalse: [GLMPagerException signal: 'First visible page index must be 1 if number of pages is 1'].
		lastVisiblePageIndex = 1 ifFalse: [GLMPagerException signal: 'Last visible page index must be 1 if number of pages is 1'].
		lastVisiblePageIndex = firstVisiblePageIndex ifFalse: [ GLMPagerException signal: 'First and Last visible page indexes must be equal if number of pages is 1' ].
		self actualNumberOfVisiblePages = 1 ifFalse: [ GLMPagerException signal: 'Actual number of visible pages must be 1 if number of pages is 1' ].
		selectedPageIndex = 1 ifFalse: [ GLMPagerException signal: 'Selected page index must be 1 if number of pages is 1' ].
	].

	pagesCount = 0 ifTrue: [ 
		firstVisiblePageIndex = 0 ifFalse: [GLMPagerException signal: 'First visible page index must be 0 if number of pages is 0'].
		lastVisiblePageIndex = 0 ifFalse: [GLMPagerException signal: 'Last visible page index must be 0 if number of pages is 0'].
		self actualNumberOfVisiblePages = 0 ifFalse: [ GLMPagerException signal: 'Actual number of visible pages must be 0 if there is no pages' ].
		selectedPageIndex = 0 ifFalse: [ GLMPagerException signal: 'Selected page index must be 0 if number of pages is 0' ].
	]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>isDebug [

	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>isDependenciesShown [
	^ isDependenciesShown
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>isDependenciesShown: aBoolean [
	isDependenciesShown := aBoolean
]

{
	#category : #focus,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>isFocusedMorphVisibleAt: paneIndex [
	|morph|
	
	morph := self focusedMorphAt: paneIndex.
	morph ifNil: [ ^ false ].
	^ morph isInWorld.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>isNotificationsAllowed [

	^ isNotificationsAllowed ifNil: [ isNotificationsAllowed := true ]
]

{
	#category : #panes,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>isPaneVisible: aNumber [

	^ (aNumber >= self firstVisiblePageIndex) & (aNumber <= self lastVisiblePageIndex)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>lastVisiblePageIndex [
	| lastIndex |
	
	lastIndex := self firstVisiblePageIndex + self numberOfVisiblePages - 1.
	^ lastIndex > self size
		ifTrue: [ self size ]
		ifFalse: [ lastIndex ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>minimumPageNumberForScrollbar [
	^ minimumPageNumberForScrollbar ifNil: [ 1 ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>minimumPageNumberForScrollbar: aNumber [
	minimumPageNumberForScrollbar := aNumber
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>normalizePaneIndex: anIndex [
	"retunes normalized pane index. For example: returns 1 if index < 1 and size if index > self size"
	
	anIndex < 1 ifTrue: [ ^ 1 ].
	anIndex > self size ifTrue: [ ^ self size ].
	^ anIndex.
]

{
	#category : #notifying,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>notifyAll: anAnnouncement [
	
	self isNotificationsAllowed ifTrue: [
		self announcer announce: anAnnouncement ]
]

{
	#category : #notifying,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>notifyFocusedPageChanged [

	self notifyAll: GLMFocusedPageChanged new.
]

{
	#category : #notifying,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>notifyNumberOfVisiblePagesChanged [

	self notifyAll: GLMNumberOfVisiblePagesChanged new.
]

{
	#category : #notifying,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>notifyPagePoped: isSmooth [

	self notifyAll: (GLMPagePoped new smooth: isSmooth).
]

{
	#category : #notifying,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>notifyPagePoppedAndReplaced: aBrick [

	self notifyAll: (GLMPagePopedAndReplaced new brick: aBrick)
]

{
	#category : #notifying,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>notifyPagePushed: aMorph scrollTo: isScroll smooth: isSmooth [
	
	self notifyAll: (GLMPagePushed new morph: aMorph).
	
	isScroll ifTrue: [
		self scrollingDelay > 0
			ifTrue: [ self scrollToRightTask execute: { isSmooth } ]
			ifFalse: [ self scrollToRight: isSmooth ] ]
]

{
	#category : #notifying,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>notifyScrollPositionChanged: isSmooth [

	self notifyScrollPositionChanged: isSmooth callback: nil
]

{
	#category : #notifying,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>notifyScrollPositionChanged: isSmooth callback: aBlock [

	self notifyAll: (GLMPagerScrollPositionChanged new smooth: isSmooth; callback: aBlock; yourself).
]

{
	#category : #notifying,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>notifyScrollerBoundsChanged: aBounds [

	self notifyAll: (GLMPagerBoundsChanged new bounds: aBounds).
]

{
	#category : #notifying,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>notifySelectedPageChanged [

	self notifyAll:  GLMSelectedPageChanged new.
]

{
	#category : #notifying,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>notifySynchronizeScrollTo: aValue  [
	
	self notifyAll: (GLMPagerSynchronizeScrollAnnouncement new value: aValue).
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>numberOfVisiblePages [
	^ numberOfVisiblePages
]

{
	#category : #panes,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>popAndReplacePane: aMorph [
	
	self doNotNotifyDuring: [ :m |
		m popPane;
			pushPane: aMorph smooth: false ].
		
	self notifyPagePoppedAndReplaced: aMorph
]

{
	#category : #panes,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>popPane [

	self popPane: false.
]

{
	#category : #panes,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>popPane: isSmooth [

	self invariant.
	
	pagesCount >= 1 ifTrue: [
		|scrollTo smooth|
		smooth := isSmooth.
		
		focusedMorphs removeKey: pagesCount  ifAbsent: [ true ].
		pagesCount := pagesCount - 1.
		
		firstVisiblePageIndex = 1 ifTrue: [ smooth := false ].
		
		lastVisiblePageIndex > pagesCount ifTrue: [
			firstVisiblePageIndex := firstVisiblePageIndex - 1.
			lastVisiblePageIndex := lastVisiblePageIndex - 1.
		].
	
		firstVisiblePageIndex := firstVisiblePageIndex max: 1.
	
		pagesCount = 0 ifTrue: [
			selectedPageIndex := 0.
			firstVisiblePageIndex := 0.
		].
		
		self selectedPageIndex > pagesCount ifTrue: [
			self selectedPageIndex: pagesCount.
		].
	
		scrollTo := ((pagesCount = firstVisiblePageIndex) & (pagesCount > self numberOfVisiblePages)).
		self notifyPagePoped: smooth.
	].

	self invariant.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>privateRecomputeIndexesAfterScrollAt: aFloat [
	"while rounding fractional part < 0.5"
	|left right|
	
	self invariant.
	
	left := self convertValueToIndex: aFloat.
	right := left + self actualNumberOfVisiblePages - 1.
	firstVisiblePageIndex := left rounded.
	lastVisiblePageIndex := right rounded.
	
	lastVisiblePageIndex > self size ifTrue: [
		|delta|
		delta := lastVisiblePageIndex - self size.
		firstVisiblePageIndex := firstVisiblePageIndex - delta.
		lastVisiblePageIndex := lastVisiblePageIndex - delta.
	].
		
	self invariant.
	
	
]

{
	#category : #panes,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>pushPane: aMorph smooth: aBoolean [

	self invariant.
	
	pagesCount := pagesCount + 1.
	
	self size = 1
		ifTrue: [ 
			firstVisiblePageIndex := 1.
			lastVisiblePageIndex := 1.
			selectedPageIndex := 1.
		]
		ifFalse: [ 
			(self actualNumberOfVisiblePages < self numberOfVisiblePages) ifTrue: [
				lastVisiblePageIndex := lastVisiblePageIndex + 1.
			].
		].
	
	self notifyPagePushed: aMorph scrollTo: true smooth: aBoolean.
	self size = 1 ifTrue: [ self notifySelectedPageChanged ].
	
	self invariant.
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>recomputeState [
	self recomputeState: true
	
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>recomputeState: isSmooth [
	"recomputes current model state and if necessary notifies all listeners about changes"
	|tmpNumberOfVisiblePages notifyNumberOfVisiblePagesChanged|
	
	notifyNumberOfVisiblePagesChanged := false.
	
	self invariant.
	
	((virtualFirstVisiblePageIndex isNil) & (virtualLastVisiblePageIndex isNil)) ifTrue: [ ^ self ].
	virtualFirstVisiblePageIndex ifNil: [ virtualFirstVisiblePageIndex := self firstVisiblePageIndex ].
	virtualLastVisiblePageIndex ifNil: [ virtualLastVisiblePageIndex := self lastVisiblePageIndex ].
	
	tmpNumberOfVisiblePages := virtualLastVisiblePageIndex - virtualFirstVisiblePageIndex + 1.
	tmpNumberOfVisiblePages = numberOfVisiblePages ifFalse: [ notifyNumberOfVisiblePagesChanged := true ].
	numberOfVisiblePages := tmpNumberOfVisiblePages.
	
	firstVisiblePageIndex := virtualFirstVisiblePageIndex.
	lastVisiblePageIndex := virtualLastVisiblePageIndex.

	self invariant.
	
	virtualFirstVisiblePageIndex = nil.
	virtualLastVisiblePageIndex = nil.
	
	notifyNumberOfVisiblePagesChanged ifTrue: [ self notifyNumberOfVisiblePagesChanged ].
	self notifyScrollPositionChanged: isSmooth.
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>scrollButtonIconRenderBlock [
	^ scrollButtonIconRenderBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>scrollButtonIconRenderBlock: anObject [
	scrollButtonIconRenderBlock := anObject
]

{
	#category : #scrolling,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>scrollTo: aFloat smooth: isSmooth [
	
	self scrollTo: aFloat smooth: isSmooth callback: nil
]

{
	#category : #scrolling,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>scrollTo: aFloat smooth: isSmooth callback: aBlock [
	"notifies all listeners to scroll at the specified value"
	
	self privateRecomputeIndexesAfterScrollAt: aFloat.
	self notifyScrollPositionChanged: isSmooth callback: aBlock
]

{
	#category : #scrolling,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>scrollToPane: pageIndex [
	
	self scrollToPane: pageIndex callback: nil
	
]

{
	#category : #scrolling,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>scrollToPane: pageIndex callback: aBlock [
	"scrolls to specified pane specified by its index"

	self scrollTo: (self convertIndexToValue: pageIndex) smooth: true callback: aBlock
	
]

{
	#category : #scrolling,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>scrollToRight: isSmooth [
	"notifies all listeners that it is time to scroll most right"

	self scrollTo: 1.0 smooth: isSmooth
]

{
	#category : #scrolling,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>scrollToRightTask [

	^ scrollToRightTask ifNil: [
		scrollToRightTask := GLMAsyncTask new.
		scrollToRightTask
			doInBackground: [ :isSmooth | isSmooth ];
			onCompleted: [ :isSmooth | self scrollToRight: isSmooth ];
			delay: self scrollingDelay ]
]

{
	#category : #scrolling,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>scrollingDelay [

	^ scrollingDelay ifNil: [ scrollingDelay := 100 ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>scrollingDelay: anInteger [

	scrollingDelay := anInteger
]

{
	#category : #panes,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>selectToLeft [
	"moves focus to left"
	
	self selectedPageIndex: (self selectedPageIndex - 1).
]

{
	#category : #panes,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>selectToRight [
	"moves focus to right"
	
	self selectedPageIndex: (self selectedPageIndex + 1).
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>selectedPageIndex [
	^ selectedPageIndex
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>selectedPageIndex: anIndex [
	| normalizedIndex |
	"changes current selected page and scrolls to it if necessary. Also if possible re-focused available morph"
	
	normalizedIndex := self normalizePaneIndex: anIndex.
	
	(self isPaneVisible: normalizedIndex) ifFalse: [
		"we need to scroll if new selected page is invisible"
		self scrollToPane: (normalizedIndex < self firstVisiblePageIndex ifTrue: [ normalizedIndex ] ifFalse: [(normalizedIndex - self numberOfVisiblePages + 1)]).
	].
	
	selectedPageIndex := normalizedIndex.
	self focusPaneAt: normalizedIndex.
	self notifySelectedPageChanged.

	self invariant.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>size [
	^ pagesCount.
]

{
	#category : #scrolling,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>switchPaneTo: anIndex [
	| normalizedIndex |
	"switches pane to specified. Works as scrollToPane, but additionaly selects and focuses that pane."
	
	self invariant.
	
	normalizedIndex := self normalizePaneIndex: anIndex.
	
	self scrollToPane: normalizedIndex.	
	self focusPaneAt: normalizedIndex.
	
	selectedPageIndex := normalizedIndex.
	self notifySelectedPageChanged.
	
	self invariant.
]

{
	#category : #scrolling,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>synchronizeScrollTo: aValue [
	
	self notifySynchronizeScrollTo: aValue.
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>updatePreview: anIndex [

	self announcer announce: (GLMPagerPreviewUpdate new pageIndex: anIndex )
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>virtualFirstVisiblePageIndex [
	^ virtualFirstVisiblePageIndex
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>virtualFirstVisiblePageIndex: anIndex [

	virtualFirstVisiblePageIndex := self normalizePaneIndex: anIndex.
	
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>virtualLastVisiblePageIndex [

	^ virtualLastVisiblePageIndex
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMPagerModel>>virtualLastVisiblePageIndex: anIndex. [

	virtualLastVisiblePageIndex := self normalizePaneIndex: anIndex.
]
