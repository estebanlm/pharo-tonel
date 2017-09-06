"
Model for a find and replace service in editors
"
Class {
	#name : #FindReplaceService,
	#superclass : #Model,
	#instVars : [
		'findText',
		'replaceText',
		'caseSensitive',
		'entireWordsOnly',
		'wrapAround',
		'searchBackwards',
		'findStartIndex',
		'isRegex'
	],
	#classVars : [
		'Singleton'
	],
	#category : #Text-Edition,
	#timestamp : 'TorstenBergmann 1/31/2014 12:21'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
FindReplaceService class>>default [
	^ EditorFindReplaceDialogWindow singleton state

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
FindReplaceService>>caseSensitive [
	^ caseSensitive ifNil: [caseSensitive := TextEditor caseSensitiveFinds]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
FindReplaceService>>caseSensitive: aBoolean [
	caseSensitive := aBoolean.
	self changed: #findPolicy
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
FindReplaceService>>convertedFindString [
	| specials |
	specials := '^$:\+*[](){}'.
	^String 
		streamContents: [:s | self findString 
			do: [:c | (specials includes: c) ifTrue: [s nextPut:$\].
				s nextPut: c]]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
FindReplaceService>>entireWordsOnly [
	^ entireWordsOnly ifNil: [entireWordsOnly := false]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
FindReplaceService>>entireWordsOnly: aBoolean [
	entireWordsOnly := aBoolean.
	self changed: #findPolicy
]

{
	#category : #services,
	#timestamp : ' 8/31/2017 05:26:16'
}
FindReplaceService>>findInTextMorph: aTextMorph [
	| where  |
	findStartIndex 
		ifNil: [findStartIndex := self searchBackwards 
			ifTrue: [aTextMorph editor stopIndex]
			ifFalse: [aTextMorph editor startIndex]].
	findStartIndex > 0 
		ifTrue: [where := aTextMorph
			findAndSelect: self findRegex
			startingAt: findStartIndex
			searchBackwards: self searchBackwards].
	(where isNil and: [self wrapAround])
		ifTrue: [ | idx |
			idx := self searchBackwards ifTrue: [aTextMorph editor string size] ifFalse: [1].
			where := aTextMorph
				findAndSelect: self findRegex
				startingAt: idx
				searchBackwards: self searchBackwards].
	where ifNil: [aTextMorph flash].
	^ where

]

{
	#category : #services,
	#timestamp : ' 8/31/2017 05:26:16'
}
FindReplaceService>>findNextSubstring: aSubstring inTextMorph: aTextMorph [
	| where  |
	findStartIndex 
		ifNil: [findStartIndex := aTextMorph editor startIndex].
	findStartIndex > 0 
		ifTrue: [where := aTextMorph findNextString: aSubstring asString startingAt: findStartIndex].
	(where isNil and: [self wrapAround])
		ifTrue: [where := aTextMorph findNextString: aSubstring asString startingAt: 1].
	^ where

]

{
	#category : #services,
	#timestamp : ' 8/31/2017 05:26:16'
}
FindReplaceService>>findRegex [
	| s |
	s := self entireWordsOnly
		ifTrue: ['\<', self regexString, '\>']
		ifFalse: [ self regexString].
	[^ self caseSensitive
			ifTrue: [s asRegex]
			ifFalse: [s asRegexIgnoringCase]]
		on: Error 
		do: [self changed: #regexError. 
			^ '' asRegex]

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
FindReplaceService>>findStartIndex [
	^ findStartIndex
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
FindReplaceService>>findStartIndex: anInteger [
	findStartIndex := anInteger
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
FindReplaceService>>findString [
	^ self findText asString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
FindReplaceService>>findText [
	^ (findText ifNil: [findText := '' asText. findText]) asString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
FindReplaceService>>findText: aStringOrText [
	findText := aStringOrText asText.
	self changed: #findPolicy
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
FindReplaceService>>findText: aStringOrText isRegex: aBoolean [
		self isRegex: aBoolean.
		self findText: aStringOrText.
		self replaceText: ''.

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
FindReplaceService>>findText: aStringOrText isRegex: isReg caseSensitive: isCaseSensitive entireWordsOnly: forEntireWordsOnly [
		self isRegex: isReg.
		self findText: aStringOrText.
		self entireWordsOnly: forEntireWordsOnly.
		self caseSensitive: isCaseSensitive
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
FindReplaceService>>findText: aStringOrText isRegex: aBoolean entireWordsOnly: forEntireWordsOnly [
		self isRegex: aBoolean.
		self findText: aStringOrText.
		self entireWordsOnly: forEntireWordsOnly
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
FindReplaceService>>findTextSilently: aStringOrText [
	findText := aStringOrText asText.
	self changed: #findText
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
FindReplaceService>>isRegex [
	^ isRegex ifNil: [isRegex := false]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
FindReplaceService>>isRegex: aBoolean [
	isRegex := aBoolean.
	self changed: #findPolicy

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
FindReplaceService>>regexString [
	^ self isRegex 
		ifTrue: [self findString]
		ifFalse: [self convertedFindString]

]

{
	#category : #services,
	#timestamp : ' 8/31/2017 05:26:16'
}
FindReplaceService>>replaceAllInTextMorph: aTextMorph [
	| startIdx |
	startIdx := self wrapAround ifTrue: [1] ifFalse: [aTextMorph editor selectionInterval first].
	aTextMorph replaceAll: self findRegex with: self replaceText startingAt: startIdx

]

{
	#category : #services,
	#timestamp : ' 8/31/2017 05:26:16'
}
FindReplaceService>>replaceInTextMorph: aTextMorph [

	findStartIndex := self searchBackwards 
		ifTrue: [aTextMorph editor stopIndex] 
		ifFalse: [aTextMorph editor startIndex].
	(self findInTextMorph: aTextMorph)
		ifNotNil: [aTextMorph replaceSelectionWith: self replaceText]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
FindReplaceService>>replaceText [
	^ replaceText ifNil: [replaceText := '']
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
FindReplaceService>>replaceText: aStringOrText [
	replaceText := aStringOrText asString.
	self changed: #findPolicy

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
FindReplaceService>>searchBackwards [
	^ searchBackwards ifNil: [searchBackwards := false]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
FindReplaceService>>searchBackwards: aBoolean [
	searchBackwards := aBoolean.
	self changed: #findPolicy

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
FindReplaceService>>selectionRegexString [
	^ self convertedFindString

]

{
	#category : #updating,
	#timestamp : ' 8/31/2017 05:26:16'
}
FindReplaceService>>updateFindStartIndexForTextMorph: aTextMorph [
	| si |
	si := aTextMorph editor selectionInterval.
	self findStartIndex: (self searchBackwards ifTrue: [si first - 1] ifFalse: [si last + 1])
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
FindReplaceService>>wrapAround [
	^ wrapAround ifNil: [wrapAround := true]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:16'
}
FindReplaceService>>wrapAround: aBoolean [
	wrapAround := aBoolean.
	self changed: #findPolicy


]
