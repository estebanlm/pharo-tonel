"
Text converter for Japanese variation of EUC.
"
Class {
	#name : #EUCJPTextConverter,
	#superclass : #EUCTextConverter,
	#category : #Multilingual-OtherLanguages,
	#timestamp : '<historical>'
}

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 05:26:15'
}
EUCJPTextConverter class>>encodingNames  [

	^ #('euc-jp' 'eucjp') copy

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:15'
}
EUCJPTextConverter>>languageEnvironment [

	^ JapaneseEnvironment.

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:15'
}
EUCJPTextConverter>>leadingChar [

	^ JISX0208 leadingChar

]
