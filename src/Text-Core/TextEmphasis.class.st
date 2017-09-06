"
A TextEmphasis, encodes a characteristic applicable to all fonts.  The encoding is as follows:
	1	bold
	2	itallic
	4	underlined
	8	narrow
	16	struck out
"
Class {
	#name : #TextEmphasis,
	#superclass : #TextAttribute,
	#instVars : [
		'emphasisCode',
		'setMode'
	],
	#category : #Text-Core,
	#timestamp : '<historical>'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 07:16:16'
}
TextEmphasis class>>bold [
	^ self new emphasisCode: 1
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 07:16:16'
}
TextEmphasis class>>italic [
	^ self new emphasisCode: 2
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 07:16:16'
}
TextEmphasis class>>narrow [
	^ TextKern kern: -1
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 07:16:16'
}
TextEmphasis class>>normal [
	^ self new emphasisCode: 0
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 07:16:16'
}
TextEmphasis class>>struckOut [
	^ self new emphasisCode: 16
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 07:16:16'
}
TextEmphasis class>>underlined [
	^ self new emphasisCode: 4
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:16'
}
TextEmphasis>>= other  [
	^ (other class == self class) 
		and: [other emphasisCode = emphasisCode]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:16'
}
TextEmphasis>>dominatedByCmd0 [
	"Cmd-0 should turn off emphasis"
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:16'
}
TextEmphasis>>dominates: other [
	(emphasisCode = 0 and: [other dominatedByCmd0]) ifTrue: [^ true].
	^ (other class == self class)
		and: [emphasisCode = other emphasisCode]
]

{
	#category : #styling,
	#timestamp : ' 8/31/2017 07:16:16'
}
TextEmphasis>>emphasisCode [
	^ emphasisCode
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:16'
}
TextEmphasis>>emphasisCode: int [
	emphasisCode := int.
	setMode := true
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:16'
}
TextEmphasis>>hash [
	"#hash is re-implemented because #= is re-implemented"
	^emphasisCode hash

]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:16'
}
TextEmphasis>>printOn: strm [
	super printOn: strm.
	strm nextPutAll: ' code: '; print: emphasisCode
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:16'
}
TextEmphasis>>set [
	^ setMode and: [emphasisCode ~= 0]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:16'
}
TextEmphasis>>turnOff [
	setMode := false
]

{
	#category : #styling,
	#timestamp : ' 8/31/2017 07:16:16'
}
TextEmphasis>>writeScanOn: strm [

	emphasisCode = 1 ifTrue: [strm nextPut: $b].
	emphasisCode = 2 ifTrue: [strm nextPut: $i].
	emphasisCode = 0 ifTrue: [strm nextPut: $n].
	emphasisCode = 16 ifTrue: [strm nextPut: $=].
	emphasisCode = 4 ifTrue: [strm nextPut: $u].
]
