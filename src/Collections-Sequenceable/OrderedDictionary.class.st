"
I am a collection that act as a Dictionary except that I use key insertion order when enumerating, printing, or returing collections of keys/values/associations, but not when testing for equality (but it does not matters in this case).

I will assume that you know the Dictionary class in this comment.

Description
--------------------

I work mainly as a Dictionary except that I also store the keys in an Array that keeps the order of elements. 

I should be used ONLY if you need to keep the keys ordered. Else you should use a Dictionary that is faster and keep less values into memory. (I duplicate the keys).
Insertion, update, and inclusion testing have O(1) complexity while removing has O(n) worst-case.

Public API and Key Messages
--------------------

- #at: aKey put: aValue / #at: aKey ifAbsentPut: aValue 		allow to add an element.
  
- #at: aKey / #at: aKey ifAbsent: aBlock / #at: aKey ifPresent: aBlock ifAbsent: aBlock 		allow to access my values.

- #keysDo: aBlock / #valuesDo: aBlock / #associationsDo: 		allow to iterate on me effectively.
		
- #keyAtIndex: anIndex / KeyAtIndex: anIndex ifAbsent: aBlock 		allow to acess my keys from an index.

Examples
------------------

	""For basic examples see Dictionary comment.""
	
	ordDic := (Dictionary with: 1 -> $a with: 2 -> $b) asOrderedDictionary.
	ordDic.   		""returns:  an OrderedDictionary(1->$a 2->$b)""
	ordDic keyAtIndex: 2.		""returns:  2""
	
Internal Representation and Key Implementation Points.
-------------------

    Instance Variables
	dictionary:			<Dictionary>		A dictionary where I store my keys and values.
	orderedKeys:		<Array>			An ordered collection where I store my keys to maintain the order.

I base my implementation on a Dictionary and when I need to execute an action where the order of the values is important I use the keys in my ordered collection.
"
Class {
	#name : #OrderedDictionary,
	#superclass : #Collection,
	#instVars : [
		'dictionary',
		'orderedKeys'
	],
	#category : #Collections-Sequenceable,
	#timestamp : 'VincentBlondeau 4/1/2016 18:22'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedDictionary class>>new [
	^ self new: 10
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedDictionary class>>new: aCapacity [
	^ self basicNew initialize: aCapacity
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedDictionary class>>newFrom: anAssociationCollection [
	| newDictionary |

	newDictionary := self new: anAssociationCollection size.
	anAssociationCollection associationsDo: [:each |
		newDictionary
			at: each key
			put: each value].
	^ newDictionary.
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedDictionary class>>newFromPairs: aSequenceableCollection [
	| newDictionary |

	newDictionary := self new: (aSequenceableCollection size / 2) floor.
	1 to: aSequenceableCollection size - 1 by: 2 do: [:i |
		newDictionary
			at: (aSequenceableCollection at: i)
			put: (aSequenceableCollection at: i + 1)].
	^ newDictionary.
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedDictionary>>= anObject [
	self == anObject
		ifTrue: [^ true].

	(self species == anObject species
		and: [self size = anObject size])
		ifFalse: [^ false].

	dictionary associationsDo: [:each |
		(anObject at: each key ifAbsent: [^ false]) = each value
			ifFalse: [^ false]].
	^ true.
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedDictionary>>add: anAssociation [
	| oldSize |

	oldSize := dictionary size.
	dictionary add: anAssociation.
	dictionary size > oldSize
		ifTrue: [
			orderedKeys size > oldSize
				ifFalse: [self growOrderedKeys].
			orderedKeys at: oldSize + 1 put: anAssociation key].
	^ anAssociation.
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedDictionary>>addAll: anAssociationCollection [
	"Since Collection implements #associationsDo:, this method can accept
	any collection of associations including Arrays and OrderedCollections"

	anAssociationCollection associationsDo: [:each | self add: each].
	^ anAssociationCollection.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedDictionary>>associationAt: aKey [
	^ dictionary associationAt: aKey
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedDictionary>>associationAt: aKey ifAbsent: aBlock [
	^ dictionary associationAt: aKey ifAbsent: aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedDictionary>>associationAt: aKey ifPresent: aBlock [
	^ dictionary associationAt: aKey ifPresent: aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedDictionary>>associations [
	| associations i |

	associations := Array new: self size.
	i := 1.
	self associationsDo: [:each |
		associations at: i put: each.
		i := i + 1].
	^ associations.
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedDictionary>>associationsDo: aBlock [
	self keysDo: [:each | aBlock value: (self associationAt: each)]
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedDictionary>>associationsSelect: aBlock [
	^ self species newFrom: (self associations select: aBlock)
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedDictionary>>at: aKey [
	^ dictionary at: aKey
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedDictionary>>at: aKey ifAbsent: aBlock [
	^ dictionary at: aKey ifAbsent: aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedDictionary>>at: aKey ifAbsentPut: aBlock [
	^ self at: aKey ifAbsent: [self at: aKey put: aBlock value]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedDictionary>>at: aKey ifPresent: aBlock [
	^ dictionary at: aKey ifPresent: aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedDictionary>>at: aKey ifPresent: aPresentBlock ifAbsent: anAbsentBlock [
	^ dictionary
		at: aKey
		ifPresent: aPresentBlock
		ifAbsent: anAbsentBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedDictionary>>at: aKey ifPresent: aPresentBlock ifAbsentPut: anAbsentBlock [
	^ dictionary
		at: aKey
		ifPresent: aPresentBlock
		ifAbsentPut: anAbsentBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedDictionary>>at: aKey put: aValue [
	| oldSize |

	oldSize := dictionary size.
	dictionary at: aKey put: aValue.
	dictionary size > oldSize
		ifTrue: [
			orderedKeys size > oldSize
				ifFalse: [self growOrderedKeys].
			orderedKeys at: oldSize + 1 put: aKey].
	^ aValue.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedDictionary>>bindingOf: varName [
	^ self associationAt: varName ifAbsent: [nil]
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedDictionary>>bindingsDo: aBlock [
	self associationsDo: aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedDictionary>>capacity [
	^ dictionary capacity
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedDictionary>>collect: aBlock [
	^ self species newFrom:
		(self associations collect: [:each |
			each key -> (aBlock value: each value)])
]

{
	#category : #adding,
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedDictionary>>declare: aKey from: aDictionary [
	(self includesKey: aKey)
		ifTrue: [^ self].

	(aDictionary includesKey: aKey)
		ifTrue: [
			self add: (aDictionary associationAt: aKey).
			aDictionary removeKey: aKey]
		ifFalse: [self add: aKey -> nil]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedDictionary>>dictionary [
	^ dictionary
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedDictionary>>dictionaryClass [
	^ Dictionary
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedDictionary>>do: aBlock [
	self valuesDo: aBlock
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedDictionary>>errorInvalidIndex: anIndex [
	SubscriptOutOfBounds signalFor: anIndex
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedDictionary>>growOrderedKeys [
	orderedKeys :=
		(Array new: ((orderedKeys size * 1.5) asInteger max: 10))
			replaceFrom: 1
			to: orderedKeys size
			with: orderedKeys
			startingAt: 1.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedDictionary>>hasBindingThatBeginsWith: aString [
	^ dictionary hasBindingThatBeginsWith: aString
]

{
	#category : #comparing,
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedDictionary>>hash [
	^ dictionary hash
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedDictionary>>identityIndexOfKey: aKey [
	^ self identityIndexOfKey: aKey ifAbsent: [0]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedDictionary>>identityIndexOfKey: aKey ifAbsent: aBlock [
	1 to: self size do: [:i |
		(orderedKeys at: i) == aKey
			ifTrue: [^ i]].
	^ aBlock value.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedDictionary>>includes: anObject [
	^ dictionary includes: anObject
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedDictionary>>includesAssociation: anAssociation [
	^ dictionary includesAssociation: anAssociation
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedDictionary>>includesIdentity: anObject [
	^ dictionary includesIdentity: anObject
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedDictionary>>includesKey: aKey [
	^ dictionary includesKey: aKey
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedDictionary>>indexOfKey: aKey [
	^ self indexOfKey: aKey ifAbsent: [0]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedDictionary>>indexOfKey: aKey ifAbsent: aBlock [
	1 to: self size do: [:i |
		(orderedKeys at: i) = aKey
			ifTrue: [^ i]].
	^ aBlock value.
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedDictionary>>initialize: aCapacity [
	dictionary := self dictionaryClass new: aCapacity.
	orderedKeys := Array new: aCapacity.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedDictionary>>isDictionary [
	^ true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedDictionary>>isHealthy [
	^ dictionary isHealthy
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedDictionary>>keyAtIdentityValue: aValue [
	^ dictionary keyAtIdentityValue: aValue
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedDictionary>>keyAtIdentityValue: aValue ifAbsent: aBlock [
	^ dictionary keyAtIdentityValue: aValue ifAbsent: aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedDictionary>>keyAtIndex: anIndex [
	^ self keyAtIndex: anIndex ifAbsent: [self errorInvalidIndex: anIndex]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedDictionary>>keyAtIndex: anIndex ifAbsent: aBlock [
	(anIndex > 0 and: [anIndex <= self size])
		ifTrue: [^ orderedKeys at: anIndex]
		ifFalse: [^ aBlock value]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedDictionary>>keyAtValue: aValue [
	^ dictionary keyAtValue: aValue
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedDictionary>>keyAtValue: aValue ifAbsent: aBlock [
	^ dictionary keyAtValue: aValue ifAbsent: aBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedDictionary>>keyForIdentity: anObject [
	^ dictionary keyForIdentity: anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedDictionary>>keys [
	^ orderedKeys copyFrom: 1 to: self size
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedDictionary>>keysAndValuesDo: aBlock [
	self keysDo: [:each | aBlock value: each value: (self at: each)]
]

{
	#category : #removing,
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedDictionary>>keysAndValuesRemove: aTwoArgumentBlock [
	| removedAssociations |

	removedAssociations := OrderedCollection new.
	self associationsDo: [:each |
		(aTwoArgumentBlock value: each key value: each value)
			ifTrue: [removedAssociations add: each]].
	removedAssociations do: [:each | self removeKey: each key].
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedDictionary>>keysDo: aBlock [
	1 to: self size do: [:i | aBlock value: (orderedKeys at: i)]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedDictionary>>keysSortedSafely [
	^ dictionary keysSortedSafely
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedDictionary>>orderedKeys [
	^ orderedKeys
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedDictionary>>orderedKeysIndexOf: aKey [
	^ orderedKeys indexOf: aKey
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedDictionary>>orderedKeysRemove: aRemovedKey [
	| index |

	index := self orderedKeysIndexOf: aRemovedKey.

	"shift every remaining key after to the left by one"
	orderedKeys
		replaceFrom: index
		to: self size
		with: orderedKeys
		startingAt: index + 1.

	"one key was removed and the rest shifted, so nil what was the last
	key slot before removing and shifting"
	orderedKeys
		at: self size + 1
		put: nil.
]

{
	#category : #copying,
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedDictionary>>postCopy [
	orderedKeys := orderedKeys copy.
	dictionary := dictionary copy.
]

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedDictionary>>printElementsOn: aStream [
	aStream nextPut: $(.
	self size > 100
		ifTrue: [
			aStream nextPutAll: 'size '.
			self size printOn: aStream]
		ifFalse: [
			self associations withIndexDo: [:each :i |
				aStream
					print: each key;
					nextPutAll: '->';
					print: each value.
				(i < self size)
					ifTrue: [aStream space]]].
	aStream nextPut: $).
]

{
	#category : #removing,
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedDictionary>>remove: anObject ifAbsent: aBlock [
	self shouldNotImplement
]

{
	#category : #removing,
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedDictionary>>removeAll [
	1 to: self size do: [:i | orderedKeys at: i put: nil].
	dictionary removeAll.
]

{
	#category : #removing,
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedDictionary>>removeKey: aKey [
	| value |

	value := dictionary removeKey: aKey.
	self orderedKeysRemove: aKey.
	^ value.
]

{
	#category : #removing,
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedDictionary>>removeKey: aKey ifAbsent: aBlock [
	| oldSize value |

	oldSize := dictionary size.
	value := dictionary removeKey: aKey ifAbsent: aBlock.
	dictionary size < oldSize
		ifTrue: [self orderedKeysRemove: aKey].
	^ value.
]

{
	#category : #removing,
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedDictionary>>removeKeys: aKeyCollection [
	"Fast removal of multiple keys; returns self to avoid
	having to create a removed value collection and does not
	raise errors."

	aKeyCollection	size > 1
		ifTrue: [| oldSize newOrderedKeys newOrderedKeysIndex |
			oldSize := self size.
			aKeyCollection do: [:each |
				dictionary
					removeKey: each
					ifAbsent: [nil]].

			newOrderedKeys := Array new: oldSize.
			newOrderedKeysIndex := 0.
			1 to: oldSize do: [:i | | key |
				(dictionary includesKey: (key := orderedKeys at: i))
					ifTrue: [
						newOrderedKeys
							at: (newOrderedKeysIndex := newOrderedKeysIndex + 1)
							put: key]].

			orderedKeys := newOrderedKeys]
		ifFalse: [
			aKeyCollection size = 1
				ifTrue: [
					"use #anyOne, because it can be a Set"
					self
						removeKey: aKeyCollection anyOne
						ifAbsent: [nil]]]
]

{
	#category : #removing,
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedDictionary>>removeUnreferencedKeys [
	^ self unreferencedKeys do: [:each | self removeKey: each]
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedDictionary>>select: aBlock [
	^ self species newFrom:
		(self associations select: [:each | aBlock value: each value])
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedDictionary>>size [
	^ dictionary size
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedDictionary>>unreferencedKeys [
	^ Dictionary unreferencedKeysIn: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedDictionary>>values [
	^ self associations collect: [:each | each value]
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 07:16:17'
}
OrderedDictionary>>valuesDo: aBlock [
	self keysDo: [:each | aBlock value: (self at: each)]
]
