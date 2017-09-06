Extension {
	#name : #WideSymbol
}

{
	#category : #'*Multilingual-OtherLanguages',
	#timestamp : ' 8/31/2017 05:26:15'
}
WideSymbol>>mutateJISX0208StringToUnicode [

	| c |
	1 to: self size do: [:i |
		c := self at: i.
		(c leadingChar = JISX0208 leadingChar or: [
			c leadingChar = (JISX0208 leadingChar bitShift: 2)]) ifTrue: [
			self basicAt: i put: (Character leadingChar: JapaneseEnvironment leadingChar code: (c asUnicode)) asciiValue.
		]
	].

]
