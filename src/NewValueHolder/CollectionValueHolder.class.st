"
I am designed specifically for collections.
"
Class {
	#name : #CollectionValueHolder,
	#superclass : #NewValueHolder,
	#category : #NewValueHolder,
	#timestamp : 'BenjaminVanRyseghem 1/23/2014 15:18'
}

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:15'
}
CollectionValueHolder>>add: newObject [
	| result |
	result := value add: newObject.
	self valueAdded: newObject.
	^ result
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:15'
}
CollectionValueHolder>>add: newObject after: oldObject  [
	
	| result |
	result := value add: newObject after: oldObject.
	self valueAdded: newObject.
	^ result
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:15'
}
CollectionValueHolder>>add: newObject afterIndex: index  [
	
	| result |
	result := value add: newObject afterIndex: index.
	self valueAdded: newObject.
	^ result
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:15'
}
CollectionValueHolder>>add: newObject before: oldObject [
	
	| result |
	result := value add: newObject before: oldObject.
	self valueAdded: newObject.
	^ result
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:15'
}
CollectionValueHolder>>add: newObject beforeIndex: index  [
	
	| result |
	result := value add: newObject beforeIndex: index.
	self valueAdded: newObject.
	^ result
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:15'
}
CollectionValueHolder>>addAll: aCollection  [
	
	| result |
	result := value addAll: aCollection.
	self valueAdded: aCollection.
	^ result
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:15'
}
CollectionValueHolder>>addAllFirst: anOrderedCollection [
	
	| result |
	result := value addAllFirst: anOrderedCollection.
	self valueAdded: anOrderedCollection.
	^ result
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:15'
}
CollectionValueHolder>>addAllFirstUnlessAlreadyPresent: anOrderedCollection [
	
	| result |
	result := value addAllFirstUnlessAlreadyPresent: anOrderedCollection.
	self valueAdded: anOrderedCollection.
	^ result
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:15'
}
CollectionValueHolder>>addAllLast: aCollection  [
	
	| result |
	result := value addAllLast: aCollection.
	self valueAdded: aCollection.
	^ result
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:15'
}
CollectionValueHolder>>addFirst: newObject  [

	| result |
	result := value addFirst: newObject .
	self valueAdded: newObject.
	^ result
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:15'
}
CollectionValueHolder>>addLast: newObject  [

	| result |
	result := value addLast: newObject .
	self valueAdded: newObject.
	^ result
]

{
	#category : #override,
	#timestamp : ' 8/31/2017 05:26:15'
}
CollectionValueHolder>>at: anObject [

	^ value at: anObject
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:15'
}
CollectionValueHolder>>at: index ifAbsentPut: block [

	| result |
	result := value at: index ifAbsentPut: block.
	self valueAdded: block value.
	^ result
]

{
	#category : #override,
	#timestamp : ' 8/31/2017 05:26:15'
}
CollectionValueHolder>>at: key put: anObject [

	value at: key put: anObject.
	self valueAdded: anObject.
	^ anObject
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:15'
}
CollectionValueHolder>>atAll: aCollection put: anObject  [
	
	| result |
	result := value atAll: aCollection put: anObject .
	self valueAdded: anObject.
	^ result
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:15'
}
CollectionValueHolder>>atAll: indexArray putAll: valueArray [
	
	| result |
	result := value atAll: indexArray putAll: valueArray.
	self valueAdded: valueArray.
	^ result
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:15'
}
CollectionValueHolder>>atAllPut: anObject  [
	
	| result |
	result := value atAllPut: anObject.
	self valueAdded: anObject.
	^ result
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:15'
}
CollectionValueHolder>>atLast: indexFromEnd put: obj [
	
	| result |
	result := value atLast: indexFromEnd put: obj.
	self valueAdded: obj.
	^ result
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:15'
}
CollectionValueHolder>>atWrap: index put: anObject [
	
	| result |
	result := value atWrap: index put: anObject.
	self valueAdded: value.
	^ result
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:15'
}
CollectionValueHolder>>doesNotUnderstand: aMessage [

	^ (value respondsTo: aMessage selector)
		ifTrue: [ value perform: aMessage selector withEnoughArguments: aMessage arguments ]
		ifFalse: [ super doesNotUnderstand: aMessage ]
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:15'
}
CollectionValueHolder>>insert: anObject before: spot [

	| result |
	result := value insert: anObject before: spot.
	self valueAdded: anObject.
	^ result
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:15'
}
CollectionValueHolder>>remove: oldObject [

	| result |
	result := value remove: oldObject.
	self valueRemoved: oldObject.
	^ result
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:15'
}
CollectionValueHolder>>remove: oldObject ifAbsent: absentBlock [

	| result |
	result := value remove: oldObject ifAbsent: absentBlock.
	self valueRemoved: oldObject.
	^ result
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:15'
}
CollectionValueHolder>>removeAll [
	"Note: I'm not sure about the semantics here, because Collections normally don't return anything on #removeAll, even though one might expect the original content. Use with care."

	value removeAll.
	self valueRemoved: nil
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:15'
}
CollectionValueHolder>>removeAll: aCollection [
	| result |
	result := value removeAll: aCollection.
	self valueRemoved: result.
	^ result
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:15'
}
CollectionValueHolder>>removeAt: index [

	| result |
	result := value removeAt: index.
	self valueRemoved: result.
	^ result
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:15'
}
CollectionValueHolder>>removeFirst [

	| result |
	result := value removeFirst.
	self valueRemoved: result.
	^ result
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:15'
}
CollectionValueHolder>>removeFirst: n  [

	| result |
	result := value removeFirst: n .
	self valueRemoved: result.
	^ result
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:15'
}
CollectionValueHolder>>removeIndex: removedIndex [

	| result |
	result := value removeIndex: removedIndex.
	self valueRemoved: result.
	^ result
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:15'
}
CollectionValueHolder>>removeLast [

	| result |
	result := value removeLast.
	self valueRemoved: result.
	^ result
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:15'
}
CollectionValueHolder>>removeLast: n [

	| result |
	result := value removeLast: n.
	self valueRemoved: result.
	^ result
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:15'
}
CollectionValueHolder>>replace: aBlock [
	value replace: aBlock.
	self valueChanged
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:15'
}
CollectionValueHolder>>replaceAll: oldObject with: newObject [
	value replaceAll: oldObject with: newObject.
	self valueChanged: oldObject
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:15'
}
CollectionValueHolder>>reset [

	value reset.
	self valueChanged
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:15'
}
CollectionValueHolder>>resetTo: index [

	value resetTo: index.
	self valueChanged
]

{
	#category : #override,
	#timestamp : ' 8/31/2017 05:26:15'
}
CollectionValueHolder>>size  [

	^ value size
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:15'
}
CollectionValueHolder>>sort: aSortBlock  [

	value sort: aSortBlock .
	self valueChanged
]

{
	#category : #announcing,
	#timestamp : ' 8/31/2017 05:26:15'
}
CollectionValueHolder>>valueAdded: newValue [
	announcer announce: (ValueAdded newValue: newValue).
	self valueChanged: newValue
]

{
	#category : #announcing,
	#timestamp : ' 8/31/2017 05:26:15'
}
CollectionValueHolder>>valueRemoved: oldValue [
	announcer announce: (ValueRemoved oldValue: oldValue).
	self valueChanged: oldValue
]

{
	#category : #announcements,
	#timestamp : ' 8/31/2017 05:26:15'
}
CollectionValueHolder>>whenAddedDo: aBlock [
	"Culled block [ :newValue :announcement | ]"

	announcer when: ValueAdded do: [ :ann | aBlock cull: ann newValue cull: ann ]
]

{
	#category : #announcements,
	#timestamp : ' 8/31/2017 05:26:15'
}
CollectionValueHolder>>whenRemovedDo: aBlock [
	"Culled block [ :oldValue :announcement | ]"

	announcer when: ValueRemoved do: [ :ann | aBlock cull: ann oldValue cull: ann ]
]
