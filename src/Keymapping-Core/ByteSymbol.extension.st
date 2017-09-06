Extension {
	#name : #ByteSymbol
}

{
	#category : #'*Keymapping-Core',
	#timestamp : ' 8/31/2017 05:26:19'
}
ByteSymbol>>asKmCategoryIn: aKmRepository [
	^aKmRepository categoryForName: self
]
