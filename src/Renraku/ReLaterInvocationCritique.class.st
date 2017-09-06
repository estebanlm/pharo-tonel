"
A critic which represents that the method is missing some required messages after the one in questiong
"
Class {
	#name : #ReLaterInvocationCritique,
	#superclass : #ReInvocationOrderCritique,
	#category : #Renraku-Critiques,
	#timestamp : 'YuriyTymchuk 3/4/2016 14:44'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReLaterInvocationCritique>>description [

	^ 'The functionality of #', targetMethodName, ' is intended to influence ', condition afterDescriptionString, '. In your case it is not followed by the previously mentioned messages which suggests that you are doing something wrong.' 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReLaterInvocationCritique>>title [

	^ 'Message #', targetMethodName, ' not followed by ',
		(condition afterDescriptionString truncateWithElipsisTo: 30)
]
