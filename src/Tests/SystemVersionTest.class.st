"
I am an sunit test for SystemVersion.  Originally created to test SqueakMapSystemVersionFix change set.
I have no test fixtures.
"
Class {
	#name : #SystemVersionTest,
	#superclass : #TestCase,
	#category : #Tests-System
}

{ #category : #tests }
SystemVersionTest >> testDottedMajorMinor [
	"
	SystemVersionTest run: #testMajorMinor
	"
	self assert: (SystemVersion fromShortVersionString: 'Squeak3.7alpha') dottedMajorMinor = '3.7'.
	self assert: (SystemVersion fromShortVersionString: 'Pharo1.0ALPHA') dottedMajorMinor = '1.0'.
	self assert: (SystemVersion fromShortVersionString: 'Pharo1.1') dottedMajorMinor = '1.1'.
]

{ #category : #'as yet unclassified' }
SystemVersionTest >> testMajorMinorVersion [
	"SystemVersionTest run: #testMajorMinorVersion"
	
	self assert: (SystemVersion fromShortVersionString: 'Squeak3.7alpha') majorMinorVersion = 'Squeak3.7'.
	self assert: (SystemVersion fromShortVersionString: 'Pharo1.0ALPHA') majorMinorVersion = 'Pharo1.0'.
	self assert: (SystemVersion fromShortVersionString: 'Pharo1.1') majorMinorVersion = 'Pharo1.1'.
]

{ #category : #'as yet unclassified' }
SystemVersionTest >> testMajorMinorWithSeparatingString [
	"SystemVersionTest debug: #testMajorMinorWithSeparatingString"
	
	self assert: ((SystemVersion fromShortVersionString: 'Squeak3.7alpha') majorMinor: '-') = '3-7'.
	self assert: ((SystemVersion fromShortVersionString: 'Pharo1.0ALPHA') majorMinor: '')  = '10'.
	self assert: ((SystemVersion fromShortVersionString: 'Pharo1.1') majorMinor: '.') = '1.1'.
]

{ #category : #'as yet unclassified' }
SystemVersionTest >> testParseShortVersionString [
	

	self assert: (SystemVersion parseShortVersionString: 'Squeak3.7alpha') = {'Squeak'. 3. 7. 'alpha'}.
	self assert: (SystemVersion parseShortVersionString: 'Pharo1.0ALPHA') = {'Pharo'. 1. 0. 'ALPHA'}.
	self assert: (SystemVersion parseShortVersionString: 'Pharo1.1') = {'Pharo'. 1. 1. ''}
]
