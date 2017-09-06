"

"
Class {
	#name : #ZnHtmlOutputStreamTests,
	#superclass : #TestCase,
	#category : #Zinc-Tests,
	#timestamp : ''
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:47'
}
ZnHtmlOutputStreamTests>>testAttributeEscaping [
	| result |
	result := ZnHtmlOutputStream streamContents: [ :html |
		html tag: #div attributes: #(query '"literal"') with: 'Foo' ].
	self assert: result equals: '<div query="&quot;literal&quot;">Foo</div>'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:47'
}
ZnHtmlOutputStreamTests>>testComment [
	| result |
	result := ZnHtmlOutputStream streamContents: [ :html |
		html comment: 'a comment' ].
	self assert: result equals: '<!-- a comment -->'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:47'
}
ZnHtmlOutputStreamTests>>testEncoding [
	| result |
	result := ZnHtmlOutputStream streamContents: [ :html |
		html tag: #div with: 'élève en Français' ].
	self assert: result equals: '<div>élève en Français</div>'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:47'
}
ZnHtmlOutputStreamTests>>testEscaping [
	| result |
	result := ZnHtmlOutputStream streamContents: [ :html |
		html tag: #div with: 'Foo & Bar < 100' ].
	self assert: result equals: '<div>Foo &amp; Bar &lt; 100</div>'.
	result := ZnHtmlOutputStream streamContents: [ :html |
		html << 'Foo & Bar < 100' ].
	self assert: result equals: 'Foo & Bar < 100'.
	result := ZnHtmlOutputStream streamContents: [ :html |
		html str: 'Foo & Bar < 100' ].
	self assert: result equals: 'Foo &amp; Bar &lt; 100'.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:47'
}
ZnHtmlOutputStreamTests>>testFormat [
	| result |
	result := ZnHtmlOutputStream streamContents: [ :html |
		html format: '{1} & {2}' with: { '<'. '>' } ].
	self assert: result equals: '&lt; &amp; >'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:47'
}
ZnHtmlOutputStreamTests>>testHtml5Tag [
	| result |
	result := ZnHtmlOutputStream streamContents: [ :html |
		html html5 ].
	self assert: result equals: '<!DOCTYPE html>'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:47'
}
ZnHtmlOutputStreamTests>>testNesting [
	| result |
	result := ZnHtmlOutputStream streamContents: [ :html |
		html tag: #ol do: [ 
			#(one two three) do: [ :each | html tag: #li with: each ] ] ].
	self assert: result equals: '<ol><li>one</li><li>two</li><li>three</li></ol>'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:47'
}
ZnHtmlOutputStreamTests>>testSelfClosingTag [
	| result |
	result := ZnHtmlOutputStream streamContents: [ :html |
		html tag: #br ].
	self assert: result equals: '<br/>'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:47'
}
ZnHtmlOutputStreamTests>>testSmall [
	| result |
	result := ZnHtmlOutputStream streamContents: [ :html |
		html 
			tag: #h1 with: #Small;
			tag: #p with: 'This is a small HTML document' ].
	self assert: result equals: '<h1>Small</h1><p>This is a small HTML document</p>'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:47'
}
ZnHtmlOutputStreamTests>>testSmallPage [
	| result |
	result := ZnHtmlOutputStream streamContents: [ :html |
		html page: 'Small' do: [ 
			html tag: #p with: 'This is a small HTML document' ] ].
	self assert: result equals: '<!DOCTYPE html><html><head><title>Small</title></head><body><h1>Small</h1><p>This is a small HTML document</p></body></html>'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:47'
}
ZnHtmlOutputStreamTests>>testTagWithClass [
	| result |
	result := ZnHtmlOutputStream streamContents: [ :html |
		html tag: #div class: #menu with: 'Foo' ].
	self assert: result equals: '<div class="menu">Foo</div>'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:47'
}
ZnHtmlOutputStreamTests>>testTagWithEmptyAttributes [
	| result |
	result := ZnHtmlOutputStream streamContents: [ :html |
		html tag: #div attributes: #(class menu id one readonly nil) with: 'Foo' ].
	self assert: result equals: '<div class="menu" id="one" readonly>Foo</div>'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:47'
}
ZnHtmlOutputStreamTests>>testTagWithId [
	| result |
	result := ZnHtmlOutputStream streamContents: [ :html |
		html tag: #div id: #menu with: 'Foo' ].
	self assert: result equals: '<div id="menu">Foo</div>'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:47'
}
ZnHtmlOutputStreamTests>>testTagWithMultipleAttributes [
	| result |
	result := ZnHtmlOutputStream streamContents: [ :html |
		html tag: #div attributes: #(class menu id one) with: 'Foo' ].
	self assert: result equals: '<div class="menu" id="one">Foo</div>'
]
