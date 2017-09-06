"
SUnit tests for dictionaries
"
Class {
	#name : #DictionaryTest,
	#superclass : #CollectionRootTest,
	#traits : 'TIncludesTest + TDictionaryAddingTest + TDictionaryComparingTest + TDictionaryCopyingTest + TDictionaryEnumeratingTest + (TDictionaryPrintingTest - {#testPrintElementsOn. #testStoreOn}) + TDictionaryRemovingTest + (TPutBasicTest - {#testAtPutOutOfBounds}) + TAsStringCommaAndDelimiterTest + TPrintTest + TConvertTest + TConvertAsSortedTest + (TCopyTest - {#testCopyEmptyWithout. #testCopyNonEmptyWithout. #testCopyNonEmptyWithoutNotIncluded}) + TSetArithmetic + TDictionaryIncludesWithIdentityCheckTest + TDictionaryValueAccessTest + TDictionaryKeysValuesAssociationsAccess + TDictionaryKeyAccessTest + TDictionaryAssociationAccessTest + TStructuralEqualityTest + TOccurrencesForMultiplinessTest',
	#classTraits : 'TIncludesTest classTrait + TDictionaryAddingTest classTrait + TDictionaryComparingTest classTrait + TDictionaryCopyingTest classTrait + TDictionaryEnumeratingTest classTrait + TDictionaryPrintingTest classTrait + TDictionaryRemovingTest classTrait + TPutBasicTest classTrait + TAsStringCommaAndDelimiterTest classTrait + TPrintTest classTrait + TConvertTest classTrait + TConvertAsSortedTest classTrait + TCopyTest classTrait + TSetArithmetic classTrait + TDictionaryIncludesWithIdentityCheckTest classTrait + TDictionaryValueAccessTest classTrait + TDictionaryKeysValuesAssociationsAccess classTrait + TDictionaryKeyAccessTest classTrait + TDictionaryAssociationAccessTest classTrait + TStructuralEqualityTest classTrait + TOccurrencesForMultiplinessTest classTrait',
	#instVars : [
		'emptyDict',
		'nonEmptyDict',
		'nonEmpty5ElementsNoDuplicates',
		'indexArray',
		'valueArray',
		'nonEmpty1Element',
		'collectionNotIncluded',
		'collectionIncluded',
		'associationNotIn',
		'valueNotIn',
		'keyNotIn',
		'dictionaryNotIncluded',
		'nonEmptyWithFloat',
		'dictionaryWithDuplicateValues',
		'duplicateValue'
	],
	#classInstVars : [
		'testToto',
		'pt1'
	],
	#category : #Collections-Tests-Unordered,
	#timestamp : 'TorstenBergmann 2/20/2014 15:20'
}

{
	#category : #helpers,
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>aValue [

	^ 33
]

{
	#category : #helpers,
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>anIndex [

	^ #GG
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>anotherElementNotIn [
	^ 42
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>anotherElementOrAssociationIn [
	" return an element (or an association for Dictionary ) present  in 'collection' "
	^ self collection associations anyOne.
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>anotherElementOrAssociationNotIn [
	" return an element (or an association for Dictionary )not present  in 'collection' "
	^ associationNotIn 
]

{
	#category : #helpers,
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>anotherValue [

	^ 66
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>associationWithKeyAlreadyInToAdd [
	" return an association that will be used to add to nonEmptyDict (the key of this association is already included in nonEmptyDict)"
	^ (self nonEmptyDict keys anyOne)->valueNotIn .
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>associationWithKeyNotInToAdd [
	" return an association that will be used to add to nonEmptyDict"
	^ associationNotIn 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>canBeUnhealthy [
	^ true
]

{
	#category : #setup,
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>classToBeTested  [

	^ Dictionary
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>collection [
	^ self nonEmptyDict
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>collectionClass [
" return the class to be used to create instances of the class tested"
	^ self classToBeTested
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>collectionNotIncluded [
" return a collection for wich each element is not included in 'nonEmpty' "
	^collectionNotIncluded 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>collectionWithElement [
	"Returns a collection that already includes what is returned by #element."
	^ nonEmpty5ElementsNoDuplicates add: self element ;yourself.
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>collectionWithElementsToRemove [
" return a collection of elements included in 'nonEmpty'  "
	^ collectionIncluded  
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>collectionWithEqualElements [
" return a collecition including atLeast two elements equal"

^ dictionaryWithDuplicateValues 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>collectionWithSortableElements [
" return a collection elements that can be sorte ( understanding message ' < '  or ' > ')"
	^ nonEmpty5ElementsNoDuplicates 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>collectionWithoutEqualElements [
" return a collection without equal elements"
	^ nonEmpty5ElementsNoDuplicates 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>collectionWithoutNilElements [
" return a collection that doesn't includes a nil element  and that doesn't includes equal elements'"
	^nonEmpty5ElementsNoDuplicates 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>element [
	^ 30
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>elementNotIn [
	"return an element not included in 'nonEmpty' "
	^ valueNotIn
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>elementNotInForOccurrences [
	^ 666
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>elementToAdd [
" return an element of type 'nonEmpy' elements'type'"
	^ #u->5.
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>elementTwiceInForOccurrences [
" return an element included exactly two time in # collectionWithEqualElements"
^ duplicateValue 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>empty [
	^ emptyDict
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>emptyDict [
	^ emptyDict
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>expectedElementByDetect [
	^ 30
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>expectedSizeAfterReject [
	self flag: 'what should this return?'
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>indexInNonEmpty [
" return an index between bounds of 'nonEmpty' "

	^ #a
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>integerCollectionWithoutEqualElements [
" return a collection of integer without equal elements"
	^ nonEmpty5ElementsNoDuplicates 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>keyNotIn [
" return a key not included in nonEmpty"
^ keyNotIn 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>keyNotInNonEmpty [
	" return a key not included in nonEmpty"
	^ keyNotIn 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>keyNotInNonEmptyDict [
" return a key not included in nonEmptyDict"
	^ keyNotIn 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>newEmptyDict [
	^ self emptyDict copy
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>nonEmpty [
	^ nonEmptyDict
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>nonEmpty1Element [
" return a collection of size 1 including one element"
	^ nonEmpty1Element 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>nonEmptyDict [
	^ nonEmptyDict 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>nonEmptyDifferentFromNonEmptyDict [
" return a dictionary for which all keys are not included in nonEmptyDict"
^ dictionaryNotIncluded 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>nonEmptyWithCopyNonIdentical. [
" return a collection including elements for wich copy is not identical to the initial element ( this is not the cas of Integer )"
^nonEmptyWithFloat 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>nonEmptyWithoutEqualsValues [
" return a dictionary that doesn't include equal values'"
^nonEmpty5ElementsNoDuplicates 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>otherCollection [
	"Returns a collection that does not include what is returned by #element."
	^ nonEmpty5ElementsNoDuplicates 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>otherDictionaryClasses [
	"(DictionaryTest withAllSubclasses collect: [:each | each new classToBeTested]) asArray"
	^ {SmallDictionary. IdentityDictionary. PluggableDictionary.
		WeakValueDictionary. SystemDictionary. WeakKeyDictionary. SmallIdentityDictionary.
		WeakIdentityKeyDictionary. WeakKeyToCollectionDictionary. Dictionary}
			reject: [:each | each new species == self classToBeTested new species]
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>result [
	^ self collectionClass newFromPairs: {
		#a . SmallInteger .
		#b . SmallInteger .
		#c . SmallInteger .
		#d . SmallInteger }
]

{
	#category : #setup,
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>setUp [
	emptyDict := self classToBeTested new.
	nonEmptyDict := self classToBeTested new.
	nonEmptyDict
		at: #a
			put: self elementTwiceIn;
		at: #b
			put: 30;
		at: #c
			put: self elementTwiceIn;
		at: #d
			put: -2.
	nonEmpty5ElementsNoDuplicates := self classToBeTested new
		at: #a
			put: 5;
		at: #b
			put: 4;
		at: #c
			put: 7;
		at: #d
			put: 6;
		at: #e
			put: 9;
		yourself.
	valueNotIn := 666.
	keyNotIn := #z .
	associationNotIn := keyNotIn->valueNotIn.
	dictionaryNotIncluded := Dictionary new add: associationNotIn ;yourself.
	collectionNotIncluded := {  valueNotIn. valueNotIn  }.
	collectionIncluded := {  (self elementTwiceIn)  }.
	indexArray := #(2 3 1 ).
	valueArray := #(5 5 5 ).
	nonEmpty1Element := self classToBeTested new
		at: #a
			put: 5;
		yourself.
	nonEmptyWithFloat := Dictionary new add: #A->2.5; add: #b->3.5 ; yourself.
	duplicateValue := 2.5.
	dictionaryWithDuplicateValues := 	Dictionary new add: #A->duplicateValue ; add: #b->3.5 ; add: #C->duplicateValue  ; yourself.


]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>sizeCollection [
	^ nonEmptyDict
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>speciesClass [
	^ Dictionary
]

{
	#category : #'test - adding',
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>testAdd [
	"| dict |
	dict := self emptyDict.
	dict add: #a -> 1.
	dict add: #b -> 2.
	self assert: (dict at: #a) = 1.
	self assert: (dict at: #b) = 2"
	| dictionary result |
	dictionary := self nonEmptyDict.
	result := dictionary add: self associationWithKeyNotInToAdd.
	self assert: result = self associationWithKeyNotInToAdd
]

{
	#category : #'test - adding',
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>testAddWithKeyAlreadyIn [
	| dictionary result association |
	dictionary := self nonEmptyDict.
	association := self associationWithKeyNotInToAdd.
	result := dictionary add: association.
	self assert: result = association.
	self assert: (dictionary at: association key) = association value
]

{
	#category : #'test - adding',
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>testAddWithKeyNotIn [
	| dictionary result association |
	dictionary := self nonEmptyDict.
	association := self associationWithKeyNotInToAdd.
	result := dictionary add: association.
	self assert: result = association.
	self assert: (dictionary at: association key) = association value
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>testAsSet [
	"Non regression test for http://bugs.squeak.org/view.php?id=7258"
	
	| aDictionary aSet assoc0 assoc1 |
	
	"Create a dictionary"
	aDictionary := Dictionary new.
	
	"Convert it to a Set"
	aSet := aDictionary asSet.

	"Add two associations to it"	
	assoc0 := #first -> 0.
	assoc1 := #first -> 1.
	aSet add: assoc0 copy; add: assoc1.
	
	"Check if the two associations were added (that should happen if they are different)"
	self
		assert: (assoc0 copy ~= assoc1) ==> (aSet size > 1)
		description:
  			'When adding two different elements, the set size should be greater than one'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>testDictionaryPublicProtocolCompatibility [
	"Tests that other dictionaries and their classes respond to the messages
	in the public protocols (ignoring extensions, private, printing, copying,
	and comparing) that Dictionary and its metaclass implement."

	| dict |
	self collectionClass == Dictionary
		ifTrue: [ ^ self ].
	dict := self emptyDict.
	{(dict -> Dictionary).
	(dict class -> Dictionary class)}
		do: [ :assoc | 
			assoc value protocols
				reject: [ :protocol | 
					#('private' 'print' 'copy' 'compar' '*')
						anySatisfy: [ :each | protocol asString beginsWith: each ] ]
				thenDo: [ :protocol | 
					(assoc value selectorsInProtocol: protocol)
						do: [ :each | self assert: (assoc key respondsTo: each) ] ] ]
]

{
	#category : #'test - testing',
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>testHasBindingThatBeginsWith [
	| newDict |
	newDict := self collectionClass new 
		at: #abc put: 10; 
		at: #abcd put: 100; 
		at: #def put: 20; 
		yourself.
	self assert: (newDict hasBindingThatBeginsWith: 'ab').
	self assert: (newDict hasBindingThatBeginsWith: 'def').
	self deny: (newDict hasBindingThatBeginsWith: 'defg').
]

{
	#category : #'test - testing',
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>testIncludeAssociation [
	self assert: (nonEmptyDict includesAssociation: #a -> self elementTwiceIn).
	self assert: (nonEmptyDict includesAssociation: (nonEmptyDict associations first)).

]

{
	#category : #'test - testing',
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>testIncludes [
	| o1 o2 newDict |
	self assert: (nonEmptyDict includes: self element).
	
	o1 := 2 @ 3.
	o2 := 2 @ 3.
	self deny: (o1 == o2).
	self assert: (o1 = o2).
	newDict := self collectionClass new.
	newDict at: #a put: o1.
	
	self assert: (newDict includes: o2).

]

{
	#category : #'test - testing',
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>testIncludesAssociationNoValue [

	| association dictionary |
	
	association := Association key: #key.
	
	self assert: association value isNil.
	
	dictionary := self collectionClass new.
	
	dictionary add: association.
	
	self assert: (dictionary at: #key) isNil

	
	
	
]

{
	#category : #'test - testing',
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>testIncludesAssociationWithValue [

	| association dictionary |
	
	association := Association key: #key value: 1.
	dictionary := self collectionClass new.
	dictionary add: association.
	
	self assert: (dictionary at: #key) = 1

	
	
	
]

{
	#category : #'tests - includes',
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>testIncludesElementIsNotThere [
	"self debug: #testIncludesElementIsNotThere"
	self deny: (self nonEmpty includes: self elementNotInForOccurrences).
	self assert: (self nonEmpty includes: self nonEmpty anyOne).
	self deny: (self empty includes: self elementNotInForOccurrences)
]

{
	#category : #'test - testing',
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>testIsDictionary [
	self deny: Object new isDictionary.
	self assert: nonEmptyDict isDictionary.
	self assert: emptyDict isDictionary.
]

{
	#category : #'test - integrity',
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>testIsHealthy [
	| dict |
	self canBeUnhealthy
		ifFalse: [
			self assert: self nonEmpty isHealthy.
			^ self ].
	dict := self emptyDict.
	[ | a1 a2 |
	"we use associations as keys on purpose, because they change their
	hash depending on the key"
	a1 := 1 -> 2.
	a2 := 2 -> 2.
	dict
		at: a1 put: 2;
		at: a2 put: 3.
	self assert: dict isHealthy.
	a1 key: 0.
	a2 key: 0.
	self deny: dict isHealthy ]
		ensure: [ dict removeAll ]
]

{
	#category : #'tests - dictionary key access',
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>testKeyAtIdentityValueIfAbsent [
	"self run: #testKeyAtValue"

	"self debug: #testKeyAtValue"

	| dict value result |
	dict := self nonEmpty.
	value := dict values anyOne.
	result := dict keyAtIdentityValue: value ifAbsent: [ nil ].
	self assert: (dict at: result) = value.
	self assert: (dict keyAtIdentityValue: self valueNotIn ifAbsent: [ nil ]) isNil
]

{
	#category : #'tests - dictionary key access',
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>testKeyAtValueIfAbsent [
	"self run: #testKeyAtValue"

	"self debug: #testKeyAtValue"

	| dict value result |
	dict := self nonEmpty.
	value := dict values anyOne.
	result := dict keyAtValue: value ifAbsent: [ nil ].
	self assert: (dict at: result) = value.
	self assert: (dict keyAtValue: self valueNotIn ifAbsent: [ nil ]) isNil
]

{
	#category : #'test - testing',
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>testKeyForIdentity [
	self assert: (nonEmptyDict keyForIdentity: 30) = #b.

	"The value 20 is associated to two different associations"
	self assert: (#(a c) includes: (nonEmptyDict keyForIdentity: self elementTwiceIn))
]

{
	#category : #'test - new',
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>testNew [
	| d |
	d := self classToBeTested new: 10.
	self assert: d size = 0.
	
	"Why 14? Mysterious"
	"self assert: d capacity = 14"
]

{
	#category : #'test - new',
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>testNewFrom [
	| assocs |

	self assert: (self classToBeTested newFrom: {}) = self emptyDict.

	self assert: (self classToBeTested newFrom: nonEmptyDict copy) = self nonEmptyDict.

	assocs := self nonEmptyDict associations collect: [:each | each copy].
	self assert: (self classToBeTested newFrom: assocs) = self nonEmptyDict.

]

{
	#category : #'test - new',
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>testNewFromPairs [
	| assocs pairs |

	assocs := self nonEmptyDict associations.
	pairs := OrderedCollection new.
	assocs do: [:each |
		pairs
			add: each key;
			add: each value].
	0 to: pairs size do: [:i | | dictFromPairs dictFromAssocs |
		dictFromPairs := self classToBeTested newFromPairs: (pairs copyFrom: 1 to: i).
		dictFromAssocs := self classToBeTested newFrom: (assocs copyFrom: 1 to: (i / 2) floor).
		self assert: dictFromPairs = dictFromAssocs].
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>testNilHashCollision [
	"Ensures that fixCollisionsFrom: does the right thing in the presence of a nil key"
	| dict key |
	self supportsNilKey
		ifFalse: [ ^ self ].
	dict := self collectionClass new.
	key := nil hash. "any key with same hash as nil"
	dict at: key hash put: 1.
	dict at: nil put: 2.
	self assert: (dict includesKey: nil).
	dict removeKey: key.
	self assert: (dict includesKey: nil).

]

{
	#category : #'test - testing',
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>testOccurrencesOf [
	"self run:#testOccurrencesOf" 
	
	| dict |
	dict := self collectionClass new.
	dict at: #a put: 1.
	dict at: #b put: 2.
	dict at: #c put: 1.
	dict at: #d put: 3.
	dict at: nil put: nil.
	dict at: #z put: nil.
	
	
	self assert: (dict occurrencesOf: 1 ) equals: 2.
	self supportsNilKey 
		ifTrue: [ 	self assert: (dict occurrencesOf: nil ) equals: 2 ]
		ifFalse: [ 	self assert: (dict occurrencesOf: nil ) equals: 1 ].	
	
	
	
]

{
	#category : #'test - comparing',
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>testOtherDictionaryEquality [
	self otherDictionaryClasses do: [:each | | nonEmptyDict2 |
		nonEmptyDict2 := each new.
		self deny: self empty = nonEmptyDict2.
		self deny: nonEmptyDict2 = self empty.

		self nonEmptyDict keysAndValuesDo: [:key :value | nonEmptyDict2 at: key put: value].
		self deny: self nonEmptyDict = nonEmptyDict2.
		self deny: nonEmptyDict2 = self nonEmptyDict]
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>testRemoveAll [
	"Allows one to remove all elements of a collection" 
	
	| dict1 dict2 s2 |
	dict1 := self collectionClass new.
	dict1 
		at: #a put:1 ; 
		at: #b put: 2. 
		
	dict2 := dict1 copy.
	s2 := dict2 size.
	
	dict1 removeAll.
	
	self assert: dict1 size = 0.
	self assert: dict2 size = s2 description: 'the copy has not been modified'.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>testSelectIsNotShallowCopy [
	"self debug: #testSelectIsNotShallowCopy"
	
	| original even |
	original := self collectionClass new.
	original at: #one put: 1.
	original at: #two put: 2.

	even := original select: [:value |value even].
	even at: #two put: 'deux'.

	self assert: (original at: #two) = 2
 	   description: 'modifying a selection should not modify the original'
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>valueNotIn [
" return a value not included in nonEmpty "
^valueNotIn 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
DictionaryTest>>valueNotInNonEmpty [
	" return a value not included in nonEmpty"
	^ valueNotIn 
]
