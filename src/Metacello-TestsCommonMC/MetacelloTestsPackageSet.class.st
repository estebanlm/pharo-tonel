"
This class is used to speed up Metacello tests. 

"
Class {
	#name : #MetacelloTestsPackageSet,
	#superclass : #RPackageSet,
	#category : #Metacello-TestsCommonMC,
	#timestamp : 'PavelKrivanek 3/7/2017 11:42'
}

{
	#category : #listing,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloTestsPackageSet>>extensionMethods [
	"Test packages don't extend classes and skipping this operation is a significant performance gain for running tests"

	^ #()
]

{
	#category : #listing,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloTestsPackageSet>>overriddenMethods [
	"Test packages don't override methods and skipping this operation is a significant performance gain for running tests"
	^ #()
]
