"
I am a critic that provides a selection interval by searching a 'faulty substring' in the target's source code. I also use the 'faulty substring' to enhence the critic's title
"
Class {
	#name : #ReStringBasedCritique,
	#superclass : #ReAbstractCritique,
	#category : #Renraku-Critiques,
	#timestamp : 'YuriyTymchuk 10/16/2015 01:57'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:37'
}
ReStringBasedCritique class>>for: anEntity by: aRule badString: aString [
	^ self basicNew
		initializeRule: aRule target: anEntity badString: aString;
		yourself 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReStringBasedCritique>>change [
	^ self shouldNotImplement
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReStringBasedCritique>>initializeRule: aRule target: anEntity badString: aString [

	self
		initializeRule: aRule
		sourceAnchor: (
			ReSearchStringSourceAnchor
				entity: anEntity
				string: aString)
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReStringBasedCritique>>providesChange [
	^ false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReStringBasedCritique>>title [
	^ '[', sourceAnchor searchString, '] ', super title
]
