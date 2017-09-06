Extension {
	#name : #EpRenameClassRefactoring
}

{
	#category : #'*EpiceaBrowsers',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpRenameClassRefactoring>>summaryOn: aWriteStream [
	"Write a string summarizing myself."
	
	aWriteStream 
		nextPutAll: 'Rename ';
		nextPutAll: oldName;
		nextPutAll: ' into ';
		nextPutAll: newName.
]
