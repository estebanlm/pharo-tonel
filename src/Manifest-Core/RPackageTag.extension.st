Extension {
	#name : #RPackageTag
}

{
	#category : #'*Manifest-Core',
	#timestamp : ' 8/31/2017 05:26:30'
}
RPackageTag>>manifestBuilderForRuleChecker: aRuleChecker [
	"Return the manifestsince the rulechecker is keeping a cache, we ask it back"

	^ aRuleChecker manifestBuilderOfPackage: self package
]
