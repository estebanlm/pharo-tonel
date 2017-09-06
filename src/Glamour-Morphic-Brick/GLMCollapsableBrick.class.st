"

"
Class {
	#name : #GLMCollapsableBrick,
	#superclass : #GLMBrick,
	#instVars : [
		'headerBrick',
		'contentBrick'
	],
	#category : #Glamour-Morphic-Brick-Widgets-UI,
	#timestamp : ''
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMCollapsableBrick class>>createCollapsable [

	^ self new
		with: [ :collapsable | 
			collapsable headerBrick:
				(GLMBrick new
					addBrickBack:
						(GLMActionButtonBrick new
							icon: GLMUIThemeExtraIcons glamorousRight;
							marginLeft: 10;
							height: [ :b | b icon height * 1.2 ];
							width: [ :b | b icon width * 1.2 ];
							checkedImage: GLMUIThemeExtraIcons glamorousDown;
							action: [ :b | 
								collapsable toggle.
								collapsable isExpanded
									ifTrue: [ b check ]
									ifFalse: [ b uncheck ] ]);
					addBrickBack:
						(GLMLabelBrick new
							marginLeft: 10;
							text: 'Header';
							hSpaceFill;
							height: [ :b | b approximateHeight ]);
					vShrinkWrap;
					hSpaceFill) ];
		contentBrick:
			(GLMBrick new
				useVerticalLinearLayout;
				hSpaceFill;
				addAllBricks: {
					(GLMBrick new color: Color random; hSpaceFill).
					(GLMBrick new color: Color random; hSpaceFill).
					(GLMBrick new color: Color random; hSpaceFill).
					(GLMBrick new color: Color random; hSpaceFill)};
				yourself)
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMCollapsableBrick class>>createCollapsableArray: anInteger [

	^ (1 to: anInteger) collect: [ :index | self createCollapsable hSpaceFill  ]
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMCollapsableBrick class>>exampleOpen [
	
	self gtExample openInBrickWindowLabeled: 'Collapsable Example'
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMCollapsableBrick class>>gtExample [
	<gtExample>
	<label: 'Very simple one collapsable item'>
	
	^ self createCollapsable
		hSpaceFill;
		vShrinkWrap
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMCollapsableBrick>>collapse [

	self contentBrick ifNil: [ ^ self ].

	self isExpanded
		ifTrue: [ self removeBrick: self contentBrick ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMCollapsableBrick>>contentBrick [
	^ contentBrick
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMCollapsableBrick>>contentBrick: aBrick [
	contentBrick := aBrick.
	
	self contentBrick
		hSpaceFill;
		vShrinkWrap
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMCollapsableBrick>>expand [

	self contentBrick ifNil: [ ^ self ].

	self isExpanded
		ifFalse: [ self addBrickBack: self contentBrick ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMCollapsableBrick>>headerBrick [
	^ headerBrick
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMCollapsableBrick>>headerBrick: aBrick [
	headerBrick := aBrick.
	
	self headerBrick hSpaceFill.
	
	self addBrickFirst: self headerBrick
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMCollapsableBrick>>initialize [
	super initialize.
	
	self
		useVerticalLinearLayout;
		vShrinkWrap
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMCollapsableBrick>>isExpanded [

	^ self hasSubbrick: self contentBrick
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMCollapsableBrick>>toggle [

	self isExpanded
		ifTrue: [ self collapse ]
		ifFalse: [ self expand ]
]
