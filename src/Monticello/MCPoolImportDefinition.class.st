"
A MCPoolImportDefinition represents a pool definition.
"
Class {
	#name : #MCPoolImportDefinition,
	#superclass : #MCVariableDefinition,
	#category : #Monticello-Modeling,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPoolImportDefinition class>>type [
	^ #pool
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPoolImportDefinition>>isOrderDependend [
	^false
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCPoolImportDefinition>>isPoolImport [
	^ true
]
