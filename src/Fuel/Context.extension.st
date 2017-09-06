Extension {
	#name : #Context
}

{
	#category : #'*Fuel',
	#timestamp : ' 8/31/2017 05:26:12'
}
Context>>cleanCopy  [

	^ self class 
		sender: nil 
		receiver: receiver 
		method: method
		arguments: #()
]

{
	#category : #'*Fuel',
	#timestamp : ' 8/31/2017 05:26:12'
}
Context>>fuelAccept: aGeneralMapper [

	^aGeneralMapper visitMethodContext: self
]

{
	#category : #'*Fuel',
	#timestamp : ' 8/31/2017 05:26:12'
}
Context class>>newFromFrameSize: aFrameSize [
	
	^ super basicNew: aFrameSize
]
