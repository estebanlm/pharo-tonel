"

"
Class {
	#name : #MetacelloScriptRegistryExecutor,
	#superclass : #MetacelloScriptExecutor,
	#category : #Metacello-Core-Scripts,
	#timestamp : ''
}

{
	#category : #'actions api',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptRegistryExecutor>>prime [

]

{
	#category : #'execution callback',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptRegistryExecutor>>projectSpecSelectBlock [
  ^ [ :projectSpec | projectSpec notNil ]
]

{
	#category : #'actions api',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptRegistryExecutor>>remove [

]

{
	#category : #'actions api',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloScriptRegistryExecutor>>reset [

]
