"
I am a dispatcher that dispatches the global keymappings.
"
Class {
	#name : #KmGlobalDispatcher,
	#superclass : #Object,
	#instVars : [
		'dispatcher'
	],
	#category : #Keymapping-Core,
	#timestamp : '<historical>'
}

{
	#category : #dispatching,
	#timestamp : ' 8/31/2017 05:26:19'
}
KmGlobalDispatcher>>dispatch: anEventBuffer [
	dispatcher
		dispatch: anEventBuffer
		inCategories: KMRepository default globalCategories

]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:19'
}
KmGlobalDispatcher>>dispatcher: aDispatcher [
	dispatcher := aDispatcher
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:19'
}
KmGlobalDispatcher>>isGlobalDispatcher [
	^true
]

{
	#category : #iterating,
	#timestamp : ' 8/31/2017 05:26:19'
}
KmGlobalDispatcher>>nextForKmChain: aKMDispatchChain  [
	^aKMDispatchChain target
]
