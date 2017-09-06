"

"
Class {
	#name : #MCDictionaryRepositoryTest,
	#superclass : #MCRepositoryTest,
	#instVars : [
		'dict'
	],
	#category : #Monticello-Tests,
	#timestamp : ''
}

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCDictionaryRepositoryTest>>addVersion: aVersion [
	dict at: aVersion info put: aVersion
]

{
	#category : #utility,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCDictionaryRepositoryTest>>deleteNode: aNode [
	dict removeKey: aNode
]

{
	#category : #utility,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCDictionaryRepositoryTest>>dictionary [
	^ dict ifNil: [dict := Dictionary new]
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCDictionaryRepositoryTest>>setUp [
	repository :=  MCDictionaryRepository new dictionary: self dictionary
]
