Extension {
	#name : #RGMethodDefinition
}

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
RGMethodDefinition>>createTwin [
	self compiledMethod createTwin
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
RGMethodDefinition>>installLink: aMetaLink  [
	self compiledMethod installLink: aMetaLink 
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
RGMethodDefinition>>invalidate [
	self compiledMethod invalidate
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
RGMethodDefinition>>removeLink: aLink [
	self compiledMethod removeLink: aLink
]

{
	#category : #'*Reflectivity',
	#timestamp : ' 8/31/2017 07:16:26'
}
RGMethodDefinition>>variableNodes [
	^self compiledMethod variableNodes.
]
