Extension {
	#name : #Symbol
}

{
	#category : #'*Slot',
	#timestamp : ' 8/31/2017 07:16:35'
}
Symbol>>=> aVariable [
	aVariable isBehavior
		ifTrue: [ ^ aVariable named: self].
	^ aVariable name: self;
		yourself
]

{
	#category : #'*Slot',
	#timestamp : ' 8/31/2017 07:16:35'
}
Symbol>>asClassVariable [
	^ ClassVariable named: self.
]

{
	#category : #'*Slot',
	#timestamp : ' 8/31/2017 07:16:35'
}
Symbol>>asSlot [
	^ InstanceVariableSlot named: self.
]

{
	#category : #'*Slot',
	#timestamp : ' 8/31/2017 07:16:35'
}
Symbol>>isPseudovariableName [
	"Answer true if I am a pseudo-variable name.
	#self isPseudovariableName -> true
	"
	^ self class pseudovariablesNames includes: self
]

{
	#category : #'*Slot',
	#timestamp : ' 8/31/2017 07:16:35'
}
Symbol class>>pseudovariablesNames [
	^#('self' 'true' 'false' 'nil' 'thisContext' 'super')
]
