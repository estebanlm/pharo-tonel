Extension { #name : #CharacterScanner }

{ #category : #'*Multilingual-OtherLanguages' }
CharacterScanner >> isBreakableAt: index [ in: sourceString in: encodingClass
"check with the encoding whether the character at index is a breakable character.
Only the JISX0208 & JapaneseEnvironments  ever return true, so only the scanJapaneseCharacters... method calls this"
	^ encodingClass isBreakableAt: index in: sourceString.

]

{ #category : #'*Multilingual-OtherLanguages' }
CharacterScanner >> registerBreakableIndex [

	"Record left x and character index of the line-wrappable point. 
	The default implementation here does nothing."

	^ false.

]

{ #category : #'*Multilingual-OtherLanguages' }
CharacterScanner >> scanJapaneseCharactersFrom: startIndex to: stopIndex in: sourceString rightX: rightX [ 
"this is a scanning method for
multibyte Japanese characters in a WideString - hence the isBreakable:in:in:
a font that does not do character-pair kerning "

	| ascii encoding nextDestX startEncoding char charset |
	lastIndex := startIndex.
	lastIndex > stopIndex ifTrue: [^self handleEndOfRunAt: stopIndex].
	startEncoding := (sourceString at: startIndex) leadingChar.
	charset := EncodedCharSet charsetAt: startEncoding.
	[lastIndex <= stopIndex] whileTrue: [
		char := sourceString at: lastIndex.
		encoding := char leadingChar.
		encoding ~= startEncoding
			ifTrue: [lastIndex := lastIndex - 1. ^#endOfRun].
		ascii := char charCode.
		(encoding = 0 and: [ascii < 256 and:[(stopConditions at: ascii + 1) ~~ nil]]) 
			ifTrue: [^ stopConditions at: ascii + 1].
		(self isBreakableAt: lastIndex in: sourceString in: charset)
			ifTrue: [	self registerBreakableIndex].
		nextDestX := destX + (font widthOf: char).
		nextDestX > rightX
			ifTrue: [^#crossedX].
		destX := nextDestX + kern.
		lastIndex := lastIndex + 1.
	].
	^self handleEndOfRunAt: stopIndex
]
