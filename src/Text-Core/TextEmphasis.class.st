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
	#category : #Text-Core
}

{ #category : #'as yet unclassified' }
TextEmphasis class >> bold [
	^ self new emphasisCode: 1
]

{ #category : #'as yet unclassified' }
TextEmphasis class >> italic [
	^ self new emphasisCode: 2
]

{ #category : #'as yet unclassified' }
TextEmphasis class >> narrow [
	^ TextKern kern: -1
]

{ #category : #'as yet unclassified' }
TextEmphasis class >> normal [
	^ self new emphasisCode: 0
]

{ #category : #'as yet unclassified' }
TextEmphasis class >> struckOut [
	^ self new emphasisCode: 16
]

{ #category : #'as yet unclassified' }
TextEmphasis class >> underlined [
	^ self new emphasisCode: 4
]

{ #category : #comparing }
TextEmphasis >> = other [ 
	^ (other class == self class) 
		and: [other emphasisCode = emphasisCode]
]

{ #category : #testing }
TextEmphasis >> dominatedByCmd0 [
	"Cmd-0 should turn off emphasis"
	^ true
]

{ #category : #accessing }
TextEmphasis >> dominates: other [
	(emphasisCode = 0 and: [other dominatedByCmd0]) ifTrue: [^ true].
	^ (other class == self class)
		and: [emphasisCode = other emphasisCode]
]

{ #category : #styling }
TextEmphasis >> emphasisCode [
	^ emphasisCode
]

{ #category : #accessing }
TextEmphasis >> emphasisCode: int [
	emphasisCode := int.
	setMode := true
]

{ #category : #comparing }
TextEmphasis >> hash [
	"#hash is re-implemented because #= is re-implemented"
	^emphasisCode hash

]

{ #category : #printing }
TextEmphasis >> printOn: strm [
	super printOn: strm.
	strm nextPutAll: ' code: '; print: emphasisCode
]

{ #category : #accessing }
TextEmphasis >> set [
	^ setMode and: [emphasisCode ~= 0]
]

{ #category : #accessing }
TextEmphasis >> turnOff [
	setMode := false
]

{ #category : #styling }
TextEmphasis >> writeScanOn: strm [

	emphasisCode = 1 ifTrue: [strm nextPut: $b].
	emphasisCode = 2 ifTrue: [strm nextPut: $i].
	emphasisCode = 0 ifTrue: [strm nextPut: $n].
	emphasisCode = 16 ifTrue: [strm nextPut: $=].
	emphasisCode = 4 ifTrue: [strm nextPut: $u].
]
