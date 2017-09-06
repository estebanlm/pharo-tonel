"

"
Class {
	#name : #MetacelloMCTestsAbstractConfig,
	#superclass : #ConfigurationOf,
	#category : #Metacello-TestsMCResources,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloMCTestsAbstractConfig>>project [

	| constructor |
	^project ifNil: [
		"Construct Metacello project"
		constructor := MetacelloVersionConstructor on: self.
		project := constructor project.
		project loader: MetacelloNullRecordingMCSpecLoader new.
		project].

]
