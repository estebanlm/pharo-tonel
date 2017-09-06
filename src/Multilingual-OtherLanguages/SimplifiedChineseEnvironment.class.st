"
This class provides the Simplified Chinese support (Used mainly in Mainland China).  Unfortunately, we haven't tested this yet, but as soon as we find somebody who understand the language, probably we can make it work in two days or so, as we have done for Czech support.
"
Class {
	#name : #SimplifiedChineseEnvironment,
	#superclass : #LanguageEnvironment,
	#category : #Multilingual-OtherLanguages,
	#timestamp : '<historical>'
}

{
	#category : #'class initialization',
	#timestamp : ' 8/31/2017 05:26:15'
}
SimplifiedChineseEnvironment class>>initialize [

	EncodedCharSet declareEncodedCharSet: self atIndex: 6+1.
]

{
	#category : #'subclass responsibilities',
	#timestamp : ' 8/31/2017 05:26:15'
}
SimplifiedChineseEnvironment class>>leadingChar [

	^0
]

{
	#category : #'subclass responsibilities',
	#timestamp : ' 8/31/2017 05:26:15'
}
SimplifiedChineseEnvironment class>>supportedLanguages [
	"Return the languages that this class supports. 
	Any translations for those languages will use this class as their environment."
	
	^#('zh' )
]

{
	#category : #'language methods',
	#timestamp : ' 8/31/2017 05:26:15'
}
SimplifiedChineseEnvironment class>>traditionalCharsetClass [

	^ GB2312

]
