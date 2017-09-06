"
A base superclass for rules that check AST nodes.
"
Class {
	#name : #ReNodeBasedRule,
	#superclass : #ReAbstractRule,
	#category : #Renraku-Rules-Rewrite,
	#timestamp : 'YuriyTymchuk 7/6/2016 19:09'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReNodeBasedRule class>>checksNode [

	^ true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReNodeBasedRule class>>isVisible [

	^ self name ~=  #ReNodeBasedRule
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReNodeBasedRule class>>uniqueIdentifierName [

	^ self name
]

{
	#category : #helpers,
	#timestamp : ' 8/31/2017 05:26:37'
}
ReNodeBasedRule>>anchorFor: aNode [

	^ ReIntervalSourceAnchor
			entity: aNode
			interval: aNode sourceInterval.
			
	
]
