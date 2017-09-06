Extension {
	#name : #TClassDescription
}

{
	#category : #'*NautilusCommon',
	#timestamp : ' 8/31/2017 05:26:22'
}
TClassDescription>>correspondingTestCase [
	"Return the TestCase that corresponds to me.
	If it does not exist, return nil."
	
	^ NautilusUtils correspondingTestCaseOf: self
]
