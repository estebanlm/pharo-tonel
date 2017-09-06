"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestMorphicWidgetsPluggable,
	#superclass : #PackageManifest,
	#category : #Morphic-Widgets-Pluggable,
	#timestamp : '<historical>'
}

{
	#category : #code-critics,
	#timestamp : ' 8/31/2017 05:26:14'
}
ManifestMorphicWidgetsPluggable class>>ruleEmptyExceptionHandlerRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#PluggableTextMorph #acceptBasic #false)) #'2016-07-01T16:07:25.941995+02:00') )
]

{
	#category : #code-critics,
	#timestamp : ' 8/31/2017 05:26:14'
}
ManifestMorphicWidgetsPluggable class>>ruleSentNotImplementedRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#PluggableTextMorph #acceptBasic #false)) #'2016-07-01T16:07:25.953189+02:00') )
]
