Extension {
	#name : #MCDictionaryRepository
}

{
	#category : #'*gofer-core-accessing',
	#timestamp : ' 8/31/2017 07:16:48'
}
MCDictionaryRepository>>goferPriority [
	^ 10
]

{
	#category : #'*gofer-core-accessing',
	#timestamp : ' 8/31/2017 07:16:48'
}
MCDictionaryRepository>>goferReferences [
	^ self allVersionInfos collect: [ :each | GoferResolvedReference name: each name repository: self ]
]
