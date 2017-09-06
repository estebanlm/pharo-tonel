"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestGTSpotter,
	#superclass : #PackageManifest,
	#category : #GT-Spotter,
	#timestamp : '<historical>'
}

{
	#category : #code-critics,
	#timestamp : ' 8/31/2017 05:26:36'
}
ManifestGTSpotter class>>ruleRBCollectSelectNotUsedRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#GTSpotterStep #selectFirst #false)) #'2017-03-05T17:36:01.509623+01:00') )
]
