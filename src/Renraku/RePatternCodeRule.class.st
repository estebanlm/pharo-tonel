"
An abstract class containing common tools for match and rewrite rules
"
Class {
	#name : #RePatternCodeRule,
	#superclass : #ReNodeBasedRule,
	#category : #Renraku-Rules-Rewrite,
	#timestamp : 'YuriyTymchuk 7/12/2017 10:43'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
RePatternCodeRule class>>isVisible [
	
	^ self name ~=  #RePatternCodeRule
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
RePatternCodeRule class>>noteCompilationOf: aSelector meta: isMeta [

	 aSelector == #initialize & isMeta not ifTrue: [ 
		ReRuleManager reset ]
]

{
	#category : #hooks,
	#timestamp : ' 8/31/2017 05:26:37'
}
RePatternCodeRule>>afterCheck: aNode mappings: mappingDict [
	"after a node was match you can do a post-validation here on the node and the dictionalry of wildcars with matched nodes as values"

	^ true	
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:37'
}
RePatternCodeRule>>flattenMatchMap: aDictionary [
	^ aDictionary keysAndValuesDo: [ :key :val |
		((key isKindOf: RBProgramNode) and: [ 
		 key isPatternNode ])
			ifTrue: [
				aDictionary
					at: key pattern
					put: val ] ] 
]
