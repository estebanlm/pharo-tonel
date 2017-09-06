"
A TextKern encodes a kerning change applicable over a given range of text.  Positive values of kern spread letters out, negative kern will cause them to overlap more.  Note that kerns other than 0 will display somewhat slower, as kerning is not yet supported in the text scanning primitive. 
"
Class {
	#name : #TextKern,
	#superclass : #TextAttribute,
	#instVars : [
		'kern',
		'active'
	],
	#category : #Text-Core,
	#timestamp : '<historical>'
}

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 07:16:16'
}
TextKern class>>kern: kernValue [
	^ self new kern: kernValue
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 07:16:16'
}
TextKern>>= other  [
	^ (other class == self class) 
		and: [other kern = kern]
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 07:16:16'
}
TextKern>>dominatedByCmd0 [
	"Cmd-0 should turn off kerning"
	^ true
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 07:16:16'
}
TextKern>>dominates: other [
	"NOTE: The use of active in this code is specific to its use in the method
		Text class addAttribute: att toArray: others"
	(active and: [other class == self class and: [other kern + kern = 0]])
		ifTrue: [active := false.  ^ true].  "can only dominate once"
	^ false
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 07:16:16'
}
TextKern>>hash [
	"#hash is re-implemented because #= is re-implemented"
	^kern hash
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:16'
}
TextKern>>isKern [
	^true
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 07:16:16'
}
TextKern>>kern [
	^ kern
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 07:16:16'
}
TextKern>>kern: kernValue [
	kern := kernValue.
	self reset.
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 07:16:16'
}
TextKern>>reset [
	active := true
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 07:16:16'
}
TextKern>>set [
	^ active
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 07:16:16'
}
TextKern>>writeScanOn: strm [

	kern > 0 ifTrue: [
		1 to: kern do: [:kk | strm nextPut: $+]].
	kern < 0 ifTrue: [
		1 to: 0-kern do: [:kk | strm nextPut: $-]].
]
