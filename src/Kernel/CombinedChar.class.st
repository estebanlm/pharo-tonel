"
Compositions classVar is a:
<Dictionary
       key: firstLetter charCode
       value: (Dictionary
             	  key: diacritical charCode
              	 value: combined charCode)>
	
combined instVar is a <Character>
"
Class {
	#name : #CombinedChar,
	#superclass : #Object,
	#instVars : [
		'codes',
		'combined'
	],
	#classVars : [
		'Compositions',
		'Decompositions',
		'Diacriticals'
	],
	#category : #Kernel-BasicObjects,
	#timestamp : 'StephaneDucasse 3/27/2010 21:50'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:33'
}
CombinedChar class>>isCompositionCharacter: charCode [
	^Compositions includesKey: charCode
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:33'
}
CombinedChar class>>isDiacriticals: unicode [

	^ Diacriticals includes: unicode.

]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:33'
}
CombinedChar class>>parseCompositionMappingFrom: stream [
"
	self parseCompositionMapping
"
	| line fieldEnd point fieldStart compositions toNumber diacritical result |

	toNumber := [:quad | ('16r', quad) asNumber].

	Compositions := IdentityDictionary new: 2048.
	Decompositions := IdentityDictionary new: 2048.
	Diacriticals := IdentitySet new: 2048.

	[(line := stream nextLine) notNil] whileTrue: [
		fieldEnd := line indexOf: $; startingAt: 1.
		point := ('16r', (line copyFrom: 1 to: fieldEnd - 1)) asNumber.
		2 to: 6 do: [:i |
			fieldStart := fieldEnd + 1.
			fieldEnd := line indexOf: $; startingAt: fieldStart.
		].
		compositions := line copyFrom: fieldStart to: fieldEnd - 1.
		(compositions size > 0 and: [compositions first ~= $<]) ifTrue: [
			compositions := compositions substrings collect: toNumber.
			compositions size > 1 ifTrue: [
				diacritical := compositions first.
				Diacriticals add: diacritical.
				result := compositions second.
				(Decompositions includesKey: point) ifTrue: [
					self error: 'should not happen'.
				] ifFalse: [
					Decompositions at: point put: (Array with: diacritical with: result).
				].
				(Compositions includesKey: diacritical) ifTrue: [
					(Compositions at: diacritical) at: result put: point.
				] ifFalse: [
					Compositions at: diacritical
						put: (IdentityDictionary new at: result put: point; yourself).
				].
			].
		].
	].

]

{
	#category : #composition,
	#timestamp : ' 8/31/2017 07:16:33'
}
CombinedChar>>add: char [

	| dict elem |
	codes ifNil: 
			[ codes := Array with: char. 
			combined := char. 
			^ true].
	dict := Compositions at: combined charCode ifAbsent: [^ false].
	elem := dict at: char charCode ifAbsent: [^ false].
	codes := codes copyWith: char.
	combined := Character leadingChar: self base leadingChar code: elem.
	^ true

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
CombinedChar>>base [

	^ codes first

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
CombinedChar>>combined [

	^ combined

]

{
	#category : #composition,
	#timestamp : ' 8/31/2017 07:16:33'
}
CombinedChar>>combinesWith: char [

	| dict |
	codes ifNil: [^false].
	dict := Compositions at: combined charCode ifAbsent: [^false].
	dict at: char charCode ifAbsent: [^false].
	^true

]

{
	#category : #composition,
	#timestamp : ' 8/31/2017 07:16:33'
}
CombinedChar>>simpleAdd: char [

	| dict elem |
	codes ifNil: 
		[codes := Array with: char. 
		combined := char. 
		^ true].
	dict := Compositions at: combined charCode ifAbsent: [^ false].
	elem := dict at: char charCode ifAbsent: [^ false].
	combined := Character leadingChar: self base leadingChar code: elem.
	codes at: 1 put: combined.
	^ true

]
