Extension {
	#name : #MetacelloTestsMCPackage
}

{
	#category : #'*metacello-testscommonmc',
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloTestsMCPackage>>packageInfo [
	"Aiming for speeding up the running of the tests"

	^ MetacelloTestsPackageSet named: name

]

{
	#category : #'*metacello-testscommonmc',
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloTestsMCPackage>>packageSet [
	"Aiming for speeding up the running of the tests"

	^ MetacelloTestsPackageSet named: name

]

{
	#category : #'*metacello-testscommonmc',
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloTestsMCPackage>>species [
	^ MCPackage

]
