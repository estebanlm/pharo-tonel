Extension {
	#name : #Dictionary
}

{
	#category : #'*NewValueHolder',
	#timestamp : ' 8/31/2017 05:26:15'
}
Dictionary>>asValueHolder [

	^ DictionaryValueHolder value: self
]
