Extension {
	#name : #RBReturnNode
}

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
RBReturnNode>>link: aMetaLink [
	(#(instead after) includes: aMetaLink control) ifTrue: [ self error: '#intead on return not supported' ].
	super link: aMetaLink 
]
