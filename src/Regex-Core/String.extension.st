Extension {
	#name : #String
}

{
	#category : #'*Regex-Core',
	#timestamp : ' 8/31/2017 07:16:22'
}
String>>allRangesOfRegexMatches: rxString [

	^rxString asRegex matchingRangesIn: self
]

{
	#category : #'*Regex-Core',
	#timestamp : ' 8/31/2017 07:16:22'
}
String>>allRegexMatches: rxString [

	^rxString asRegex matchesIn: self
]

{
	#category : #'*Regex-Core',
	#timestamp : ' 8/31/2017 07:16:22'
}
String>>asRegex [
	"Compile the receiver as a regex matcher. May raise RxParser>>syntaxErrorSignal
	or RxParser>>compilationErrorSignal.
	This is a part of the Regular Expression Matcher package, (c) 1996, 1999 Vassili Bykov.
	Refer to `documentation' protocol of RxParser class for details."

	^RxParser preferredMatcherClass for: (RxParser new parse: self)
]

{
	#category : #'*Regex-Core',
	#timestamp : ' 8/31/2017 07:16:22'
}
String>>asRegexIgnoringCase [
	"Compile the receiver as a regex matcher. May raise RxParser>>syntaxErrorSignal
	or RxParser>>compilationErrorSignal.
	This is a part of the Regular Expression Matcher package, (c) 1996, 1999 Vassili Bykov.
	Refer to `documentation' protocol of RxParser class for details."

	^RxParser preferredMatcherClass
		for: (RxParser new parse: self)
		ignoreCase: true
]

{
	#category : #'*Regex-Core',
	#timestamp : ' 8/31/2017 07:16:22'
}
String>>copyWithRegex: rxString matchesReplacedWith: aString [

	^rxString asRegex
		copy: self replacingMatchesWith: aString
]

{
	#category : #'*Regex-Core',
	#timestamp : ' 8/31/2017 07:16:22'
}
String>>copyWithRegex: rxString matchesTranslatedUsing: aBlock [

	^rxString asRegex
		copy: self translatingMatchesUsing: aBlock
]

{
	#category : #'*Regex-Core',
	#timestamp : ' 8/31/2017 07:16:22'
}
String>>matchesRegex: regexString [
	"Test if the receiver matches a regex.  May raise RxParser>>regexErrorSignal or
	child signals.
	This is a part of the Regular Expression Matcher package, (c) 1996, 1999 Vassili Bykov.
	Refer to `documentation' protocol of RxParser class for details."

	^regexString asRegex matches: self
]

{
	#category : #'*Regex-Core',
	#timestamp : ' 8/31/2017 07:16:22'
}
String>>matchesRegexIgnoringCase: regexString [
	"Test if the receiver matches a regex.  May raise RxParser>>regexErrorSignal or
	child signals.
	This is a part of the Regular Expression Matcher package, (c) 1996, 1999 Vassili Bykov.
	Refer to `documentation' protocol of RxParser class for details."

	^regexString asRegexIgnoringCase matches: self
]

{
	#category : #'*Regex-Core',
	#timestamp : ' 8/31/2017 07:16:22'
}
String>>prefixMatchesRegex: regexString [
	"Test if the receiver's prefix matches a regex.	
	May raise RxParser class>>regexErrorSignal or child signals.
	This is a part of the Regular Expression Matcher package, (c) 1996, 1999 Vassili Bykov.
	Refer to `documentation' protocol of RxParser class for details."

	^regexString asRegex matchesPrefix: self
]

{
	#category : #'*Regex-Core',
	#timestamp : ' 8/31/2017 07:16:22'
}
String>>prefixMatchesRegexIgnoringCase: regexString [
	"Test if the receiver's prefix matches a regex.	
	May raise RxParser class>>regexErrorSignal or child signals.
	This is a part of the Regular Expression Matcher package, (c) 1996, 1999 Vassili Bykov.
	Refer to `documentation' protocol of RxParser class for details."

	^regexString asRegexIgnoringCase matchesPrefix: self
]

{
	#category : #'*Regex-Core',
	#timestamp : ' 8/31/2017 07:16:22'
}
String>>regex: rxString matchesCollect: aBlock [

	^rxString asRegex matchesIn: self collect: aBlock
]

{
	#category : #'*Regex-Core',
	#timestamp : ' 8/31/2017 07:16:22'
}
String>>regex: rxString matchesDo: aBlock [

	^rxString asRegex matchesIn: self do: aBlock
]

{
	#category : #'*Regex-Core',
	#timestamp : ' 8/31/2017 07:16:22'
}
String>>search: aString [
	"compatibility method to make regexp and strings work polymorphicly"
	^ aString includesSubstring: self
]
