"
A SharedPackageFilterPatternsHolder is used for package filter input. It shares historical values of the input among all the PackageTreeNautilus browsers. Variable lastValue keeps the last used value. It is used when a browser is opened from a system (e.g. World menu, anObject browse).

Instance Variables
	mutex:		Mutex
	value:		OrderedCollection
	lastValue:	String

"
Class {
	#name : #SharedPackageFilterPatternsHolder,
	#superclass : #Object,
	#instVars : [
		'value',
		'mutex',
		'lastValue'
	],
	#classInstVars : [
		'instance'
	],
	#category : #Nautilus-Tree,
	#timestamp : 'JurajKubelka 12/17/2014 20:56'
}

{
	#category : #cleanup,
	#timestamp : ' 8/31/2017 05:26:22'
}
SharedPackageFilterPatternsHolder class>>cleanUp [
	self reset
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
SharedPackageFilterPatternsHolder class>>instance [

	^ instance ifNil: [ instance := self new value: OrderedCollection new; yourself ]
]

{
	#category : #cleanup,
	#timestamp : ' 8/31/2017 05:26:22'
}
SharedPackageFilterPatternsHolder class>>reset [
	instance := nil
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 05:26:22'
}
SharedPackageFilterPatternsHolder>>addFirst: aString  [
	^ mutex critical: [ 
		value 
			detect: [ :eachPattern | aString beginsWith: eachPattern ]
			ifFound: [ :aPattern | value remove: aPattern ].
		value addFirst: aString.
	 ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
SharedPackageFilterPatternsHolder>>at: index [

	^ mutex critical: [ value at: index ]
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 05:26:22'
}
SharedPackageFilterPatternsHolder>>collectWithIndex: aBlockClosure  [
	
	^ mutex critical: [ value withIndexCollect: aBlockClosure ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
SharedPackageFilterPatternsHolder>>firstOrNil [
	^ mutex critical: [ 
		value 
			ifNotEmpty: [ value first ] 
			ifEmpty: [ nil ] ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
SharedPackageFilterPatternsHolder>>indexOf: aString  [
	
	^ mutex critical: [ value indexOf: aString ]
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:22'
}
SharedPackageFilterPatternsHolder>>initialize [

	super initialize.
	mutex := Mutex new.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
SharedPackageFilterPatternsHolder>>lastValue [
	^ mutex critical: [ lastValue ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
SharedPackageFilterPatternsHolder>>lastValue: aValue  [
	mutex critical: [ lastValue := aValue ]
]

{
	#category : #removing,
	#timestamp : ' 8/31/2017 05:26:22'
}
SharedPackageFilterPatternsHolder>>remove: aString ifAbsent: aBlockClosure  [
	
	^ mutex critical: [ value remove: aString ifAbsent: aBlockClosure ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
SharedPackageFilterPatternsHolder>>size [

	^ mutex critical: [ value size ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
SharedPackageFilterPatternsHolder>>value [

	^ mutex critical: [ value ].
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
SharedPackageFilterPatternsHolder>>value: anObject [

	mutex critical: [ value := anObject ].
]
