"
GTSnippets instance
"
Class {
	#name : #GTSnippets,
	#superclass : #Object,
	#instVars : [
		'instance',
		'snippets'
	],
	#classInstVars : [
		'instance'
	],
	#category : #GT-Inspector,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTSnippets class>>instance [
	^ instance ifNil: [ instance := self new ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTSnippets class>>reset [
	instance := nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTSnippets class>>snippetAt: anObject [
	^ self instance snippetAt: anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTSnippets class>>snippetAt: anObject put: aString [
	^ self instance snippetAt: anObject put: aString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTSnippets>>snippetAt: anObject [
	^ self snippets 
		at: anObject 
		ifAbsent: [ 'self' ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTSnippets>>snippetAt: anObject put: aString [
	^ self snippets 
		at: anObject 
		put: aString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTSnippets>>snippetAtOrEmpty: anObject [
	^ self snippets 
		at: anObject 
		ifAbsent: [ '' ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GTSnippets>>snippets  [
	^ snippets ifNil: [ snippets := IdentityDictionary new ]
]
