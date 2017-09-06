"
A preamble evaluated before load
"
Class {
	#name : #MCPreambleDefinition,
	#superclass : #MCScriptDefinition,
	#category : #Monticello-Modeling,
	#timestamp : 'TorstenBergmann 2/5/2014 13:47'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPreambleDefinition class>>scriptSelector [
	^ #preamble
]

{
	#category : #installing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPreambleDefinition>>load [
	super load.
	self evaluate
]
