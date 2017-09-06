Extension {
	#name : #CompiledMethod
}

{
	#category : #'*Tool-Base',
	#timestamp : ' 8/31/2017 05:26:18'
}
CompiledMethod>>browse [

	^ Smalltalk tools browser openOnClass: self methodClass selector: self selector
]

{
	#category : #'*Tool-Base',
	#timestamp : ' 8/31/2017 05:26:18'
}
CompiledMethod>>implementors [
	
	^ SystemNavigation default allImplementorsOf: self selector
]

{
	#category : #'*Tool-Base',
	#timestamp : ' 8/31/2017 05:26:18'
}
CompiledMethod>>senders [
	
	^ SystemNavigation default allSendersOf: self selector
]
