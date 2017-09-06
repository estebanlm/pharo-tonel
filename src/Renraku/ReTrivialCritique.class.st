"
I am a trivial tritic that does not provide any more information other than my target and rule
"
Class {
	#name : #ReTrivialCritique,
	#superclass : #ReAbstractCritique,
	#category : #Renraku-Critiques,
	#timestamp : 'YuriyTymchuk 10/16/2015 01:53'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReTrivialCritique>>change [
	^ self shouldNotImplement 
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReTrivialCritique>>providesChange [
	
	^ false
]
