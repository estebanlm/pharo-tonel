"
I am a simple cache for AST nodes corresponding to CompiledMethods in the image. The cache is emptied when the image is saved.
"
Class {
	#name : #ASTCache,
	#superclass : #WeakIdentityKeyDictionary,
	#classInstVars : [
		'default'
	],
	#category : #AST-Core-Parser,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
ASTCache class>>at: aCompiledMethod [
	^ default at: aCompiledMethod
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
ASTCache class>>default [
	^ default
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
ASTCache class>>default: anASTCache [
	default := anASTCache.
]

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 07:16:40'
}
ASTCache class>>initialize [
	default := self new.
	SessionManager default registerSystemClassNamed: self name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
ASTCache class>>reset [
	default reset.
	SystemAnnouncer uniqueInstance announce: ASTCacheReset new 
]

{
	#category : #'system startup',
	#timestamp : ' 8/31/2017 07:16:40'
}
ASTCache class>>shutDown	 [
	self reset
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
ASTCache>>at: aCompiledMethod [
	^ self 
		at: aCompiledMethod
		ifAbsentPut: [ 
			aCompiledMethod parseTree doSemanticAnalysisIn: aCompiledMethod methodClass ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:40'
}
ASTCache>>reset [
	self removeAll
]
