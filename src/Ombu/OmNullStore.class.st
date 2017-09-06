"
I represent the null OmStore (Null Object design pattern).
"
Class {
	#name : #OmNullStore,
	#superclass : #OmStore,
	#category : #Ombu-Stores,
	#timestamp : 'MartinDias 1/20/2017 19:56'
}

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmNullStore>>entriesDo: aBlockClosure [
	"Evaluate aBlockClosure with every entries this store contains"

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmNullStore>>entryFor: aReference ifPresent: presentBlockClosure ifAbsent: absentBlockClosure [
	"Look for an entry, evaluating either the first block closure if present or the second if absent."

	^ absentBlockClosure value
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmNullStore>>headReference [
	"Answer a reference to the last entry added to this store."

	^ OmNullReference uniqueInstance
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmNullStore>>newEntry: anEntry [

	self shouldNotImplement 
]

{
	#category : #refreshing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmNullStore>>refresh [

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
OmNullStore>>writingFileReference [

	^ self shouldNotImplement
]
