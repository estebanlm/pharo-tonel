Extension {
	#name : #String
}

{
	#category : #'*Versionner-Core-Model',
	#timestamp : ' 8/31/2017 05:26:38'
}
String>>configurationBaseName [
	"Return the baseName for this configuration class name."
	
	^ (self indexOfSubCollection: 'ConfigurationOf') = 0
		ifTrue: [ self ]
		ifFalse: [ self copyFrom: ('ConfigurationOf' size + 1) to: self size]
]
