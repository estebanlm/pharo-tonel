"
This class provides the Japanese support.  Since it has been used most other than default 'latin-1' languages, this tends to be a good place to look at when you want to know what a typical subclass of LanguageEnvironment should do.

"
Class {
	#name : #JapaneseEnvironment,
	#superclass : #LanguageEnvironment,
	#category : #Multilingual-OtherLanguages,
	#timestamp : '<historical>'
}

{
	#category : #'language methods',
	#timestamp : ' 8/31/2017 05:26:15'
}
JapaneseEnvironment class>>fromJISX0208String: aString [

	^ aString collect: [:each | Character leadingChar: JapaneseEnvironment leadingChar code: (each asUnicode)].

]

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 05:26:15'
}
JapaneseEnvironment class>>initialize [
	EncodedCharSet declareEncodedCharSet: self atIndex: 5+1.
]

{
	#category : #'rendering support',
	#timestamp : ' 8/31/2017 05:26:15'
}
JapaneseEnvironment class>>isBreakableAt: index in: text [

	| prev |
	index = 1 ifTrue: [^ false].
	prev := text at: index - 1.
	prev leadingChar ~= JapaneseEnvironment leadingChar ifTrue: [^ true].
	^ (('、。，．・：；？！゛゜´｀¨＾―‐／\〜‖｜…‥’”）〕］｝〉》」』】°′″℃' includes: (text at: index)) or: ['‘“（〔［｛〈《「『【°′″℃＠§' includes: prev]) not.

]

{
	#category : #'subclass responsibilities',
	#timestamp : ' 8/31/2017 05:26:15'
}
JapaneseEnvironment class>>leadingChar [

	^ 5.

]

{
	#category : #'language methods',
	#timestamp : ' 8/31/2017 05:26:15'
}
JapaneseEnvironment class>>scanMultibyteCharactersFrom: startIndex to: stopIndex in: aWideString with: aCharacterScanner rightX: rightX font: aFont [
	"scanning multibyte Japanese strings"
	^aFont scanMultibyteJapaneseCharactersFrom: startIndex to: stopIndex in: aWideString with: aCharacterScanner rightX: rightX
]

{
	#category : #'language methods',
	#timestamp : ' 8/31/2017 05:26:15'
}
JapaneseEnvironment class>>scanSelector [

	^ #scanJapaneseCharactersFrom:to:in:rightX:stopConditions:kern:

]

{
	#category : #'subclass responsibilities',
	#timestamp : ' 8/31/2017 05:26:15'
}
JapaneseEnvironment class>>supportedLanguages [
	"Return the languages that this class supports. 
	Any translations for those languages will use this class as their environment."
	
	^#('ja' 'ja-etoys' )
]

{
	#category : #'subclass responsibilities',
	#timestamp : ' 8/31/2017 05:26:15'
}
JapaneseEnvironment class>>systemConverterClass [
	| encoding |

	Smalltalk os isWin32 
		ifTrue: [^ShiftJISTextConverter].
	Smalltalk os isMacOS
		ifTrue: [^UTF8TextConverter].
	Smalltalk os isUnix
		ifTrue: 
			[encoding := X11Encoding encoding.
			encoding ifNil: [^EUCJPTextConverter].
			(encoding = 'utf-8') 
				ifTrue: [^UTF8TextConverter].				
			(encoding = 'shiftjis' or: [ encoding = 'sjis' ]) 
				ifTrue: [^ShiftJISTextConverter].				
			^EUCJPTextConverter].
	^UTF8TextConverter
]

{
	#category : #'language methods',
	#timestamp : ' 8/31/2017 05:26:15'
}
JapaneseEnvironment class>>traditionalCharsetClass [

	^ JISX0208.

]
