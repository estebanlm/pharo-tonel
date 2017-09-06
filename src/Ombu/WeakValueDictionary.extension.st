Extension {
	#name : #WeakValueDictionary
}

{
	#category : #'*Ombu',
	#timestamp : ' 8/31/2017 05:26:27'
}
WeakValueDictionary>>at: key ifPresent: presentBlock ifAbsentOrNil: absentBlock [

	^ self 
		at: key
		ifPresent: [:valueOrNil | 
			valueOrNil
				ifNotNil: presentBlock
				ifNil: absentBlock ]
		ifAbsent: absentBlock
]
