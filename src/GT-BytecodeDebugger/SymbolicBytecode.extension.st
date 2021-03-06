Extension { #name : #SymbolicBytecode }

{ #category : #'*GT-BytecodeDebugger' }
SymbolicBytecode >> = anObject [

	self == anObject
		ifTrue: [^ true].

	(self class == anObject class)
		ifFalse: [^ false].

	^ (self bytes = anObject bytes) and: [ 
		(self description = anObject description) and: [ 
			(self method = anObject method) and: [ 
				self offset = anObject offset ] ] ]
]

{ #category : #'*GT-BytecodeDebugger' }
SymbolicBytecode >> hash [

	^ ((self bytes hash bitXor: self description hash) bitXor: 
			self method hash) bitXor: self offset hash 
]
