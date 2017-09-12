"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestSpecCore,
	#superclass : #PackageManifest,
	#category : #Spec-Core
}

{ #category : #code-critics }
ManifestSpecCore class >> ruleEqualsTrueRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#ListModel #getSelectionStateFor: #false)) #'2016-07-01T15:56:13.455728+02:00') )
]

{ #category : #code-critics }
ManifestSpecCore class >> ruleExcessiveMethodsRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#ComposableModel)) #'2016-07-01T15:56:13.465539+02:00') )
]

{ #category : #code-critics }
ManifestSpecCore class >> ruleExcessiveVariablesRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#ComposableModel)) #'2016-07-01T15:56:13.372336+02:00') #(#(#RGClassDefinition #(#AbstractWidgetModel)) #'2016-07-01T15:56:13.372528+02:00') )
]

{ #category : #code-critics }
ManifestSpecCore class >> ruleGTExampleNotDefinedRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#ComposableModel)) #'2016-07-01T15:56:13.363445+02:00') )
]

{ #category : #code-critics }
ManifestSpecCore class >> ruleImplementedNotSentRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#'TreeModel class' #exampleWithNoSpecifiedNodes #true)) #'2016-07-01T15:56:13.496495+02:00') #(#(#RGMethodDefinition #(#'DiffModel class' #exampleWithoutOptions #true)) #'2016-07-01T15:56:13.496444+02:00') #(#(#RGMethodDefinition #(#'DiffModel class' #exampleWithOptions #true)) #'2016-07-01T15:56:13.496455+02:00') #(#(#RGMethodDefinition #(#'TreeModel class' #exampleWithCustomColumnsAndNodesAndChildren #true)) #'2016-07-01T15:56:13.496426+02:00') #(#(#RGMethodDefinition #(#'TreeModel class' #exampleOfAutoRefreshOnExpand #true)) #'2016-07-01T15:56:13.496465+02:00') #(#(#RGMethodDefinition #(#'TreeModel class' #exampleWithCustomColumnsAndNodes #true)) #'2016-07-01T15:56:13.496478+02:00') )
]

{ #category : #code-critics }
ManifestSpecCore class >> ruleLongMethodsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#AbstractWidgetModel #initialize #false)) #'2016-07-01T15:56:13.356024+02:00') #(#(#RGMethodDefinition #(#ComposableModel #initialize #false)) #'2016-07-01T15:56:13.355982+02:00') )
]

{ #category : #code-critics }
ManifestSpecCore class >> ruleRBOverridesDeprecatedMethodRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#MenuItemModel #name #false)) #'2016-07-01T15:56:13.378417+02:00') )
]

{ #category : #code-critics }
ManifestSpecCore class >> ruleSubclassResponsibilityNotDefinedRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#'ComposableModel class' #defaultSpec #true)) #'2016-07-01T15:56:13.461086+02:00') )
]

{ #category : #code-critics }
ManifestSpecCore class >> ruleUnwindBlocksRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#'SpecInterpreter class' #interpretASpec:model:selector: #true)) #'2016-07-01T15:56:13.479538+02:00') )
]

{ #category : #code-critics }
ManifestSpecCore class >> ruleUsesTrueRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#'DiffModel class' #exampleWithOptions #true)) #'2016-07-01T15:56:13.475288+02:00') )
]
