"
SUnit tests for Gofer
"
Class {
	#name : #GoferTest,
	#superclass : #TestCase,
	#instVars : [
		'gofer'
	],
	#category : #Gofer-Tests,
	#timestamp : 'TorstenBergmann 2/5/2014 09:30'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:30'
}
GoferTest class>>isAbstract [
	^ self name = #GoferTest
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:30'
}
GoferTest class>>isUnitTest [
	^false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:30'
}
GoferTest class>>packageNamesUnderTest [
	^ #('Gofer-Core')
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:30'
}
GoferTest class>>resources [
	^ Array with: GoferResource
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:30'
}
GoferTest>>monticelloRepository [
	^ GoferResource current monticelloRepository
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:30'
}
GoferTest>>setUp [
	super setUp.
	gofer := Gofer new.
	gofer disablePackageCache
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:30'
}
GoferTest>>versionReferences [
	^ GoferResource current versionReferences
]
