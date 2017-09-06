"
I represent a example expression (expression and value) within a method
comment (RBCommentNode). Every pair of Pharo expression and a separator (default "">>>"") can be styled as Pharo code and the editor iconstyler  can highlight the code and evaluate the expression.

Example, within a method comment:

"" 3 + 4 >>> 7""

The example code should show an  expression 3 + 4 and the expected value 7.

See setting on ""Code Browsing"" to enable / disable this doc comment style.
"
Class {
	#name : #PharoDocCommentNode,
	#superclass : #Object,
	#instVars : [
		'sourceNode',
		'expression',
		'result'
	],
	#classVars : [
		'DocCommentEnabled'
	],
	#category : #PharoDocComment,
	#timestamp : 'StephaneDucasse 11/3/2016 13:09'
}

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:44'
}
PharoDocCommentNode class>>docCommentEnabled [
	^ DocCommentEnabled  ifNil: [ DocCommentEnabled  := true ] 
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:44'
}
PharoDocCommentNode class>>docCommentEnabled: aBoolean [
	DocCommentEnabled := aBoolean
]

{
	#category : #parsing,
	#timestamp : ' 8/31/2017 05:26:44'
}
PharoDocCommentNode class>>docCommentRangesIn: aText [
	^ '(([^[:cntrl:]]*)>>>\3?([^[:cntrl:]]*))' asRegex matchingRangesIn: aText
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:44'
}
PharoDocCommentNode class>>expression: aDocExpression result: anotherDocExpression inComment: aRBComment [
	^ self new
		expression: aDocExpression;
		result: anotherDocExpression;
		sourceNode: aRBComment
		yourself
]

{
	#category : #parsing,
	#timestamp : ' 8/31/2017 05:26:44'
}
PharoDocCommentNode class>>parseDocComments: aRBCommentNode [
	| ranges |
	ranges := self docCommentRangesIn: aRBCommentNode contents.
	^ ranges
		collect: [ :range | 
			| expression result exps |
			exps := '>>>' split: (aRBCommentNode contents copyFrom: range first to: range last).
			expression := PharoDocCommentExpression new
				expressionInterval: (range first to: range first + exps first size - 1);
				source: aRBCommentNode contents.
			result := PharoDocCommentExpression new
				expressionInterval: (1 + range last - exps last size to: range last);
				source: aRBCommentNode contents.
			self expression: expression result: result inComment: aRBCommentNode ]
]

{
	#category : #settings,
	#timestamp : ' 8/31/2017 05:26:44'
}
PharoDocCommentNode class>>settingsOn: aBuilder [
	<systemsettings>
	(aBuilder setting: #docCommentEnabled)
		target: self;
		description:
			'Allow styled and executable example expressions within method comments. 
		Example: 
		"3+4 >>> 7."';
		label: 'Pharo doc comments';
		parent: #codeBrowsing
]

{
	#category : #operation,
	#timestamp : ' 8/31/2017 05:26:44'
}
PharoDocCommentNode>>asTriplet [
	"Return the expression, its returned value and its expect result."
	^ { self expression expressionCode formattedCode . self expression evaluate . self result expressionCode formattedCode}
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:44'
}
PharoDocCommentNode>>expression [
	^ expression
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:44'
}
PharoDocCommentNode>>expression: anObject [
	expression := anObject
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:44'
}
PharoDocCommentNode>>printOn: aStream [

	super printOn: aStream.
	aStream nextPutAll: '('.
	aStream nextPutAll: self expression source.
	aStream nextPutAll: ')'.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:44'
}
PharoDocCommentNode>>result [
	^ result
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:44'
}
PharoDocCommentNode>>result: anObject [
	result := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:44'
}
PharoDocCommentNode>>sourceNode [
	^ sourceNode
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:44'
}
PharoDocCommentNode>>sourceNode: anObject [
	sourceNode := anObject
]
