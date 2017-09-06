"

"
Class {
	#name : #MetacelloLookupBaselineSpecForEnsureLoad,
	#superclass : #MetacelloScriptProjectSpecNotification,
	#category : #Metacello-Core-Scripts,
	#timestamp : ''
}

{
	#category : #'exception description',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloLookupBaselineSpecForEnsureLoad>>defaultAction [
	"Answer <true> if you want to ensure the load of the baseline ... default is to load the baseline"

	^ true
]

{
	#category : #handlers,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloLookupBaselineSpecForEnsureLoad>>handleResolutionFor: aScriptEngine [
	^ aScriptEngine handleLookupBaselineSpecForEnsureLoad: self
]
