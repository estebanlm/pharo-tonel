Extension {
	#name : #ThemeIcons
}

{
	#category : #'*System-Settings',
	#timestamp : ' 8/31/2017 05:26:16'
}
ThemeIcons>>acceptSettings: aVisitor [
	^ aVisitor visitThemeIcons: self
]
