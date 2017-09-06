"
Text converter for Simplified Chinese variation of EUC.  (Even though the name doesn't look so, it is what it is.)
"
Class {
	#name : #CNGBTextConverter,
	#superclass : #EUCTextConverter,
	#category : #Multilingual-OtherLanguages,
	#timestamp : '<historical>'
}

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 05:26:15'
}
CNGBTextConverter class>>encodingNames  [

	^ #('gb2312' ) copy

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:15'
}
CNGBTextConverter>>languageEnvironment [

	^ SimplifiedChineseEnvironment.

]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:15'
}
CNGBTextConverter>>leadingChar [

	^ GB2312 leadingChar

]
