Extension {
	#name : #TraitDescription
}

{
	#category : #'*NautilusCommon',
	#timestamp : ' 8/31/2017 05:26:22'
}
TraitDescription>>correspondingTestCase [
	"Return the TestCase that corresponds to me.
	If it does not exist, return nil."
	
	^ NautilusUtils correspondingTestCaseOf: self
]
