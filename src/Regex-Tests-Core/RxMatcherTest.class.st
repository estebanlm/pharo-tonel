"
This class provides tests for the regular expression matcher.
"
Class {
	#name : #RxMatcherTest,
	#superclass : #TestCase,
	#category : #Regex-Tests-Core,
	#timestamp : 'Tbn 11/12/2010 22:31'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest class>>packageNamesUnderTest [
	^ #('VB-Regex')
]

{
	#category : #utilties,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>compileRegex: aString [
	"Compile the regex and answer the matcher, or answer nil if compilation fails."

	| syntaxTree |
	syntaxTree := RxParser safelyParse: aString.
	^ syntaxTree isNil ifFalse: [ self matcherClass for: syntaxTree ]
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>henryReadme [
	self error: 'The tests in this category are based on the ones in Henry Spencer''s regexp.c package.'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>matcherClass [
	^ RxMatcher
]

{
	#category : #utilties,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>runMatcher: aMatcher with: aString expect: aBoolean withSubexpressions: anArray [
	| copy got |
	copy := aMatcher
		copy: aString
		translatingMatchesUsing: [ :each | each ].
	self 
		assert: copy = aString
		description: 'Copying: expected ' , aString printString , ', but got ' , copy printString.
	got := aMatcher search: aString.
	self
		assert: got = aBoolean 
		description: 'Searching: expected ' , aBoolean printString , ', but got ' , got printString.
	(anArray isNil or: [ aMatcher supportsSubexpressions not ])
		ifTrue: [ ^ self ].
	1 to: anArray size by: 2 do: [ :index |
		| sub subExpect subGot |
		sub := anArray at: index.
		subExpect := anArray at: index + 1.
		subGot := aMatcher subexpression: sub.
		self
			assert: subExpect = subGot
			description: 'Subexpression ' , sub printString , ': expected ' , subExpect printString , ', but got ' , subGot printString ]
]

{
	#category : #utilties,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>runRegex: anArray [
	"Run a clause anArray against a set of tests. Each clause is an array with a regex source string followed by sequence of 3-tuples. Each three-element group is one test to try against the regex, and includes: 1) test string; 2) expected result; 3) expected subexpression as an array of (index, substring), or nil."

	| source matcher |
	source := anArray first.
	matcher := self compileRegex: source.
	matcher isNil
		ifTrue: [
			(anArray at: 2) isNil
				ifFalse: [ self signalFailure: 'Compilation failed, should have succeeded: ' , source printString ] ]
		ifFalse: [
			(anArray at: 2) isNil
				ifTrue: [ self signalFailure: 'Compilation succeeded, should have failed: ' , source printString ]
				ifFalse: [
					2 to: anArray size by: 3 do: [ :index | 
						self 
							runMatcher: matcher
							with: (anArray at: index)
							expect: (anArray at: index + 1)
							withSubexpressions: (anArray at: index + 2) ] ] ]
]

{
	#category : #testing-protocol,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testCaseInsensitive [
	| matcher |
	matcher := self matcherClass forString: 'the quick brown fox' ignoreCase: true.
	self assert: (matcher search: 'the quick brown fox').
	self assert: (matcher search: 'The quick brown FOX').
	self assert: (matcher search: 'What do you know about the quick brown fox?').
	self assert: (matcher search: 'What do you know about THE QUICK BROWN FOX?')
]

{
	#category : #testing-protocol,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testCaseSensitive [
	| matcher |
	matcher := self matcherClass forString: 'the quick brown fox' ignoreCase: false.
	self assert: (matcher search: 'the quick brown fox').
	self deny: (matcher search: 'The quick brown FOX').
	self assert: (matcher search: 'What do you know about the quick brown fox?').
	self deny: (matcher search: 'What do you know about THE QUICK BROWN FOX?')
]

{
	#category : #testing-protocol,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testCopyReplacingMatches [
	"See that the match context is preserved while copying stuff between matches:"
	
	| matcher |
	matcher := self matcherClass forString: '\<\d\D+'.
	self assert: (matcher copy: '9aaa1bbb 8ccc' replacingMatchesWith: 'foo')
		= 'foo1bbb foo'
]

{
	#category : #testing-protocol,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testCopyTranslatingMatches [
	| matcher |
	matcher := self matcherClass forString: '\w+'.
	self assert: (matcher copy: 'now is  the   time    ' translatingMatchesUsing: [ :each | each reversed ])
		= 'won si  eht   emit    '
]

{
	#category : #testing-empty,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testEmptyStringAtBeginningOfLine [
	| matcher |
	matcher := self matcherClass forString: '^'.
	self
		assert: (matcher copy: 'foo1 bar1' , String cr , 'foo2 bar2' replacingMatchesWith: '*')
			= ('*foo1 bar1' , String cr , '*foo2 bar2')
		description: 'An empty string at the beginning of a line'
]

{
	#category : #testing-empty,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testEmptyStringAtBeginningOfWord [
	| matcher |
	matcher := self matcherClass forString: '\<'.
	self
		assert: (matcher copy: 'foo bar' replacingMatchesWith: '*')
			= '*foo *bar'
		description: 'An empty string at the beginning of a word'
]

{
	#category : #testing-empty,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testEmptyStringAtEndOfLine [
	| matcher |
	matcher := self matcherClass forString: '$'.
	self
		assert: (matcher copy: 'foo1 bar1' , String cr , 'foo2 bar2' replacingMatchesWith: '*')
			= ('foo1 bar1*', String cr , 'foo2 bar2*')
		description: 'An empty string at the end of a line'
]

{
	#category : #testing-empty,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testEmptyStringAtEndOfWord [
	| matcher |
	matcher := self matcherClass forString: '\>'.
	self
		assert: (matcher copy: 'foo bar' replacingMatchesWith: '*')
			= 'foo* bar*'
		description: 'An empty string at the end of a word'
]

{
	#category : #testing-empty,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testEmptyStringAtWordBoundary [
	| matcher |
	matcher := self matcherClass forString: '\b'.
	self
		assert: (matcher copy: 'foo bar' replacingMatchesWith: '*')
			= '*foo* *bar*'
		description: 'An empty string at a word boundary'
]

{
	#category : #testing-empty,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testEmptyStringNotAtWordBoundary [
	| matcher |
	matcher := self matcherClass forString: '\B'.
	self
		assert: (matcher copy: 'foo bar' replacingMatchesWith: '*')
			= 'f*o*o b*a*r'
		description: 'An empty string not at a word boundary'
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry001 [
	self runRegex: #('abc'
		'abc' true (1 'abc')
		'xbc' false nil
		'axc' false nil
		'abx' false nil
		'xabcy' true (1 'abc')
		'ababc' true (1 'abc'))
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry002 [
	self runRegex: #('ab*c'
		'abc' true (1 'abc'))
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry003 [
	self runRegex: #('ab*bc'
		'abc' true (1 'abc')
		'abbc' true (1 'abbc')
		'abbbbc' true (1 'abbbbc'))
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry004 [
	self runRegex: #('ab+bc'	
		'abbc' true (1 'abbc')
		'abc' false nil
		'abq' false nil
		'abbbbc' true (1 'abbbbc'))
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry005 [
	self runRegex: #('ab?bc'
		'abbc' true (1 'abbc')
		'abc' true (1 'abc')
		'abbbbc' false nil
		'abc' true (1 'abc'))
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry006 [
	self runRegex: #('^abc$'
		'abc' true (1 'abc')
		'abcc' false nil
		'aabc' false nil)
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry007 [
	self runRegex: #('^abc'
		'abcc' true (1 'abc'))
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry008 [
	self runRegex: #('abc$'
		'aabc' true (1 'abc'))
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry009 [
	self runRegex: #('^'
		'abc' true nil)
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry010 [
	self runRegex: #('$'
		'abc' true nil)
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry011 [
	self runRegex: #('a.c'
		'abc' true (1 'abc')
		'axc' true (1 'axc'))
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry012 [
	"Need to get creative to include the null character..."
	self runRegex: #('a.*c'	
		'axyzc' true (1 'axyzc')
		'axy zc' true (1 'axy zc') "testing that a dot matches a space"
		), (Array with: 'axy', (String with: 0 asCharacter), 'zc'), #(false nil "testing that a dot does not match a null"
		'axyzd' false nil)
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry013 [
	self runRegex: #('.a.*'
		'1234abc' true (1 '4abc')
		'abcd' false nil)
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry014 [
	self runRegex: #('a\w+c'
		' abbbbc ' true (1 'abbbbc')
		'abb bc' false nil)
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry015 [
	self runRegex: #('\w+'
		'  	foobar	quux' true (1 'foobar')
		' 	~!@#$%^&*()-+=\|/?.>,<' false nil)
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry016 [
	self runRegex: #('a\W+c'
		'a   c' true (1 'a   c')
		'a bc' false nil)
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry017 [
	self runRegex: #('\W+'
		'foo!@#$bar' true (1 '!@#$')
		'foobar' false nil)
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry018 [
	self runRegex: #('a\s*c'
		'a   c' true (1 'a   c')
		'a bc' false nil)
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry019 [
	self runRegex: #('\s+'
		'abc3457 sd' true (1 ' ')
		'1234$^*^&asdfb' false nil)
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry020 [
	self runRegex: #('a\S*c'
		'aqwertyc' true (1 'aqwertyc')
		'ab c' false nil)
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry021 [
	self runRegex: #('\S+'
		'     	asdf		' true (1 'asdf')
		' 	
			' false nil)
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry022 [
	self runRegex: #('a\d+c'
		'a0123456789c' true (1 'a0123456789c')
		'a12b34c' false nil)
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry023 [
	self runRegex: #('\d+'
		'foo@#$%123ASD #$$%^&' true (1 '123')
		'foo!@#$asdfl;' false nil)
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry024 [
	self runRegex: #('a\D+c'
		'aqwertyc' true (1 'aqwertyc')
		'aqw6ertc' false nil)
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry025 [
	self runRegex: #('\D+'
		'1234 abc 456' true (1 ' abc ')
		'1234567890' false nil)
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry026 [
	self runRegex: #('(f|o)+\b'
		'foo' true (1 'foo')
		' foo ' true (1 'foo'))
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry027 [
	self runRegex: #('\ba\w+' "a word beginning with an A"
		'land ancient' true (1 'ancient')
		'antique vase' true (1 'antique')
		'goofy foobar' false nil)
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry028 [
	self runRegex: #('(f|o)+\B'
		'quuxfoobar' true (1 'foo')
		'quuxfoo ' true (1 'fo'))
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry029 [
	self runRegex: #('\Ba\w+' "a word with an A in the middle, match at A and further"
		'land ancient' true (1 'and')
		'antique vase' true (1 'ase')
		'smalltalk shall overcome' true (1 'alltalk')
		'foonix is better' false nil)
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry030 [
	self runRegex: #('fooa\>.*'
		'fooa ' true nil
		'fooa123' false nil
		'fooa bar' true nil
		'fooa' true nil
		'fooargh' false nil)
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry031 [
	self runRegex: #('\>.+abc'
		' abcde fg' false nil
		'foo abcde' true (1 ' abc')
		'abcde' false nil)
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry032 [
	self runRegex: #('\<foo.*'
		'foo' true nil
		'foobar' true nil
		'qfoobarq foonix' true (1 'foonix')
		' foo' true nil
		' 12foo' false nil
		'barfoo' false nil)
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry033 [
	self runRegex: #('.+\<foo'
		'foo' false nil
		'ab foo' true (1 'ab foo')
		'abfoo' false nil)
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry034 [
	self runRegex: #('a[bc]d'
		'abc' false nil
		'abd' true (1 'abd'))
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry035 [
	self runRegex: #('a[b-d]e'
		'abd' false nil
		'ace' true (1 'ace'))
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry036 [
	self runRegex: #('a[b-d]'
		'aac' true (1 'ac'))
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry037 [
	self runRegex: #('a[-b]'
		'a-' true (1 'a-'))
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry038 [
	self runRegex: #('a[b-]'
		'a-' true (1 'a-'))
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry039 [
	self runRegex: #('a[a-b-c]' nil)
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry040 [
	self runRegex: #('[k]'
		'ab' false nil)
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry041 [
	self runRegex: #('a[b-a]' nil)
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry042 [
	self runRegex: #('a[]b' nil)
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry043 [
	self runRegex: #('a[' nil)
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry044 [
	self runRegex: #('a]' 
		'a]' true (1 'a]'))
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry045 [
	self runRegex: #('a[]]b'
		'a]b' true (1 'a]b'))
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry046 [
	self runRegex: #('a[^bc]d'
		'aed' true (1 'aed')
		'abd' false nil)
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry047 [
	self runRegex: #('a[^-b]c'
		'adc' true (1 'adc')
		'a-c' false nil)
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry048 [
	self runRegex: #('a[^]b]c'
		'a]c' false nil
		'adc' true (1 'adc'))
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry049 [
	self runRegex: #('[\de]+'
		'01234' true (1 '01234')
		'0123e456' true (1 '0123e456')
		'0123e45g78' true (1 '0123e45'))
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry050 [
	self runRegex: #('[e\d]+' "reversal of the above, should be the same"
		'01234' true (1 '01234')
		'0123e456' true (1 '0123e456')
		'0123e45g78' true (1 '0123e45'))
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry051 [
	self runRegex: #('[\D]+'
		'123abc45def78' true (1 'abc'))
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry052 [
	self runRegex: #('[[:digit:]e]+'
		'01234' true (1 '01234')
		'0123e456' true (1 '0123e456')
		'0123e45g78' true (1 '0123e45'))
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry053 [
	self runRegex: #('[\s]+'
		'2  spaces' true (1 '  '))
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry054 [
	self runRegex: #('[\S]+'
		'  word12!@#$  ' true (1 'word12!@#$'))
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry055 [
	self runRegex: #('[\w]+'
		' 	foo123bar	45' true (1 'foo123bar'))
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry056 [
	self runRegex: #('[\W]+'
		'fii234!@#$34f' true (1 '!@#$'))
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry057 [
	self runRegex: #('[^[:alnum:]]+'
		'fii234!@#$34f' true (1 '!@#$'))
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry058 [
	self runRegex: #('[%&[:alnum:]]+'
		'foo%3' true (1 'foo%3')
		'foo34&rt4$57a' true (1 'foo34&rt4')
		'!@#$' false nil)
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry059 [
	self runRegex: #('[[:alpha:]]+'
		' 123foo3 ' true (1 'foo')
		'123foo' true (1 'foo')
		'foo1b' true (1 'foo'))
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry060 [
	self runRegex: #('[[:cntrl:]]+'
		' a 1234asdf' false nil)
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry061 [
	self runRegex: #('[[:lower:]]+'
		'UPPERlower1234' true (1 'lower')
		'lowerUPPER' true (1 'lower'))
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry062 [
	self runRegex: #('[[:upper:]]+'
		'UPPERlower1234' true (1 'UPPER')
		'lowerUPPER ' true (1 'UPPER'))
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry063 [
	self runRegex: #('[[:space:]]+'
		'2  spaces' true (1 '  '))
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry064 [
	self runRegex: #('[^[:space:]]+'
		'  word12!@#$  ' true (1 'word12!@#$'))
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry065 [
	self runRegex: #('[[:graph:]]+'
		'abc' true (1 'abc'))
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry066 [
	self runRegex: #('[[:print:]]+'
		'abc' true (1 'abc'))
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry067 [
	self runRegex: #('[^[:punct:]]+'
		'!hello,world!' true (1 'hello'))
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry068 [
	self runRegex: #('[[:xdigit:]]+'
		'  x10FCD  ' true (1 '10FCD')
		' hgfedcba0123456789ABCDEFGH '
			true (1 'fedcba0123456789ABCDEF'))
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry069 [
	self runRegex: #('ab|cd'
		'abc' true (1 'ab')
		'abcd' true (1 'ab'))
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry070 [
	self runRegex: #('()ef'
		'def' true (1 'ef' 2 ''))
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry071 [
	self runRegex: #('()*' nil)
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry072 [
	self runRegex: #('*a' nil)
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry073 [
	self runRegex: #('^*' nil)
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry074 [
	self runRegex: #('$*' nil)
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry075 [
	self runRegex: #('(*)b' nil)
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry076 [
	self runRegex: #('$b'	'b' false nil)
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry077 [
	self runRegex: #('a\' nil)
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry078 [
	self runRegex: #('a\(b'
		'a(b' true (1 'a(b'))
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry079 [
	self runRegex: #('a\(*b'
		'ab' true (1 'ab')
		'a((b' true (1 'a((b'))
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry080 [
	self runRegex: #('a\\b'
		'a\b' true (1 'a\b'))
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry081 [
	self runRegex: #('abc)' nil)
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry082 [
	self runRegex: #('(abc' nil)
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry083 [
	self runRegex: #('((a))'
		'abc' true (1 'a' 2 'a' 3 'a'))
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry084 [
	self runRegex: #('(a)b(c)'
		'abc' true (1 'abc' 2 'a' 3 'c'))
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry085 [
	self runRegex: #('a+b+c'
		'aabbabc' true (1 'abc'))
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry086 [
	self runRegex: #('a**' nil)
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry087 [
	self runRegex: #('a*?' nil)
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry088 [
	self runRegex: #('(a*)*' nil)
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry089 [
	self runRegex: #('(a*)+' nil)
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry090 [
	self runRegex: #('(a|)*' nil)
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry091 [
	self runRegex: #('(a*|b)*' nil)
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry092 [
	self runRegex: #('(a+|b)*'
		'ab' true (1 'ab' 2 'b'))
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry093 [
	self runRegex: #('(a+|b)+'
		'ab' true (1 'ab' 2 'b'))
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry094 [
	self runRegex: #('(a+|b)?'
		'ab' true (1 'a' 2 'a'))
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry095 [
	self runRegex: #('[^ab]*'
		'cde' true (1 'cde'))
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry096 [
	self runRegex: #('(^)*' nil)
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry097 [
	self runRegex: #('(ab|)*' nil)
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry098 [
	self runRegex: #(')(' nil)
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry099 [
	self runRegex: #('' 'abc' true (1 ''))
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry100 [
	self runRegex: #('abc' '' false nil)
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry101 [
	self runRegex: #('a*'
		'' true '')
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry102 [
	self runRegex: #('abcd'
		'abcd' true (1 'abcd'))
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry103 [
	self runRegex: #('a(bc)d'
		'abcd' true (1 'abcd' 2 'bc'))
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry104 [
	self runRegex: #('([abc])*d'
		'abbbcd' true (1 'abbbcd' 2 'c'))
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry105 [
	self runRegex: #('([abc])*bcd'
		'abcd' true (1 'abcd' 2 'a'))
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry106 [
	self runRegex: #('a|b|c|d|e' 'e' true (1 'e'))
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry107 [
	self runRegex: #('(a|b|c|d|e)f'
		'ef' true (1 'ef' 2 'e'))
	"	((a*|b))*	-	c	-	-"
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry108 [
	self runRegex: #('abcd*efg' 
		'abcdefg' true (1 'abcdefg'))
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry109 [
	self runRegex: #('ab*' 
		'xabyabbbz' true (1 'ab')
		'xayabbbz' true (1 'a'))
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry110 [
	self runRegex: #('(ab|cd)e' 'abcde' true (1 'cde' 2 'cd'))
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry111 [
	self runRegex: #('[abhgefdc]ij' 'hij' true (1 'hij'))
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry112 [
	self runRegex: #('^(ab|cd)e' 'abcde' false nil)
	
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry113 [
	self runRegex: #('(abc|)def' 'abcdef' true nil)
	
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry114 [
	self runRegex: #('(a|b)c*d' 'abcd' true (1 'bcd' 2 'b'))
	
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry115 [
	self runRegex: #('(ab|ab*)bc' 'abc' true (1 'abc' 2 'a'))
	
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry116 [
	self runRegex: #('a([bc]*)c*' 'abc' true (1 'abc' 2 'bc'))
	
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry117 [
	self runRegex: #('a([bc]*)(c*d)' 'abcd' true (1 'abcd' 2 'bc' 3 'd'))
	
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry118 [
	self runRegex: #('a([bc]+)(c*d)' 'abcd' true (1 'abcd' 2 'bc' 3 'd'))
	
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry119 [
	self runRegex: #('a([bc]*)(c+d)' 'abcd' true (1 'abcd' 2 'b' 3 'cd'))
	
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry120 [
	self runRegex: #('a[bcd]*dcdcde' 'adcdcde' true (1 'adcdcde'))
	
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry121 [
	self runRegex: #('a[bcd]+dcdcde' 'adcdcde' false nil)
	
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry122 [
	self runRegex: #('(ab|a)b*c' 'abc' true (1 'abc'))
	
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry123 [
	self runRegex: #('((a)(b)c)(d)' 'abcd' true (1 'abcd' 3 'a' 4 'b' 5 'd'))
	
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry124 [
	self runRegex: #('[ -~]*' 'abc' true (1 'abc'))
	
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry125 [
	self runRegex: #('[ -~ -~]*' 'abc' true (1 'abc'))
	
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry126 [
	self runRegex: #('[ -~ -~ -~]*' 'abc' true (1 'abc'))
	
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry127 [
	self runRegex: #('[ -~ -~ -~ -~]*' 'abc' true (1 'abc'))
	
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry128 [
	self runRegex: #('[ -~ -~ -~ -~ -~]*' 'abc' true (1 'abc'))
	
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry129 [
	self runRegex: #('[ -~ -~ -~ -~ -~ -~]*' 'abc' true (1 'abc'))
	
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry130 [
	self runRegex: #('[ -~ -~ -~ -~ -~ -~ -~]*' 'abc' true (1 'abc'))
	
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry131 [
	self runRegex: #('[a-zA-Z_][a-zA-Z0-9_]*' 'alpha' true (1 'alpha'))
	
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry132 [
	self runRegex: #('^a(bc+|b[eh])g|.h$' 'abh' true (1 'bh' 2 nil))
	
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry133 [
	self runRegex: #('(bc+d$|ef*g.|h?i(j|k))' 
		'effgz' true (1 'effgz' 2 'effgz' 3 nil)
		'ij' true (1 'ij' 2 'ij' 3 'j')
		'effg' false nil
		'bcdd' false nil
		'reffgz' true (1 'effgz' 2 'effgz' 3 nil))
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry134 [
	self runRegex: #('(((((((((a)))))))))' 'a' true (1 'a'))
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry135 [
	self runRegex: #('multiple words of text' 
		'uh-uh' false nil
		'multiple words of text, yeah' true (1 'multiple words of text'))
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry136 [
	self runRegex: #('(.*)c(.*)' 'abcde' true (1 'abcde' 2 'ab' 3 'de'))
]

{
	#category : #testing-henry,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testHenry137 [
	self runRegex: #('\((.*), (.*)\)' '(a, b)' true (2 'a' 3 'b'))
]

{
	#category : #testing-protocol,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testMatches [
	| matcher |
	matcher := self matcherClass forString: '\w+'.
	self assert: (matcher matches: 'now').
	self deny: (matcher matches: 'now is')
]

{
	#category : #testing-protocol,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testMatchesIn [
	| matcher |
	matcher := self matcherClass forString: '\w+'.
	self assert: (matcher matchesIn: 'now is the time') asArray 
		= #('now' 'is' 'the' 'time')
]

{
	#category : #testing-protocol,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testMatchesInCollect [
	| matcher |
	matcher := self matcherClass forString: '\w+'.
	self assert: (matcher
		matchesIn: 'now is the time'
		collect: [ :each | each reversed ]) asArray
			= #('won' 'si' 'eht' 'emit')
]

{
	#category : #testing-protocol,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testMatchesInDo [
	| matcher expected |
	matcher := self matcherClass forString: '\w+'.
	expected := #('now' 'is' 'the' 'time') asOrderedCollection.
	matcher 
		matchesIn: 'now is the time'
		do: [ :each | self assert: each = expected removeFirst ].
	self assert: expected isEmpty
]

{
	#category : #testing-protocol,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testMatchesOnStream [
	| matcher |
	matcher := self matcherClass forString: '\w+'.
	self assert: (matcher matchesOnStream: 'now is the time' readStream) asArray 
		= #('now' 'is' 'the' 'time')
]

{
	#category : #testing-protocol,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testMatchesOnStreamCollect [
	| matcher |
	matcher := self matcherClass forString: '\w+'.
	self assert: (matcher 
		matchesOnStream: 'now is the time' readStream 
		collect: [ :each | each reversed ]) asArray
			= #('won' 'si' 'eht' 'emit')
]

{
	#category : #testing-protocol,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testMatchesOnStreamDo [
	| matcher expected |
	matcher := self matcherClass forString: '\w+'.
	expected := #('now' 'is' 'the' 'time') asOrderedCollection.
	matcher 
		matchesOnStream: 'now is the time' readStream
		do: [ :each | self assert: each = expected removeFirst ].
	self assert: expected isEmpty
]

{
	#category : #testing-protocol,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testMatchesStream [
	| matcher |
	matcher := self matcherClass forString: '\w+'.
	self assert: (matcher matchesStream: 'now' readStream).
	self deny: (matcher matchesStream: 'now is' readStream)
]

{
	#category : #testing-protocol,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testMatchingRangesIn [
	| matcher expected |
	matcher := self matcherClass forString: '\w+'.
	expected := #(1 3 5 6 8 10 12 15) asOrderedCollection.
	(matcher matchingRangesIn: 'now is the time') do: [ :range |
		self assert: range first = expected removeFirst.
		self assert: range last = expected removeFirst ].
	self assert: expected isEmpty
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testRegex001 [
	self runRegex: #('^.*$' 
		'' true (1 '')
		'a' true (1 'a')
		'abc' true (1 'abc'))
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testRegex002 [
	self runRegex: #('a\w+c'
		' abb_bbc ' true (1 'abb_bbc')
		'abb-bc' false nil)
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testRegex003 [
	self runRegex: #('a\W+c'
		' abb_bbc ' false nil
		'abb-bc' false nil
		'a.,:;-&!"#%/()={[]}+?\~*''c' true (1 'a.,:;-&!"#%/()={[]}+?\~*''c'))
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testRegex004 [
	self runRegex: #(':isVowel:'
		'aei' true nil
		'xyz' false nil)
]

{
	#category : #testing-extensions,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testStringAllRangesOfRegexMatches [
	| result |
	result := 'aabbcc' allRangesOfRegexMatches: 'b+'.
	self assert: result size = 1.
	self assert: result first first = 3.
	self assert: result first last = 4
	
]

{
	#category : #testing-extensions,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testStringAllRegexMatches [
	| result |
	result := 'aabbcc' allRegexMatches: 'b+'.
	self assert: result size = 1.
	self assert: result first = 'bb'
]

{
	#category : #testing-extensions,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testStringAsRegex [
	self assert: 'b+' asRegex class = RxParser preferredMatcherClass
]

{
	#category : #testing-extensions,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testStringAsRegexIgnoringCase [
	self assert: 'b+' asRegexIgnoringCase class = RxParser preferredMatcherClass
]

{
	#category : #testing-extensions,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testStringCopyWithRegexMatchesReplacedWith [
	self assert: ('aabbcc' copyWithRegex: 'b+' matchesReplacedWith: 'X') = 'aaXcc'
]

{
	#category : #testing-extensions,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testStringCopyWithRegexMatchesTranslatedUsing [
	self assert: ('aabbcc' 
		copyWithRegex: 'b+' 
		matchesTranslatedUsing: [ :each | 
			self assert: each = 'bb'.
			'X' ]) = 'aaXcc'
]

{
	#category : #testing-extensions,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testStringMatchesRegex [
	self deny: ('aabbcc' matchesRegex: 'a+').
	self deny: ('aabbcc' matchesRegex: 'b+c+').
	self assert: ('aabbcc' matchesRegex: 'a+b+c+')
]

{
	#category : #testing-extensions,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testStringMatchesRegexIgnoringCase [
	self deny: ('AABBCC' matchesRegexIgnoringCase: 'a+').
	self deny: ('AABBCC' matchesRegexIgnoringCase: 'b+c+').
	self assert: ('AABBCC' matchesRegexIgnoringCase: 'a+b+c+')
]

{
	#category : #testing-extensions,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testStringPrefixMatchesRegex [
	self assert: ('aabbcc' prefixMatchesRegex: 'a+').
	self deny: ('aabbcc' prefixMatchesRegex: 'b+')
]

{
	#category : #testing-extensions,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testStringPrefixMatchesRegexIgnoringCase [
	self assert: ('AABBCC' prefixMatchesRegexIgnoringCase: 'a+').
	self deny: ('AABBCC' prefixMatchesRegexIgnoringCase: 'b+')
]

{
	#category : #testing-extensions,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testStringRegexMatchesCollect [
	| result |
	result := 'aabbcc' regex: 'b+' matchesCollect: [ :each | each asUppercase ].
	self assert: result size = 1.
	self assert: result first = 'BB'
]

{
	#category : #testing-extensions,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testStringRegexMatchesDo [
	| result |
	result := OrderedCollection new.
	'aabbcc' regex: 'b+' matchesDo: [ :each | result add: each ].
	self assert: result size = 1.
	self assert: result first = 'bb'
]

{
	#category : #testing-protocol,
	#timestamp : ' 8/31/2017 05:26:45'
}
RxMatcherTest>>testSubexpressionCount [
	| matcher |
	#(('a' 1) ('a(b)' 2) ('a(b(c))' 3) ('(a)(b)' 3) ('(a(b))*' 3)) do: [ :pair |
		matcher := self matcherClass forString: pair first.
		matcher supportsSubexpressions 
			ifTrue: [ self assert: matcher subexpressionCount = pair last ] ]
]
