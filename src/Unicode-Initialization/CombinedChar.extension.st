Extension {
	#name : #CombinedChar
}

{
	#category : #'*Unicode-Initialization',
	#timestamp : ' 8/31/2017 05:26:17'
}
CombinedChar class>>loadCompositionMapping [
	| url |
	url := 'http://unicode.org/Public/UNIDATA/UnicodeData.txt' asZnUrl.
	self parseCompositionMappingFrom: url retrieveContents readStream
]
