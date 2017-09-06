"
Text converter for Korean variation of EUC.
"
Class {
	#name : #EUCKRTextConverter,
	#superclass : #EUCTextConverter,
	#category : #Multilingual-OtherLanguages,
	#timestamp : '<historical>'
}

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 05:26:15'
}
EUCKRTextConverter class>>encodingNames  [

	^ #('euc-kr' 'ks-c-5601-1987' 'euckr') copy

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:15'
}
EUCKRTextConverter>>languageEnvironment [

	^ KoreanEnvironment.

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:15'
}
EUCKRTextConverter>>leadingChar [

	^ KSX1001 leadingChar

]
