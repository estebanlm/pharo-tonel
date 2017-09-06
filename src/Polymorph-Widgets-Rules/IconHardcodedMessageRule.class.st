"
According to the new API you should use

	#iconName asIcon
	
Instead of

	Smalltalk ui icons iconName
"
Class {
	#name : #IconHardcodedMessageRule,
	#superclass : #ReNodeRewriteRule,
	#category : #Polymorph-Widgets-Rules,
	#timestamp : 'YuriyTymchuk 8/29/2016 21:30'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:44'
}
IconHardcodedMessageRule>>group [

	^ 'API Change'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:44'
}
IconHardcodedMessageRule>>initialize [
	super initialize.
	self
		replace: 'Smalltalk ui icons `iconName'
		byEvaluating: [ :node :matchMap | 
			RBParser
				parseExpression: '#' , (matchMap at: #'`iconName') , ' asIcon' ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:44'
}
IconHardcodedMessageRule>>name [

	^ 'Use #iconName asIcon'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:44'
}
IconHardcodedMessageRule>>severity [

	^ #error
]
