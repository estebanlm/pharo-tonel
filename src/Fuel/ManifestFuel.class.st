"
Manifest for Fuel package
"
Class {
	#name : #ManifestFuel,
	#superclass : #PackageManifest,
	#category : #Fuel,
	#timestamp : 'TorstenBergmann 2/3/2014 23:17'
}

{
	#category : #'meta data',
	#timestamp : ' 8/31/2017 05:26:12'
}
ManifestFuel class>>ruleConsistencyCheckRuleV1FalsePositive [
^ #(#(#(#RGMethodDefinition #(#Float #serializeOn: #false)) #'2013-02-25T14:50:01.564000001+01:00') )
]

{
	#category : #'meta data',
	#timestamp : ' 8/31/2017 05:26:12'
}
ManifestFuel class>>ruleIfTrueBlocksRuleV1FalsePositive [
^ #(#(#(#RGMethodDefinition #(#FLLightGeneralMapper #visitSubstitution:by:onRecursionDo: #false)) #'2013-02-25T14:50:01.650000001+01:00') )
]
