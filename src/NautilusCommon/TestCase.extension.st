Extension {
	#name : #TestCase
}

{
	#category : #'*NautilusCommon',
	#timestamp : ' 8/31/2017 05:26:22'
}
TestCase class>>clearResultOfTestMethod: aMethod [
 	#(passed failures errors) do: [ :each |
		(self lastRun at: each)
			remove: aMethod selector
			ifAbsent: [  ] ]
]

{
	#category : #'*NautilusCommon',
	#timestamp : ' 8/31/2017 05:26:22'
}
TestCase class>>correspondingClassTested [
	"Returns the class tested by this TestCase or nil if it can't be found."

	| classNameString |
	classNameString := self name asString.
	^ self environment
		at:
			((classNameString endsWith: 'Test')
				ifTrue: [ classNameString allButLast: 4	"'Test' size" ]
				ifFalse: [ classNameString ]) asSymbol
		ifAbsent: [ nil ]
]

{
	#category : #'*NautilusCommon',
	#timestamp : ' 8/31/2017 05:26:22'
}
TestCase class>>correspondingTestCase [
	^ nil
]

{
	#category : #'*NautilusCommon',
	#timestamp : ' 8/31/2017 05:26:22'
}
TestCase class>>hasErrorTest [

	^ (self history at: #errors) isEmpty not 
]

{
	#category : #'*NautilusCommon',
	#timestamp : ' 8/31/2017 05:26:22'
}
TestCase class>>hasFailedTest [

	^ (self history at: #failures) isEmpty not 
]

{
	#category : #'*NautilusCommon',
	#timestamp : ' 8/31/2017 05:26:22'
}
TestCase class>>hasPassedTest [

	^ (self history at: #passed) isEmpty not 
]
