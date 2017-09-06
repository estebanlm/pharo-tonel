"
A critic which represents that there is an issue with the order of messages being sent
"
Class {
	#name : #ReInvocationOrderCritique,
	#superclass : #ReAbstractCritique,
	#instVars : [
		'targetMethodName',
		'condition'
	],
	#category : #Renraku-Critiques,
	#timestamp : 'YuriyTymchuk 3/4/2016 14:42'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:37'
}
ReInvocationOrderCritique class>>withAnchor: anAnchor by: aRule method: aString condition: aCondition [

	^ self new
		initializeRule:	aRule
		  sourceAnchor: anAnchor
		        method: aString
		     condition: aCondition;
		
		yourself
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReInvocationOrderCritique>>initializeRule: aRule sourceAnchor: anAnchor method: aString condition: aCondition [

	self initializeRule: aRule sourceAnchor: anAnchor.
	targetMethodName := aString.
	condition := aCondition 
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReInvocationOrderCritique>>providesChange [
	^ false
]
