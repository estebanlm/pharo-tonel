Extension {
	#name : #Integer
}

{
	#category : #'*Keymapping-KeyCombinations',
	#timestamp : ' 8/31/2017 05:26:19'
}
Integer>>alt [
	^ KMModifier alt + self
]

{
	#category : #'*Keymapping-KeyCombinations',
	#timestamp : ' 8/31/2017 05:26:19'
}
Integer>>asKeyCombination [
	^ KMSingleKeyCombination from: self asCharacter
]

{
	#category : #'*Keymapping-KeyCombinations',
	#timestamp : ' 8/31/2017 05:26:19'
}
Integer>>asShortcut [
	^ self asKeyCombination
]

{
	#category : #'*Keymapping-KeyCombinations',
	#timestamp : ' 8/31/2017 05:26:19'
}
Integer>>command [
	^ KMModifier command + self
]

{
	#category : #'*Keymapping-KeyCombinations',
	#timestamp : ' 8/31/2017 05:26:19'
}
Integer>>control [
	^ KMModifier ctrl + self
]

{
	#category : #'*Keymapping-KeyCombinations',
	#timestamp : ' 8/31/2017 05:26:19'
}
Integer>>ctrl [
	^ KMModifier ctrl + self
]

{
	#category : #'*Keymapping-KeyCombinations',
	#timestamp : ' 8/31/2017 05:26:19'
}
Integer>>meta [
	^ KMModifier meta + self
]

{
	#category : #'*Keymapping-KeyCombinations',
	#timestamp : ' 8/31/2017 05:26:19'
}
Integer>>shift [
	^ KMModifier shift + self
]
