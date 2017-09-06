Extension {
	#name : #RGMethodDefinition
}

{
	#category : #'*Text-Core',
	#timestamp : ' 8/31/2017 07:16:16'
}
RGMethodDefinition>>asStringOrText [

	| text |
	self realClass ifNil: [ ^self fullName ].
	text := (self fullName,' {', (self protocol ifNil: ['']), '} ') asText.
	self isLocalSelector
		ifFalse: [ text addAttribute: TextEmphasis italic ].
	^ text
]
