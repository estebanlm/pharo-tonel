"
A TimeProfilerNode represents a node in the tally tree
"
Class {
	#name : #TimeProfilerNode,
	#superclass : #MorphTreeNodeModel,
	#category : #Tool-Profilers,
	#timestamp : '<historical>'
}

{
	#category : #printing,
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfilerNode>>asString [
	^ String streamContents: [:s | self item printOn: s total: model tally totalTime: model time tallyExact: false] 
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfilerNode>>browseItem [
	Smalltalk tools browser
		openOnClass: self methodClass  selector: self selector
]

{
	#category : #accessing-computed,
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfilerNode>>childrenItems [
	^ (self item sonsOver: model threshold) asSortedCollection
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfilerNode>>exploreItem [
	self item explore
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfilerNode>>inspectItem [
	self item inspect
]

{
	#category : #'UI specific',
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfilerNode>>keyStroke: anEvent from: aTreeMorph [
	| c |
	c := anEvent keyCharacter.
	c = $b
		ifTrue: [self browseItem. ^ true].
	c = $i
		ifTrue: [self inspectItem. ^ true].
	c = $I
		ifTrue: [self exploreItem. ^ true].
	^ false

]

{
	#category : #'UI specific',
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfilerNode>>menu: menu shifted: b  [
	menu
		add: 'Browse (b)'
		target: self
		selector: #browseItem.
	menu
		add: 'Inspect (i)'
		target: self
		selector: #inspectItem.
	menu
		add: 'Explore (I)'
		target: self
		selector: #exploreItem.

]

{
	#category : #accessing-computed,
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfilerNode>>methodClass [
	^self item method methodClass 
	
]

{
	#category : #accessing-computed,
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfilerNode>>percentage  [
	^ self item tally asFloat / model time * 100.0 roundTo: 0.1.

]

{
	#category : #accessing-computed,
	#timestamp : ' 8/31/2017 05:26:21'
}
TimeProfilerNode>>selector [
	^self item method selector 
	
]
