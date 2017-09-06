"
This class specifies that the updating announcement should come only from the single announcer object.
"
Class {
	#name : #GLMSingleUpdateAction,
	#superclass : #GLMUpdateAction,
	#category : #Glamour-Core,
	#timestamp : 'TudorGirba 1/7/2011 07:31'
}

{
	#category : #public,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMSingleUpdateAction>>computeAnnouncerObjects  [
	self flag: 'We catch the error because if there is a problem in the computation of the announcer object, we still want to be able to continue the execution'.
	^ OrderedCollection with: 
		([self transformation glamourValue: self presentation entity] 
			on: Error 
			do: [:e | self presentation entity. e resume])
]
