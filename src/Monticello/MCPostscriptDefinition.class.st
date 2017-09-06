"
A postscript evaluated after load
"
Class {
	#name : #MCPostscriptDefinition,
	#superclass : #MCScriptDefinition,
	#category : #Monticello-Modeling,
	#timestamp : 'TorstenBergmann 2/5/2014 13:47'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPostscriptDefinition class>>scriptSelector [
	^ #postscript
]

{
	#category : #installing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPostscriptDefinition>>postload [
	self evaluate
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPostscriptDefinition>>sortKey [
	^ 'zzz' "force to the end so it gets loaded late"
]
