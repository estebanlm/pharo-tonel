Extension {
	#name : #EpRenameMethodRefactoring
}

{
	#category : #'*EpiceaBrowsers',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpRenameMethodRefactoring>>summaryOn: aWriteStream [
	"Write a string summarizing myself."
	
	aWriteStream
		nextPutAll: 'Rename ';
		nextPutAll: oldSelector printString;
		nextPutAll: ' into ';
		nextPutAll: newSelector printString.
]
