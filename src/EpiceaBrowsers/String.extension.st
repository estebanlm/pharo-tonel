Extension {
	#name : #String
}

{
	#category : #'*EpiceaBrowsers',
	#timestamp : ' 8/31/2017 05:26:27'
}
String>>asInstanceSideBehaviorName [

	^ (self splitOn: Character space) first
]
