Extension {
	#name : #Character
}

{
	#category : #'*Keymapping-KeyCombinations',
	#timestamp : ' 8/31/2017 05:26:19'
}
Character>>alt [
	^ KMModifier alt + self
]

{
	#category : #'*Keymapping-KeyCombinations',
	#timestamp : ' 8/31/2017 05:26:19'
}
Character>>asKeyCombination [
	^ KMSingleKeyCombination from: self
]

{
	#category : #'*Keymapping-KeyCombinations',
	#timestamp : ' 8/31/2017 05:26:19'
}
Character>>asShortcut [
	^ self asKeyCombination
]

{
	#category : #'*Keymapping-KeyCombinations',
	#timestamp : ' 8/31/2017 05:26:19'
}
Character>>command [
	^ KMModifier command + self
]

{
	#category : #'*Keymapping-KeyCombinations',
	#timestamp : ' 8/31/2017 05:26:19'
}
Character>>control [
	^ KMModifier control + self
]

{
	#category : #'*Keymapping-KeyCombinations',
	#timestamp : ' 8/31/2017 05:26:19'
}
Character>>ctrl [
	^ KMModifier ctrl + self
]

{
	#category : #'*Keymapping-KeyCombinations',
	#timestamp : ' 8/31/2017 05:26:19'
}
Character>>meta [
	^ KMModifier meta + self
]

{
	#category : #'*Keymapping-KeyCombinations',
	#timestamp : ' 8/31/2017 05:26:19'
}
Character>>shift [
	^ KMModifier shift + self
]
