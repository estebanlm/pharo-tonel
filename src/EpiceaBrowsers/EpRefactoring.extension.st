Extension {
	#name : #EpRefactoring
}

{
	#category : #'*EpiceaBrowsers',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpRefactoring>>summaryOn: aWriteStream [
	"Write a string summarizing myself."
	
	self subclassResponsibility
]
