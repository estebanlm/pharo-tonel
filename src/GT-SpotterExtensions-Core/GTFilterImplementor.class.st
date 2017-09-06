"

"
Class {
	#name : #GTFilterImplementor,
	#superclass : #GTFilterSubstring,
	#category : #GT-SpotterExtensions-Core,
	#timestamp : ''
}

{
	#category : #public,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTFilterImplementor class>>gtListFilter [
	^ GTFilterSubstring new
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTFilterImplementor>>gtListFilter [
	^ GTFilterSubstring new
]

{
	#category : #private-model,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTFilterImplementor>>itemFilterNameFor: each [
	self flag: 'this filter wants to filter items by #selector (speed 10x), but dive-in-category wants to filter by #printString. Most filters in dive-in-category wants to filter by #printString, but not all. Others: files, topics, help, ... ?'.
	^ each selector
]
