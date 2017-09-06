"
A RBCompositeLintRule is a composite rule holding rules.
"
Class {
	#name : #RBCompositeLintRule,
	#superclass : #RBLintRule,
	#instVars : [
		'rules',
		'name'
	],
	#category : #Refactoring-Critics,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBCompositeLintRule class>>allRules [
	^ self rules: (Array with: self lintChecks with: self transformations) name: 'All checks'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBCompositeLintRule class>>lintChecks [
	^ self rules: (self rulesGroupedFor: RBBasicLintRule) name: 'Lint checks'
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
RBCompositeLintRule class>>rules: aCollection [
	^ self new
		rules: aCollection;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
RBCompositeLintRule class>>rules: aCollection name: aString [
	^ self new
		rules: aCollection;
		name: aString;
		yourself
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
RBCompositeLintRule class>>rulesFor: aRuleClass [
	| rules |
	rules := SortedCollection
		sortBlock: [ :a :b | a name <= b name ].
	aRuleClass withAllSubclassesDo: [ :each |
		each isVisible
			ifTrue: [ rules add: each new ] ].
	^ rules asArray
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:27'
}
RBCompositeLintRule class>>rulesGroupedFor: aRuleClass [
	| groups rules |
	groups := Dictionary new.
	(self rulesFor: aRuleClass) do: [ :each |
		(groups at: each group ifAbsentPut: [ OrderedCollection new ])
			addLast: each ].
	rules := SortedCollection sortBlock: [ :a :b | a name <= b name ].
	groups keysAndValuesDo: [ :group :elements |
		rules addLast: (RBCompositeLintRule 
			rules: elements asArray
			name: group) ].
	^ rules asArray
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBCompositeLintRule class>>transformations [
	^ self rules: (self rulesGroupedFor: RBTransformationRule) name: 'Transformations'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBCompositeLintRule class>>uniqueIdentifierName [
	"This number should be unique and should change only when the rule completely change semantics"
	
	^'CompositeLintRule'
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBCompositeLintRule>>basicCheck: anEntity [
	"this has to be rewritten in a smarter way, when the complete implementation with critics will be ready".
	
	^ (self leaves select: [ :rule | rule class perform: (
		anEntity isCompiledMethod
			ifTrue: [ #checksMethod ]
			ifFalse: [ #checksClass ]) ]) anySatisfy: [ :rule |
				rule basicCheck: anEntity ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBCompositeLintRule>>changes [
	^ rules flatCollect: [ :each  | each changes ]
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBCompositeLintRule>>checkClass: aClass  [
	rules do: [ :each | each checkClass: aClass ]
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBCompositeLintRule>>checkMethod: aMethod  [
	rules do: [ :each | each checkMethod: aMethod ]
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBCompositeLintRule>>checkPackage: aPackage  [
	rules do: [ :each | each checkPackage: aPackage ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBCompositeLintRule>>hasConflicts [
	^ rules anySatisfy: [ :each | each hasConflicts ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBCompositeLintRule>>isComposite [
	^ true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBCompositeLintRule>>isEmpty [
	^ rules allSatisfy: [ :each | each isEmpty ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBCompositeLintRule>>leaves [

	^ rules flatCollect: [ :rule | rule leaves ]	

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBCompositeLintRule>>name [
	^ name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBCompositeLintRule>>name: aString [
	name := aString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBCompositeLintRule>>problemCount [
	^ rules inject: 0 into: [ :count :each | count + each problemCount ]
]

{
	#category : #adding/removing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBCompositeLintRule>>removeRule: aRule [

	(rules anySatisfy: [ :rule | rule name = aRule name] )
		ifTrue: [rules := rules reject:  [ :rule | rule name = aRule name]]
		 ifFalse: [rules do: [ :rule |
				rule isComposite 
					ifTrue: [rule removeRule: aRule]]] 
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBCompositeLintRule>>resetResult [
	rules do: [ :each | each resetResult ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBCompositeLintRule>>rules [
	^ rules
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBCompositeLintRule>>rules: aCollection [
	rules := aCollection
]

{
	#category : #adding/removing,
	#timestamp : ' 8/31/2017 05:26:27'
}
RBCompositeLintRule>>sort: aBlock [
	
	rules first isComposite
		ifTrue: [ rules do: [ :rule | rule sort: aBlock ]] 
		ifFalse: [ self rules: (rules sort: aBlock) ]
]
