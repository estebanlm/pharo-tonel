Extension {
	#name : #RPackageTag
}

{
	#category : #'*Ombu-Ston',
	#timestamp : ' 8/31/2017 05:26:27'
}
RPackageTag class>>fromSton: stonReader [
	"Specialize generic implementation since #new is forbidden in this class."
	
	^ self basicNew
		fromSton: stonReader;
		yourself
]
