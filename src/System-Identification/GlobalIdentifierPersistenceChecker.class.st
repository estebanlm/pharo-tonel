"
I check whether a persistence should be stored. I return answer of `FileIdentifier home exists`. Such use case is important for a server deployment, where HOME directory may not exists. See https://pharo.fogbugz.com/f/cases/19944

I collaborate with GlobalIdentifierPersistence that uses me for checking before any disk operation.
"
Class {
	#name : #GlobalIdentifierPersistenceChecker,
	#superclass : #Object,
	#category : #System-Identification,
	#timestamp : 'JurajKubelka 4/17/2017 09:36'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GlobalIdentifierPersistenceChecker>>isEnabled [
	"See class comment or https://pharo.fogbugz.com/f/cases/19944."
	^ FileLocator home exists
]
