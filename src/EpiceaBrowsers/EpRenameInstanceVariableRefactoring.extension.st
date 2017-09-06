Extension {
	#name : #EpRenameInstanceVariableRefactoring
}

{
	#category : #'*EpiceaBrowsers',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpRenameInstanceVariableRefactoring>>summaryOn: aWriteStream [
	"Write a string summarizing myself."
	
	aWriteStream 
		nextPutAll: 'Rename instance variable ';
		print: oldName;
		nextPutAll: ' into ';
		print: newName;
		nextPutAll: ' in ';		
		nextPutAll: affectedClassName.

]
