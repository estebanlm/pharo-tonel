"
SUnit tests for Gofer
"
Class {
	#name : #GoferTest,
	#superclass : #TestCase,
	#instVars : [
		'gofer'
	],
	#category : #Gofer-Tests
}

{ #category : #testing }
GoferTest class >> isAbstract [
	^ self name = #GoferTest
]

{ #category : #testing }
GoferTest class >> isUnitTest [
	^false
]

{ #category : #accessing }
GoferTest class >> packageNamesUnderTest [
	^ #('Gofer-Core')
]

{ #category : #accessing }
GoferTest class >> resources [
	^ Array with: GoferResource
]

{ #category : #accessing }
GoferTest >> monticelloRepository [
	^ GoferResource current monticelloRepository
]

{ #category : #running }
GoferTest >> setUp [
	super setUp.
	gofer := Gofer new.
	gofer disablePackageCache
]

{ #category : #accessing }
GoferTest >> versionReferences [
	^ GoferResource current versionReferences
]
