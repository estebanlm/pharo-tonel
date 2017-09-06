"
The critic tells that a required message is missing prior to the one in question
"
Class {
	#name : #RePriorInvocationCritique,
	#superclass : #ReInvocationOrderCritique,
	#category : #Renraku-Critiques,
	#timestamp : 'YuriyTymchuk 3/4/2016 14:50'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
RePriorInvocationCritique>>description [

	^ 'In order for #', targetMethodName, ' to work you have to call ', condition beforeDescriptionString, ' before' 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
RePriorInvocationCritique>>title [

	^ 'Message #', targetMethodName, ' not preceded by ',
		(condition beforeDescriptionString truncateWithElipsisTo: 30)
]
