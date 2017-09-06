Extension {
	#name : #ByteString
}

{
	#category : #'*Keymapping-KeyCombinations',
	#timestamp : ' 8/31/2017 05:26:19'
}
ByteString>>asKeyCombination [
	self size > 1 
		ifTrue: [ self error: 'Shortcuts only take a single letter'].
	^ KMSingleKeyCombination from: self first
]
