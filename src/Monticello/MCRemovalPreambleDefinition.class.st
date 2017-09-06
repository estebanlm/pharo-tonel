"
A preamble evaluated before unloading/removing
"
Class {
	#name : #MCRemovalPreambleDefinition,
	#superclass : #MCScriptDefinition,
	#category : #Monticello-Modeling,
	#timestamp : 'TorstenBergmann 2/5/2014 13:48'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCRemovalPreambleDefinition class>>scriptSelector [
	^ #preambleOfRemoval
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCRemovalPreambleDefinition>>sortKey [
	^ 'zzz' "force to the end so it gets unloaded early"
]

{
	#category : #installing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCRemovalPreambleDefinition>>unload [
	super unload.
	self evaluate
]
