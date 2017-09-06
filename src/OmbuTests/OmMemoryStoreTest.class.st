"

"
Class {
	#name : #OmMemoryStoreTest,
	#superclass : #OmStoreTest,
	#category : #OmbuTests,
	#timestamp : ''
}

{
	#category : #resources,
	#timestamp : ' 8/31/2017 05:26:28'
}
OmMemoryStoreTest>>setUpStore	 [
	^ OmMemoryStore new
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
OmMemoryStoreTest>>testWithAll [

	| entries |
	entries := (OmMemoryStore withAll: #(a b c)) entries.
	self assertCollection: (entries collect: #content) hasSameElements: #(a b c).
]
