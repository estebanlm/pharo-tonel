Extension {
	#name : #DiffModel
}

{
	#category : #'*Spec-Tools-VersionBrowser',
	#timestamp : ' 8/31/2017 05:26:19'
}
DiffModel>>aboutToStyle: aBoolean [

]

{
	#category : #'*Spec-Tools-VersionBrowser',
	#timestamp : ' 8/31/2017 05:26:19'
}
DiffModel>>behavior [
	^ self contextClass
]

{
	#category : #'*Spec-Tools-VersionBrowser',
	#timestamp : ' 8/31/2017 05:26:19'
}
DiffModel>>behavior: aClass [

	self contextClass: aClass
]

{
	#category : #'*Spec-Tools-VersionBrowser',
	#timestamp : ' 8/31/2017 05:26:19'
}
DiffModel>>doItReceiver: aReceiver [

]

{
	#category : #'*Spec-Tools-VersionBrowser',
	#timestamp : ' 8/31/2017 05:26:19'
}
DiffModel>>getText [

	^ self rightText
]

{
	#category : #'*Spec-Tools-VersionBrowser',
	#timestamp : ' 8/31/2017 05:26:19'
}
DiffModel>>text: aPairOfString [

	(aPairOfString isText or: [aPairOfString isString])
		ifTrue: [
			self leftText: ''.
			self rightText: aPairOfString
			 ]
		ifFalse: [
			self leftText: aPairOfString first.
			self rightText: aPairOfString second ]
]
