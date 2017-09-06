Extension {
	#name : #RBComment
}

{
	#category : #'*PharoDocComment',
	#timestamp : ' 8/31/2017 05:26:44'
}
RBComment>>pharoDocCommentNodes [
	^ PharoDocCommentNode parseDocComments: self
]
