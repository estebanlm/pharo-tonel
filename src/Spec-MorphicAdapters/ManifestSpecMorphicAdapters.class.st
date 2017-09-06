"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestSpecMorphicAdapters,
	#superclass : #PackageManifest,
	#category : #Spec-MorphicAdapters,
	#timestamp : '<historical>'
}

{
	#category : #code-critics,
	#timestamp : ' 8/31/2017 05:26:18'
}
ManifestSpecMorphicAdapters class>>ruleGTExampleNotDefinedRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#AbstractMorphicAdapter)) #'2016-07-01T15:56:13.367433+02:00') )
]

{
	#category : #code-critics,
	#timestamp : ' 8/31/2017 05:26:18'
}
ManifestSpecMorphicAdapters class>>ruleRBOverridesDeprecatedMethodRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#MorphicMenuItemAdapter #name #false)) #'2016-07-01T15:56:13.381999+02:00') )
]
