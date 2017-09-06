"
**MetacelloLookupProjectSpec** is signalled to allow a handler to substitute a different (equivalent) project spec for fetching or loading purposes
"
Class {
	#name : #MetacelloLookupProjectSpec,
	#superclass : #MetacelloScriptProjectSpecNotification,
	#category : #Metacello-Core-Scripts,
	#timestamp : 'dkh 6/1/2012 10:02'
}

{
	#category : #handlers,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloLookupProjectSpec>>handleResolutionFor: aScriptEngine [
    ^ aScriptEngine handleLookupProjectSpec: self
]
