Extension {
	#name : #Point
}

{
	#category : #'*ston-core',
	#timestamp : ' 8/31/2017 07:16:27'
}
Point>>fromSton: stonReader [
	stonReader parseListDo: [ :each :index |
		index = 1 ifTrue: [ x := each ].
		index = 2 ifTrue: [ y := each ] ]
]

{
	#category : #'*ston-core',
	#timestamp : ' 8/31/2017 07:16:27'
}
Point>>stonOn: stonWriter [
	stonWriter writeObject: self streamShortList: [ :array |
		array add: x; add: y ]
]
