"
A postscript evaluated after unloading/removing
"
Class {
	#name : #MCRemovalPostscriptDefinition,
	#superclass : #MCScriptDefinition,
	#category : #Monticello-Modeling,
	#timestamp : 'TorstenBergmann 2/5/2014 13:48'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCRemovalPostscriptDefinition class>>scriptSelector [
	^ #postscriptOfRemoval 
]

{
	#category : #installing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCRemovalPostscriptDefinition>>unload [
	super unload.
	self evaluate
]
