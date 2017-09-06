Extension {
	#name : #OrderedDictionary
}

{
	#category : #'*NewValueHolder',
	#timestamp : ' 8/31/2017 05:26:15'
}
OrderedDictionary>>asValueHolder [

	^ DictionaryValueHolder value: self

]
