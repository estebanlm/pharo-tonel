"
IconStyler for highlight example expressions in method documents (seee PharoDocCommentNode). Enabled / Disabled by a Setting in group ""Code Browsing""
"
Class {
	#name : #DocCommentIconStyler,
	#superclass : #IconStyler,
	#category : #PharoDocComment,
	#timestamp : 'NicolaiHess 11/1/2016 21:59'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:44'
}
DocCommentIconStyler>>exampleIsFaulty: aNode [
	^ aNode comments
		anySatisfy: [ :commentNode | commentNode pharoDocCommentNodes anySatisfy: [ :node |
				node expression expressionCode isFaulty ]]
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:44'
}
DocCommentIconStyler>>highlightColor [
	^ (Color green alpha: 0.8)
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:44'
}
DocCommentIconStyler>>iconBlock: aNode [
	^ (self exampleIsFaulty: aNode)
		ifTrue: [ self notifySourceError: aNode ]
		ifFalse: [ self runExampleBlock: aNode ]
]

{
	#category : #defaults,
	#timestamp : ' 8/31/2017 05:26:44'
}
DocCommentIconStyler>>iconFor: aNode [
	^ (self exampleIsFaulty: aNode)
		ifTrue: [ self iconNamed: #smallWarning ]
		ifFalse: [ self iconNamed: #smallInfo ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:44'
}
DocCommentIconStyler>>iconLabel: aNode [
	^ (self exampleIsFaulty: aNode)
		ifTrue: [ 'Faulty Example' ]
		ifFalse: [ 'Runnable Examle' ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:44'
}
DocCommentIconStyler>>notifySourceError: aNode [
	"If a code in an example is faulty notify the user"
	"kjkl>>>2"
	"3 + 4 >>> 7"
	^ [ | examples faultyExample |
		examples := aNode pharoDocCommentNodes.
		faultyExample := examples detect: [ :example | example expression expressionCode isFaulty ].
		RBParser parseExpression: faultyExample expression expression ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:44'
}
DocCommentIconStyler>>runExampleBlock: aNode [
	^ [ | examples |
		examples := aNode pharoDocCommentNodes.
		(examples
			collect: [ :example | 
			{ example expression expressionCode formattedCode . example expression evaluate . example result expressionCode formattedCode}]) inspect]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:44'
}
DocCommentIconStyler>>shouldStyleNode: aNode [
	^ self stylingEnabled
		and: [ aNode isMethod
				and: [ aNode comments isNotEmpty
						and: [ aNode comments anySatisfy: [ :commentNode | commentNode pharoDocCommentNodes isNotEmpty ] ] ] ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:44'
}
DocCommentIconStyler>>stylingEnabled [
	^ PharoDocCommentNode docCommentEnabled 
]
