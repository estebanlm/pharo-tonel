"

"
Class {
	#name : #RBCompositeLintRuleTest,
	#superclass : #RBLintRuleTest,
	#instVars : [
		'rules'
	],
	#category : #Refactoring-Tests-Core-Data,
	#timestamp : ''
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:31'
}
RBCompositeLintRuleTest class>>allRules [
	^self ruleFor: self protocol: 'all checks'
]

{
	#category : #'all checks',
	#timestamp : ' 8/31/2017 05:26:31'
}
RBCompositeLintRuleTest class>>lintChecks [
	^ self 
		rules: (RBBasicLintRuleTest protocolsToCheck collect: 
			[ :each | 
			self 
				ruleFor: RBBasicLintRuleTest
				protocol: each ])
		name: 'Lint checks'
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:31'
}
RBCompositeLintRuleTest class>>ruleFor: aClass protocol: aProtocol  [
	^self
		rules: (((RBBrowserEnvironment new selectorsFor: aProtocol asSymbol in: aClass class)
				collect: [:selector | aClass perform: selector])
					asSortedCollection: [:a :b | a name < b name])
		name: ((aProtocol asString copy) at: 1 put: aProtocol first asUppercase;
				yourself)
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:31'
}
RBCompositeLintRuleTest class>>rules: aCollection  [
	^self new rules: aCollection
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:31'
}
RBCompositeLintRuleTest class>>rules: aCollection name: aString  [
	^(self new) rules: aCollection;
		name: aString;
		yourself
]

{
	#category : #'all checks',
	#timestamp : ' 8/31/2017 05:26:31'
}
RBCompositeLintRuleTest class>>transformations [
	^ self 
		ruleFor: RBTransformationRuleTest
		protocol: 'transformations'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBCompositeLintRuleTest>>checkClass: aSmalllintContext  [
	rules do: 
			[:each | 
			each checkClass: aSmalllintContext.
			Processor yield]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBCompositeLintRuleTest>>checkMethod: aSmalllintContext  [
	rules do: 
			[:each | 
			each checkMethod: aSmalllintContext.
			Processor yield]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBCompositeLintRuleTest>>failedRules [
	^rules inject: OrderedCollection new into: [:oc :each | oc addAll: each failedRules; yourself]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBCompositeLintRuleTest>>hasConflicts [
	^(rules detect: [:each | each hasConflicts] ifNone: [nil]) notNil
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBCompositeLintRuleTest>>isComposite [
	^true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBCompositeLintRuleTest>>isEmpty [
	^(rules detect: [:each | each isEmpty not] ifNone: [nil]) isNil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBCompositeLintRuleTest>>problemCount [
	^rules inject: 0 into: [:count :each | count + each problemCount]
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBCompositeLintRuleTest>>resetResult [
	rules do: [:each | each resetResult]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBCompositeLintRuleTest>>rules [
	^rules
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBCompositeLintRuleTest>>rules: aCollection [
	rules := aCollection
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:31'
}
RBCompositeLintRuleTest>>viewResults [
	rules do: [:each | each viewResults]
]
