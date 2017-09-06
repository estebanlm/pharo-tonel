"
**MetacelloLookupProjectSpecForLoad** ends up returning an instance of **MetacelloProjectSpecForLoad**
"
Class {
	#name : #MetacelloLookupProjectSpecForLoad,
	#superclass : #MetacelloScriptProjectSpecNotification,
	#category : #Metacello-Core-Scripts,
	#timestamp : 'dkh 6/1/2012 10:55'
}

{
	#category : #'exception description',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloLookupProjectSpecForLoad>>defaultAction [
    "Result of signal should be the MetacelloProjectSpecForLoad to be used to perform the load. 
	Create a MetacelloProjectSpecForLoad and use the overrideProjectSpec: if you want to supply a different projectSpec"

    ^ MetacelloProjectSpecForLoad new
        projectSpec: self projectSpec;
        yourself
]

{
	#category : #handlers,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloLookupProjectSpecForLoad>>handleResolutionFor: aScriptEngine [
    ^ aScriptEngine handleLookupProjectSpecForLoad: self
]
