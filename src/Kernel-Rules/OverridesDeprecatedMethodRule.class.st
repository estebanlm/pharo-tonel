"
The method overrided a deprecated method. This is a sign that an API has changed in an upstream project and most likely the method should override another one
"
Class {
	#name : #OverridesDeprecatedMethodRule,
	#superclass : #RBBlockLintRule,
	#category : #Kernel-Rules,
	#timestamp : 'YuriyTymchuk 5/25/2016 16:39'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:39'
}
OverridesDeprecatedMethodRule class>>checksMethod [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
OverridesDeprecatedMethodRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"

	^ 'RBOverridesDeprecatedMethodRule'
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:39'
}
OverridesDeprecatedMethodRule>>basicCheck: aMethod [
	^ aMethod overriddenMethods anySatisfy: #isDeprecated
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:39'
}
OverridesDeprecatedMethodRule>>checkMethod: aMethod [

	(self basicCheck: aMethod) ifTrue: [ 
			result addMethod: aMethod ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
OverridesDeprecatedMethodRule>>group [
	^ 'Potential Bugs'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
OverridesDeprecatedMethodRule>>name [
	^ 'Overrides a deprecated method'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
OverridesDeprecatedMethodRule>>rationale [
	^ 'The method overrided a deprecated method. This is a sign that an API has changed in an upstream project and most likely the method should override another one'
]
