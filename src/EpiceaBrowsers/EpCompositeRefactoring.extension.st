Extension {
	#name : #EpCompositeRefactoring
}

{
	#category : #'*EpiceaBrowsers',
	#timestamp : ' 8/31/2017 05:26:27'
}
EpCompositeRefactoring>>summaryOn: aWriteStream [
	"Write a string summarizing myself."
	
	childrenRefactorings
		do: [:each | each summaryOn: aWriteStream ]
		separatedBy: [ aWriteStream nextPutAll: ', ' ]
]
