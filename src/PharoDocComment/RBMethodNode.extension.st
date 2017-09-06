Extension {
	#name : #RBMethodNode
}

{
	#category : #'*PharoDocComment',
	#timestamp : ' 8/31/2017 05:26:44'
}
RBMethodNode>>pharoDocCommentNodes [
	"Return a collection of pharo comment nodes: expressions following the pattern expr1 >>> expr2 "
	^ self comments flatCollect: #pharoDocCommentNodes
]
