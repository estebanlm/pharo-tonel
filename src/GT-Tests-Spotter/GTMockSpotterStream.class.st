"

"
Class {
	#name : #GTMockSpotterStream,
	#superclass : #GTSpotterUIThreadStream,
	#category : #GT-Tests-Spotter-Scripting-Mocks,
	#timestamp : ''
}

{
	#category : #performing,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTMockSpotterStream>>performSymbol: aSymbol withArguments: aCollection [
	self receiver perform: aSymbol withEnoughArguments: aCollection
]
