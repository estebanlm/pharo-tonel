Extension {
	#name : #EpPropagateRefactoring
}

{
	#category : #'*EpiceaBrowsers',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpPropagateRefactoring>>summaryOn: aWriteStream [
	"Write a string summarizing myself."
	
	aWriteStream 
		nextPutAll: 'Propagate '.
		
	targetRefactoring summaryOn: aWriteStream
]
