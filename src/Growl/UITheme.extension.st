Extension {
	#name : #UITheme
}

{
	#category : #'*growl',
	#timestamp : ' 8/31/2017 05:26:13'
}
UITheme>>growlBorderColorFor: aGrowlMorph [
	^ Color transparent 
]

{
	#category : #'*growl',
	#timestamp : ' 8/31/2017 05:26:13'
}
UITheme>>growlContentsColorFor: aGrowlMorph [
	^ Color white
]

{
	#category : #'*growl',
	#timestamp : ' 8/31/2017 05:26:13'
}
UITheme>>growlDismissHandleFor: aGrowlMorph [
	| handle form image |
	handle := BorderedMorph newBounds: ((3@3) extent: (20@20))  color: Color white.
	handle borderColor: handle color muchDarker.
	handle borderWidth: 1.
	handle wantsYellowButtonMenu: false.
	form := self "haloDismissIcon" windowCloseForm.
	form ifNotNil: [
		image := ImageMorph new.
		image form: form.
		image color: handle color contrastingForegroundColor.
		image lock.
		handle addMorphCentered: image].
	^ handle
]

{
	#category : #'*growl',
	#timestamp : ' 8/31/2017 05:26:13'
}
UITheme>>growlFillColorFor: aGrowlMorph [
	^ self selectionColor
]

{
	#category : #'*growl',
	#timestamp : ' 8/31/2017 05:26:13'
}
UITheme>>growlLabelColorFor: aGrowlMorph [
	^ Color black lighter
]
