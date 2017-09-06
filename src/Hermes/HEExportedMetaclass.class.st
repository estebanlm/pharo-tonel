"

"
Class {
	#name : #HEExportedMetaclass,
	#superclass : #HESymbol,
	#category : #Hermes-Model,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEExportedMetaclass class>>tag [
	^ 16
]

{
	#category : #converting,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEExportedMetaclass>>asLiteralIn: env [
	^ (env classNamed: value) class
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
HEExportedMetaclass>>value: aMetaclass [
	value := aMetaclass baseClass name.
]
