Extension {
	#name : #Character
}

{
	#category : #'*Collections-Abstract-splitjoin',
	#timestamp : ' 8/31/2017 07:16:43'
}
Character>>join: aSequenceableCollection [
	^ self asString join: aSequenceableCollection

]
