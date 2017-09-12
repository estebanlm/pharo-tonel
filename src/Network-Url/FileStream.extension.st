Extension { #name : #FileStream }

{ #category : #'*Network-Url' }
FileStream >> asUrl [
	^ self asZnUrl 
]

{ #category : #'*Network-Url' }
FileStream >> url [
	"Convert my path into a file:// type url String."
	
	^self asUrl asString
]
