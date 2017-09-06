"
An alternative default handler that uses the file-list services to process files.

"
Class {
	#name : #DefaultExternalDropHandler,
	#superclass : #Object,
	#category : #Morphic-Core-Worlds,
	#timestamp : 'dgd 4/5/2004 19:07'
}

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:11'
}
DefaultExternalDropHandler class>>initialize [
	"initialize the receiver"
	ExternalDropHandler defaultHandler: self new
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:11'
}
DefaultExternalDropHandler class>>unload [
	"initialize the receiver"
	ExternalDropHandler defaultHandler: nil
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:11'
}
DefaultExternalDropHandler>>chooseServiceFrom: aCollection [
	"private - choose a service from aCollection asking the user if  
	needed"
	aCollection size = 1
		ifTrue: [^ aCollection anyOne].
	^ UIManager default chooseFrom: (aCollection collect: [:each | each label]) values: aCollection.

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:11'
}
DefaultExternalDropHandler>>servicesForFileNamed: aString  [
	"private - answer a collection of file-services for the file named  
	aString"
	| allServices |
	allServices := FileServices itemsForFile: aString.
	^ allServices
		reject: [:svc | self unwantedSelectors includes: svc selector]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:11'
}
DefaultExternalDropHandler>>unwantedSelectors [
	"private - answer a collection well known unwanted selectors "
	^ #(#removeLineFeeds: #compressFile: )
]
