Extension {
	#name : #SmalltalkImage
}

{
	#category : #'*Tool-Base',
	#timestamp : ' 8/31/2017 05:26:18'
}
SmalltalkImage>>resetTools [

	Tools := nil
]

{
	#category : #'*Tool-Base',
	#timestamp : ' 8/31/2017 05:26:18'
}
SmalltalkImage>>tools [

	^ Tools ifNil: [
		Tools := PharoCommonTools new ]
]
