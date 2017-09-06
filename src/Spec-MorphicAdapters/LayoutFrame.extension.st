Extension {
	#name : #LayoutFrame
}

{
	#category : #'*Spec-MorphicAdapters',
	#timestamp : ' 8/31/2017 05:26:18'
}
LayoutFrame>>isHorizontallyResizeable [

	^ self rightFraction ~= self leftFraction
]

{
	#category : #'*Spec-MorphicAdapters',
	#timestamp : ' 8/31/2017 05:26:18'
}
LayoutFrame>>isVerticallyResizeable [

	^ self bottomFraction ~= self topFraction
]
