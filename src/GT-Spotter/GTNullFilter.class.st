"

"
Class {
	#name : #GTNullFilter,
	#superclass : #GTStringFilter,
	#category : #GT-Spotter-Filters,
	#timestamp : ''
}

{
	#category : #public,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTNullFilter class>>gtListFilter [
	^ GTFilterSubstring new
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTNullFilter>>applyFilterWithQuery [
	self streamed 
		ifTrue: [
			" this will be more responsive (faster) for very large collections and/or expensive filters "
			| allItems |
			self filteredItems: (allItems := OrderedCollection new).
			self allItems withIndexDo: [ :each :index |
				allItems add: each.
				index <= self itemsLimit ifTrue: [ 
					self addItem: each ] ] ]
		ifFalse: [
			" this will be much much faster for small collections and/or very quick filters " 
			self filteredItems: self allItems.
			self addItems: (self allItems first: (self itemsLimit min: self allItems size)) ]
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTNullFilter>>gtListFilter [
	^ GTFilterSubstring new
]
