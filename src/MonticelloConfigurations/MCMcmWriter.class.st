"
Writer for Metacello MCM
"
Class {
	#name : #MCMcmWriter,
	#superclass : #MCWriter,
	#category : #MonticelloConfigurations,
	#timestamp : 'TorstenBergmann 2/20/2014 16:24'
}

{
	#category : #writing,
	#timestamp : ' 8/31/2017 07:16:16'
}
MCMcmWriter class>>fileOut: aConfiguration on: aStream [
	| inst |
	inst := self on: aStream.
	inst writeConfiguration: aConfiguration.
	inst close.
	

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:16'
}
MCMcmWriter class>>readerClass [
	^ MCMcmReader
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 07:16:16'
}
MCMcmWriter>>close [
	stream close
]

{
	#category : #writing,
	#timestamp : ' 8/31/2017 07:16:16'
}
MCMcmWriter>>writeConfiguration: aConfiguration [

	stream nextPut: $(.

	aConfiguration repositories do: [:ea | 
		stream cr.
		stream nextPutAll: 'repository '.
		(MCConfiguration repositoryToArray: ea) printElementsOn: stream].

	aConfiguration dependencies do: [:ea | 
		stream cr.
		stream nextPutAll: 'dependency '.
		(MCConfiguration dependencyToArray: ea) printElementsOn: stream].

	stream cr.
	stream nextPut: $).
	stream cr.
]
