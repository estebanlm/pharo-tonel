"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestIssueTracking,
	#superclass : #PackageManifest,
	#category : #IssueTracking,
	#timestamp : '<historical>'
}

{
	#category : #code-critics,
	#timestamp : ' 8/31/2017 05:26:25'
}
ManifestIssueTracking>>ruleMissingYourselfRuleV1FalsePositive [
^ #(#(#(#RGMethodDefinition #(#PharoIssue #downloadTitle #false)) #'2015-05-07T14:07:56.041142-04:00') )
]
