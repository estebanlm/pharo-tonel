Extension {
	#name : #ProtoObject
}

{
	#category : #'*Glamour-Helpers',
	#timestamp : ' 8/31/2017 05:26:33'
}
ProtoObject>>asGlamorousArray  [
	 
	^Array with: self
]

{
	#category : #'*Glamour-Helpers',
	#timestamp : ' 8/31/2017 05:26:33'
}
ProtoObject>>asGlamorousMultiValue [
	^ GLMMultiValue with: self
]

{
	#category : #'*Glamour-Helpers',
	#timestamp : ' 8/31/2017 05:26:33'
}
ProtoObject>>glamourValue: anObject  [
	 
	| args | 
	args := anObject asGlamorousArray. 
	^self glamourValueWithArgs: args
]

{
	#category : #'*Glamour-Helpers',
	#timestamp : ' 8/31/2017 05:26:33'
}
ProtoObject>>glamourValueWithArgs: anArray  [
	 
	^self
]
