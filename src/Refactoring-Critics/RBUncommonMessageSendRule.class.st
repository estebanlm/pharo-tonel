"
Sending messages with a common literal (e.g. ""Object self"") or an uppercase selector name are usually bugs, introduced through missing statement separators.
"
Class {
	#name : #RBUncommonMessageSendRule,
	#superclass : #RBBlockLintRule,
	#instVars : [
		'literalNames'
	],
	#category : #Refactoring-Critics-BlockRules,
	#timestamp : 'StephaneDucasse 11/29/2014 20:19'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUncommonMessageSendRule class>>checksMethod [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUncommonMessageSendRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'UncommonMessageSendRule'
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUncommonMessageSendRule>>basicCheck: aMethod  [
	^ aMethod messages anySatisfy: [ :each |
		(each isEmpty or: [ each first isUppercase or: [ literalNames includes: each ] ]) ]
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUncommonMessageSendRule>>checkMethod: aMethod  [
	aMethod messages do: [ :each |
		(each isEmpty or: [ (self isUnknownCapitalizedMessage: each) or: [ literalNames includes: each ] ]) ifTrue: [
			result 
				addMethod: aMethod;
				addSearchString: each ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUncommonMessageSendRule>>commonLiterals [

	^ #(#self #super #thisContext #true #false #nil) asIdentitySet
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUncommonMessageSendRule>>group [
	^ 'Potential Bugs'
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUncommonMessageSendRule>>initialize [
	super initialize.
	literalNames := self commonLiterals.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUncommonMessageSendRule>>isUnknownCapitalizedMessage: aSelector [
	^ aSelector first isUppercase and: [ aSelector isSelectorSymbol not ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBUncommonMessageSendRule>>name [
	^ 'Uncommon message send'
]
