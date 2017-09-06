Extension {
	#name : #RGCommentDefinition
}

{
	#category : #'*Text-Core',
	#timestamp : ' 8/31/2017 07:16:16'
}
RGCommentDefinition>>asStringOrText [
	| text |
	self realClass ifNil: [ ^ self fullName ].
	text := self fullName asText.
	text addAttribute: TextEmphasis italic.
	^ text
]
