"
GLMMultiValue is helper class that is used in #glamourValue:.
"
Class {
	#name : #GLMMultiValue,
	#superclass : #OrderedCollection,
	#type : #variable,
	#category : #Glamour-Helpers,
	#timestamp : 'tg 12/19/2009 00:16'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMMultiValue>>asGlamorousArray  [
	 
	^self asArray
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:33'
}
GLMMultiValue>>asGlamorousMultiValue [
	^ self
]
