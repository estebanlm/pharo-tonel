Extension {
	#name : #TraitDescription
}

{
	#category : #'*System-Sources',
	#timestamp : ' 8/31/2017 07:16:35'
}
TraitDescription>>logMethodSource: aText forMethod: aCompiledMethod inCategory: category withStamp: changeStamp [
	aCompiledMethod
		putSource: aText
		class: self
		category: category
		withStamp: changeStamp 
		priorMethod: (self
					compiledMethodAt: aCompiledMethod selector
					ifAbsent: [])
]
