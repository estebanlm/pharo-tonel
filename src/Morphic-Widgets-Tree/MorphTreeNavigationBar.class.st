"
I'm a pager control used to navigate in a MorphTreeMorph that has a lot of entries.

You can see one of my subclass in action using:
""May take a while to open""
ClassListExample new open
"
Class {
	#name : #MorphTreeNavigationBar,
	#superclass : #BorderedMorph,
	#instVars : [
		'treeMorph',
		'pageSize',
		'computedHeight',
		'withSearch',
		'pageSearchText'
	],
	#category : #Morphic-Widgets-Tree-Pagination,
	#timestamp : '<historical>'
}

{
	#category : #icons,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeNavigationBar class>>createIconMethods [
	"self createIconMethods"
	#('smallToLeft' 'smallToRight' 'smallToLeftEnd' 'smallToRightEnd' 'smallDieze' 'smallVerticalResizing')
		do: [:n | | form |
			form := PNGReadWriter formFromFileNamed: n, '.png'.
			self class compile: (n, 'Icon', String cr, String tab, '^ ', form storeString) classified: #icons]
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeNavigationBar class>>on: aTreeMorph pageSize: aPageSize [
	^ self new treeMorph: aTreeMorph  pageSize: aPageSize
]

{
	#category : #icons,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeNavigationBar class>>smallDiezeIcon [
	^ (Form
	extent: 16@16
	depth: 32
	fromArray: #( 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4279173376 4279173376 0 0 4279173376 4279173376 0 0 0 0 0 0 0 0 0 0 4279173376 0 0 0 4279173376 0 0 0 0 0 0 0 0 0 0 0 4279173376 0 0 0 4279173376 0 0 0 0 0 0 0 0 0 0 0 4279173376 0 0 0 4279173376 0 0 0 0 0 0 0 4279173376 4279173376 4279173376 4279173376 4279173376 4279173376 4279173376 4279173376 4279173376 4279173376 4279173376 0 0 0 0 0 0 0 0 4279173376 4279173376 4279173376 0 4279173376 4279173376 0 0 0 0 0 0 0 0 0 0 4279173376 0 0 0 4279173376 0 0 0 0 0 0 0 0 0 0 0 4279173376 0 0 0 4279173376 0 0 0 0 0 0 0 0 4279173376 4279173376 4279173376 4279173376 4279173376 4279173376 4279173376 4279173376 4279173376 4279173376 4279173376 0 0 0 0 0 0 0 4279173376 4279173376 4279173376 0 4279173376 4279173376 0 0 0 0 0 0 0 0 0 0 4279173376 4279173376 0 0 4279173376 4279173376 0 0 0 0 0 0 0 0 0 0 4279173376 0 0 0 4279173376 0 0 0 0 0 0 0 0 0 0 0 4279173376 0 0 0 4279173376 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
	offset: 0@0)
]

{
	#category : #icons,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeNavigationBar class>>smallToLeftEndIcon [
	^ (Form
	extent: 16@16
	depth: 32
	fromArray: #( 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4279173376 4287401100 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4279173376 4287401100 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4279173376 4287401100 0 0 0 0 4278190080 4278190080 4278190080 0 0 0 0 0 0 0 4279173376 4287401100 0 0 0 4278190080 4287401100 4287401100 4278190080 0 0 0 0 0 0 0 4279173376 4287401100 0 0 4278190080 4287401100 4287401100 4287401100 4287401100 4278190080 0 0 0 0 0 0 4279173376 4287401100 0 4278190080 4287401100 4287401100 4287401100 4287401100 4287401100 4291151301 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4279173376 4287401100 4278190080 4287401100 4287401100 4287401100 4287401100 4287401100 4287401100 4291151301 4291151301 4291151301 4291151301 4291151301 4291151301 4278190080 4279173376 4287401100 4278190080 4287401100 4287401100 4287401100 4287401100 4287401100 4287401100 4287401100 4287401100 4287401100 4291151301 4291151301 4291151301 4278190080 4279173376 4287401100 4278190080 4287401100 4287401100 4287401100 4287401100 4287401100 4287401100 4291151301 4291151301 4291151301 4291151301 4291151301 4291151301 4278190080 4279173376 4287401100 0 4278190080 4287401100 4287401100 4287401100 4287401100 4287401100 4291151301 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4279173376 4287401100 50353408 0 4278190080 4287401100 4287401100 4287401100 4287401100 4278190080 0 0 0 0 0 0 4279173376 4287401100 0 0 0 4278190080 4287401100 4287401100 4278190080 0 0 0 0 0 0 0 4279173376 4287401100 0 0 0 0 4278190080 4278190080 4278190080 0 0 0 0 0 0 0 4279173376 4287401100 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4279173376 4287401100 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
	offset: 0@0)
]

{
	#category : #icons,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeNavigationBar class>>smallToLeftIcon [
	^ (Form
	extent: 16@16
	depth: 32
	fromArray: #( 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4278190080 4278190080 4278190080 0 0 0 0 0 0 0 0 0 0 0 0 4278190080 4287401100 4287401100 4278190080 0 0 0 0 0 0 0 0 0 0 0 4278190080 4287401100 4287401100 4287401100 4287401100 4278190080 0 0 0 0 0 0 0 0 0 4278190080 4287401100 4287401100 4287401100 4287401100 4287401100 4291151301 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 0 0 4278190080 4287401100 4287401100 4287401100 4287401100 4287401100 4287401100 4291151301 4291151301 4291151301 4291151301 4291151301 4291151301 4278190080 0 0 4278190080 4287401100 4287401100 4287401100 4287401100 4287401100 4287401100 4287401100 4287401100 4287401100 4291151301 4291151301 4291151301 4278190080 0 0 4278190080 4287401100 4287401100 4287401100 4287401100 4287401100 4287401100 4291151301 4291151301 4291151301 4291151301 4291151301 4291151301 4278190080 0 0 0 4278190080 4287401100 4287401100 4287401100 4287401100 4287401100 4291151301 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 0 0 50353408 0 4278190080 4287401100 4287401100 4287401100 4287401100 4278190080 0 0 0 0 0 0 0 0 0 0 0 4278190080 4287401100 4287401100 4278190080 0 0 0 0 0 0 0 0 0 0 0 0 0 4278190080 4278190080 4278190080 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
	offset: 0@0)
]

{
	#category : #icons,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeNavigationBar class>>smallToRightEndIcon [
	^ (Form
	extent: 16@16
	depth: 32
	fromArray: #( 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4287401100 4279173376 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4287401100 4279173376 0 0 0 0 0 0 0 4278190080 4278190080 4278190080 0 0 0 0 4287401100 4279173376 0 0 0 0 0 0 0 4278190080 4287401100 4287401100 4278190080 0 0 0 4287401100 4279173376 0 0 0 0 0 0 4278190080 4287401100 4287401100 4287401100 4287401100 4278190080 0 50353408 4287401100 4279173376 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4291151301 4287401100 4287401100 4287401100 4287401100 4287401100 4278190080 0 4287401100 4279173376 4278190080 4291151301 4291151301 4291151301 4291151301 4291151301 4291151301 4287401100 4287401100 4287401100 4287401100 4287401100 4287401100 4278190080 4287401100 4279173376 4278190080 4291151301 4291151301 4291151301 4287401100 4287401100 4287401100 4287401100 4287401100 4287401100 4287401100 4287401100 4287401100 4278190080 4287401100 4279173376 4278190080 4291151301 4291151301 4291151301 4291151301 4291151301 4291151301 4287401100 4287401100 4287401100 4287401100 4287401100 4287401100 4278190080 4287401100 4279173376 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4291151301 4287401100 4287401100 4287401100 4287401100 4287401100 4278190080 0 4287401100 4279173376 0 0 0 0 0 0 4278190080 4287401100 4287401100 4287401100 4287401100 4278190080 0 0 4287401100 4279173376 0 0 0 0 0 0 0 4278190080 4287401100 4287401100 4278190080 0 0 0 4287401100 4279173376 0 0 0 0 0 0 0 4278190080 4278190080 4278190080 0 0 0 0 4287401100 4279173376 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4287401100 4279173376 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4287401100 4279173376)
	offset: 0@0)
]

{
	#category : #icons,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeNavigationBar class>>smallToRightIcon [
	^ (Form
	extent: 16@16
	depth: 32
	fromArray: #( 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4278190080 4278190080 4278190080 0 0 0 0 0 0 0 0 0 0 0 0 0 4278190080 4287401100 4287401100 4278190080 0 0 0 0 0 0 0 0 0 0 0 4278190080 4287401100 4287401100 4287401100 4287401100 4278190080 0 50353408 0 0 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4291151301 4287401100 4287401100 4287401100 4287401100 4287401100 4278190080 0 0 0 4278190080 4291151301 4291151301 4291151301 4291151301 4291151301 4291151301 4287401100 4287401100 4287401100 4287401100 4287401100 4287401100 4278190080 0 0 4278190080 4291151301 4291151301 4291151301 4287401100 4287401100 4287401100 4287401100 4287401100 4287401100 4287401100 4287401100 4287401100 4278190080 0 0 4278190080 4291151301 4291151301 4291151301 4291151301 4291151301 4291151301 4287401100 4287401100 4287401100 4287401100 4287401100 4287401100 4278190080 0 0 4278190080 4278190080 4278190080 4278190080 4278190080 4278190080 4291151301 4287401100 4287401100 4287401100 4287401100 4287401100 4278190080 0 0 0 0 0 0 0 0 0 4278190080 4287401100 4287401100 4287401100 4287401100 4278190080 0 0 0 0 0 0 0 0 0 0 0 4278190080 4287401100 4287401100 4278190080 0 0 0 0 0 0 0 0 0 0 0 0 4278190080 4278190080 4278190080 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
	offset: 0@0)
]

{
	#category : #icons,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeNavigationBar class>>smallVerticalResizingIcon [
	^ (Form
	extent: 16@16
	depth: 32
	fromArray: #( 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4283914071 0 0 0 0 4286545791 4286545791 4287401100 4287401100 4287401100 4287401100 0 0 0 0 4286545791 4290822336 4283914071 0 0 4286611584 4293256677 4293256677 4294967295 4294967295 4294967295 4294967295 4287401100 0 0 4286545791 4290822336 4290822336 4290822336 4283914071 0 4286611584 4293256677 4293256677 4294967295 4294967295 4294967295 4294967295 4287401100 0 4283914071 4283914071 4283914071 4283914071 4283914071 4283914071 4283914071 4286611584 4293256677 4293256677 4294967295 4294967295 4294967295 4294967295 4287401100 0 0 0 0 0 0 0 0 4286611584 4293256677 4293256677 4294967295 4294967295 4294967295 4294967295 4287401100 0 0 0 0 4278190080 0 0 0 4286611584 4293256677 4293256677 4294967295 4294967295 4294967295 4294967295 4287401100 0 0 0 0 4278190080 4293256677 0 0 4286611584 4293256677 4293256677 4294967295 4294967295 4294967295 4294967295 4287401100 0 0 0 0 4278190080 4293256677 0 0 4286611584 4293256677 4293256677 4294967295 4294967295 4294967295 4294967295 4287401100 0 0 0 0 4278190080 4293256677 0 0 4286611584 4293256677 4293256677 4294967295 4294967295 4294967295 4294967295 4287401100 0 0 0 0 4278190080 4293256677 0 0 4286611584 4293256677 4293256677 4294967295 4294967295 4294967295 4294967295 4287401100 0 4283914071 4283914071 4283914071 4283914071 4283914071 4283914071 4283914071 4286611584 4287401100 4287401100 4294967295 4294967295 4294967295 4294967295 4287401100 0 0 4286545791 4290822336 4290822336 4290822336 4283914071 0 0 4287401100 4287401100 4287401100 4287401100 4287401100 4287401100 0 0 0 0 4286545791 4290822336 4283914071 0 0 0 0 0 0 0 0 0 0 0 0 0 0 4283914071 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0)
	offset: 0@0)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeNavigationBar>>asDisabledForm: aForm [
	| disa |
	disa := aForm copy.
	(aForm colorsUsed reject: [:c | c = Color transparent])
		do: [:c | disa replaceColor: c  withColor: (c alphaMixed: 0.4 with: Color white)].
	^ disa

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeNavigationBar>>basicButton [
	| button |
	^ (button := SimpleButtonMorph new)
		clipSubmorphs: true;
		color: self pagerColor;		
		on: #mouseEnter send: #value to: [button borderColor: self pagerColor muchDarker];
		on: #mouseLeave send: #value to: [button borderColor: self pagerColor];
		target: self;
		layoutPolicy: TableLayout new; 
		listDirection: #leftToRight; 
		listCentering: #leftCenter; 
		wrapCentering: #center;
		layoutInset: 2@0;
		cellInset: 2@0;
		borderWidth: 1;
		borderColor: self pagerColor;
		yourself
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeNavigationBar>>basicIcon [
	| button |
	^ (button := IconicButton new)
		clipSubmorphs: true;
		color: self pagerColor;		
		on: #mouseEnter send: #value to: [button borderColor: self pagerColor muchDarker];
		on: #mouseLeave send: #value to: [button borderColor: self pagerColor];
		target: self;
		layoutPolicy: TableLayout new; 
		listDirection: #leftToRight; 
		listCentering: #leftCenter; 
		wrapCentering: #center;
		layoutInset: 2@0;
		cellInset: 2@0;
		borderWidth: 1;
		borderColor: self pagerColor;
		yourself
	
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeNavigationBar>>buildPanel [
	self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeNavigationBar>>buttonLabel: aLabel actionSelector: aSelector arguments: aCollection getEnabled: enableSelector help: helpText [

	| b |
	b := (aLabel isString ifTrue: [self basicButton] ifFalse: [self basicIcon])
		actionSelector: aSelector;
		arguments: aCollection;
		hResizing: #shrinkWrap;
		vResizing: #shrinkWrap;
		setBalloonText: helpText;
		yourself.
		aLabel isString 
			ifTrue: [b label: aLabel font: self preferedFont]
			ifFalse: [| f | 
				f := (enableSelector isNil or: [self perform: enableSelector])
					ifTrue: [aLabel]
					ifFalse: [b lock. self asDisabledForm: aLabel].
				b labelGraphic: f].
	^ b
	
]

{
	#category : #navigation,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeNavigationBar>>changePageSize: aNumberOrNil [
	aNumberOrNil
		ifNotNil: [self updateForNewPageSize: aNumberOrNil]
		ifNil: [treeMorph removePager]

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeNavigationBar>>computedBounds [
	| tb tbw yGap |
	tb := treeMorph bounds.
	tbw := treeMorph borderWidth.
	yGap := self layoutInset asPoint y + self cellInset asPoint y.
	^ (tb bottomLeft + (tbw @ (self computedHeight + yGap) negated)) corner: (tb bottomRight - ( (tbw * 2) @ yGap )).

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeNavigationBar>>computedHeight [
	^ computedHeight
		ifNil: [computedHeight := self computedHeightFromContents + self layoutInset asPoint y + self cellInset asPoint y]
]

{
	#category : #navigation,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeNavigationBar>>computedHeightFromContents [
	| h |
	h := 0.
	self submorphsDo: [:sm | h := h max: sm height].
	^ h

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeNavigationBar>>handlesMouseDown: anEvent [
	^ true
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeNavigationBar>>initialize [
	super initialize.
	self hResizing: #spaceFill;
		 vResizing: #rigid;
		 changeTableLayout; 
		 listDirection: #leftToRight;
		 cellInset: 2 @ 0;
		 layoutInset: 3 @ 0;
		 listCentering: #center;
		 clipSubmorphs: true;
		 borderWidth: 0;
		 borderColor: Color lightGray
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeNavigationBar>>mouseDown: anEvent [

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeNavigationBar>>nodeList [
	^ treeMorph nodeList
]

{
	#category : #navigation,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeNavigationBar>>pageOfNodeIndex: anIndex [
	^ (anIndex > 0 and: [anIndex <= self nodeList size])
		ifTrue: [((anIndex - 1) // pageSize) + 1]
		ifFalse: [nil]
			
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeNavigationBar>>pageSearchText [
	^ pageSearchText ifNil: [pageSearchText := '']
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeNavigationBar>>pageSearchText: aString [
	| founds chosen chosenNode |
	pageSearchText := aString.
	self changed: #pageSearchText.
	founds := OrderedCollection new.
	self nodeList doWithIndex: [:n :idx |
		(n includesSubstringAnywhere: pageSearchText)
			ifTrue: [founds add: idx -> n]].
	founds ifEmpty: [ ^ self flash ].
	founds size > 1 
		ifTrue: [ 
			chosen := 
				UIManager default 
					chooseFrom: (founds collect: [:l | l value] ) 
					values: (founds collect: [:l | l key] ) 
					lines: nil 
					title: ''.
			chosen ifNil: [^self]]
		ifFalse: [chosen := founds first key].
	self currentPage: (self pageOfNodeIndex: chosen).
	chosenNode := self nodeList at: chosen.
	treeMorph scroller 
		submorphsDo: [:sm | 
			sm complexContents ==  chosenNode
				ifTrue: [treeMorph listManager setSelectedMorph: sm.
					^ treeMorph scrollSelectionIntoView]]

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeNavigationBar>>pageSize [
	^ pageSize
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeNavigationBar>>pageSize: anInteger [
	pageSize := anInteger
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeNavigationBar>>pageSizeInput: aString [
	| input |
	input := aString trimBoth.
	input ifEmpty: [input := '1'].
	(input beginsWith: '/' )
		ifTrue: [ | numberOfPages |
			input := (input copyFrom: 2 to: input size) trimBoth.
			numberOfPages := Integer readFromString: input.
			numberOfPages > 0 
				ifTrue: [self changePageSize: (self nodeList size // numberOfPages)]
				ifFalse: [treeMorph flash.
					^ false]]
		ifFalse: [ | newPageSize |
			newPageSize := Integer readFromString: input.
			newPageSize > 0 
				ifTrue: [self changePageSize: newPageSize]
				ifFalse: [treeMorph flash.
					^ false]].
	^ true

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeNavigationBar>>pagerColor [
	^ treeMorph pagerColor
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeNavigationBar>>preferedFont [
	^ self balloonFont 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeNavigationBar>>spacer: hsize [
	^ (Morph new) color: Color transparent; extent: hsize @ (self hasSubmorphs  ifTrue: [self computedHeight] ifFalse: [(self preferedFont height + 8)]); yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeNavigationBar>>textEntryLabel: aLabel get: getSel set: setSel help: helpText class: aClass [
 	| pt |
	pt := PluggableTextFieldMorph new
		convertTo: aClass;
		alwaysAccept: true;
		on: self
		text: getSel
		accept: setSel
		readSelection: nil
		menu: nil;
		acceptOnCR: true;
		getEnabledSelector: nil;
		font: self preferedFont;
		cornerStyle: #square;
		hResizing: #spaceFill;
		vResizing: #rigid;
		borderStyle: (BorderStyle inset width: 1);
		color: Color white;
		hideScrollBarsIndefinitely;
		extent: 24@ (self preferedFont height + 4);
		setBalloonText: helpText.
	pt textMorph
		autoFit: true;
		wrapFlag: false;
		margins: (1@0 corner: 1@0).
	^pt
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeNavigationBar>>treeMorph: aTreeMorph  [
	treeMorph := aTreeMorph.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeNavigationBar>>treeMorph: aTreeMorph pageSize: anInteger [
	self treeMorph: aTreeMorph.
	self pageSize: anInteger
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeNavigationBar>>updateContents [
	self bounds: self computedBounds.
	self color: treeMorph pagerColor.

]

{
	#category : #navigation,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeNavigationBar>>updateForNewPageSize: aPageSize [
	pageSize := aPageSize max: 1.
	self changed: #pageSize
]

{
	#category : #'user interface',
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeNavigationBar>>vScrollBarValue: scrollValue [

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeNavigationBar>>withSearch [
	^ withSearch ifNil: [withSearch := false]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:15'
}
MorphTreeNavigationBar>>withSearch: aBoolean [
	withSearch := aBoolean.
	self buildPanel
]
