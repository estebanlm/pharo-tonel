Extension {
	#name : #String
}

{
	#category : #'*Polymorph-Widgets',
	#timestamp : ' 8/31/2017 05:26:15'
}
String>>heightToDisplayInTree: aTree [

	^ aTree fontToUse height
]

{
	#category : #'*Polymorph-Widgets-Themes',
	#timestamp : ' 8/31/2017 05:26:15'
}
String class>>systemIconName [

	^ #stringIcon
]

{
	#category : #'*Polymorph-Widgets',
	#timestamp : ' 8/31/2017 05:26:15'
}
String>>treeRenderOn: aCanvas bounds: drawBounds color: drawColor font: aFont from: aMorph [

	aCanvas
		drawString: self
		in: drawBounds 
		font: aMorph font
		color: drawColor
]

{
	#category : #'*Polymorph-Widgets',
	#timestamp : ' 8/31/2017 05:26:15'
}
String>>widthToDisplayInTree: aTree [

	^ aTree fontToUse widthOfStringOrText: self contents
]
