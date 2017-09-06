"
This is the unit test for the class Set. Unit tests are a good way to exercise the functionality of your system in a repeatable and automatic manner. They are therefore recommended if you plan to release anything. For more information, see: 
	- http://www.c2.com/cgi/wiki?UnitTest
	- there is a chapter in the PharoByExample book (http://pharobyexample.org/)
	- the sunit class category
"
Class {
	#name : #SetTest,
	#superclass : #CollectionRootTest,
	#traits : 'TAddForUniquenessTest + TIncludesWithIdentityCheckTest + TCloneTest + TCopyTest + TRemoveTest + TGrowableTest + TStructuralEqualityTest + TPrintTest + TAsStringCommaAndDelimiterTest + TConvertTest + TConvertAsSortedTest + TConcatenationEqualElementsRemovedTest + TOccurrencesTest + (TCreationWithTest - {#testOfSize. #collectionClass}) + (TSetArithmetic - {#collectionClass})',
	#classTraits : 'TAddForUniquenessTest classTrait + TIncludesWithIdentityCheckTest classTrait + TCloneTest classTrait + TCopyTest classTrait + TRemoveTest classTrait + TGrowableTest classTrait + TStructuralEqualityTest classTrait + TPrintTest classTrait + TAsStringCommaAndDelimiterTest classTrait + TConvertTest classTrait + TConvertAsSortedTest classTrait + TConcatenationEqualElementsRemovedTest classTrait + TOccurrencesTest classTrait + TCreationWithTest classTrait + TSetArithmetic classTrait',
	#instVars : [
		'full',
		'empty',
		'collectResult',
		'emptyButAllocatedWith20',
		'elementNotIn',
		'collectionOfFloat',
		'collectionIncluded',
		'nonEmpty1element',
		'withoutEqualElements',
		'collection5Elements',
		'collectionWith3Elements'
	],
	#category : #Collections-Tests-Unordered,
	#timestamp : '<historical>'
}

{
	#category : #'tests - includes',
	#timestamp : ' 8/31/2017 05:26:28'
}
SetTest>>anotherElementNotIn [
	^ 42
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
SetTest>>anotherElementOrAssociationIn [
	" return an element (or an association for Dictionary ) present  in 'collection' "
	^ self collection  anyOne
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
SetTest>>anotherElementOrAssociationNotIn [
	" return an element (or an association for Dictionary )not present  in 'collection' "
	^ elementNotIn 
]

{
	#category : #coverage,
	#timestamp : ' 8/31/2017 05:26:28'
}
SetTest>>classToBeTested [
	^ Set.
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
SetTest>>collection [

	^ collectionWith3Elements
]

{
	#category : #coverage,
	#timestamp : ' 8/31/2017 05:26:28'
}
SetTest>>collectionClass [
	" return the class to be used to create instances of the class tested"
	^ self classToBeTested
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
SetTest>>collectionInForIncluding [
	^ collectionIncluded 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
SetTest>>collectionMoreThan5Elements [
" return a collection including at least 5 elements"
	
	^ collection5Elements 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
SetTest>>collectionNotIncluded [
	^ self classToBeTested  with: elementNotIn. 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
SetTest>>collectionOfFloat [
	^ collectionOfFloat 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
SetTest>>collectionWithCopyNonIdentical [
	" return a collection that include elements for which 'copy' return a different object (this is not the case of SmallInteger)"
	^ collectionOfFloat
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
SetTest>>collectionWithElement [
	^ full
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
SetTest>>collectionWithElementsToRemove [
	^ collectionIncluded 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
SetTest>>collectionWithSortableElements [
" return a collection elements that can be sorte ( understanding message ' < '  or ' > ')"
	^collectionOfFloat 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
SetTest>>collectionWithoutElement [
	" return a collection that does not include 'element' "
	^ collectionWith3Elements  
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
SetTest>>collectionWithoutEqualElements [
" return a collection without equal elements"
	^ withoutEqualElements 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
SetTest>>collectionWithoutNilElements [
" return a collection that doesn't includes a nil element  and that doesn't includes equal elements'"
	^ collectionWith3Elements  
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
SetTest>>element [
	^ 4
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
SetTest>>elementInForIncludesTest [
" return an element included in nonEmpty "
	^ self nonEmpty anyOne
]

{
	#category : #ambiguous,
	#timestamp : ' 8/31/2017 05:26:28'
}
SetTest>>elementNotIn [
	^elementNotIn 
]

{
	#category : #'tests - includes',
	#timestamp : ' 8/31/2017 05:26:28'
}
SetTest>>elementNotInForOccurrences [
	^ 666
]

{
	#category : #'test - copy',
	#timestamp : ' 8/31/2017 05:26:28'
}
SetTest>>elementToAdd [
	^ 42
]

{
	#category : #'tests - empty',
	#timestamp : ' 8/31/2017 05:26:28'
}
SetTest>>empty [
	
	^ empty
]

{
	#category : #'tests - size capacity',
	#timestamp : ' 8/31/2017 05:26:28'
}
SetTest>>emptyButAllocatedWith20 [

	^ emptyButAllocatedWith20
]

{
	#category : #'test - iterate',
	#timestamp : ' 8/31/2017 05:26:28'
}
SetTest>>expectedSizeAfterReject [
	^1
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
SetTest>>firstCollection [
" return a collection that will be the first part of the concatenation"
	^ nonEmpty1element 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
SetTest>>integerCollectionWithoutEqualElements [
" return a collection of integer without equal elements"
	^ withoutEqualElements 
]

{
	#category : #'tests - empty',
	#timestamp : ' 8/31/2017 05:26:28'
}
SetTest>>nonEmpty [
	
	^ full
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
SetTest>>nonEmpty1Element [
" return a collection of size 1 including one element"
	^ nonEmpty1element 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
SetTest>>nonEmptyWithoutEqualElements [
" return a collection without equal elements "
	^ withoutEqualElements 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
SetTest>>result [

	 ^ collectResult
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
SetTest>>secondCollection [
" return a collection that will be the second part of the concatenation"
	^ collectionWith3Elements  
]

{
	#category : #'test - iterate',
	#timestamp : ' 8/31/2017 05:26:28'
}
SetTest>>selectedNumber [

	^ 2
	
]

{
	#category : #initialize,
	#timestamp : ' 8/31/2017 05:26:28'
}
SetTest>>setUp [
	empty := self classToBeTested  new.
	full := self classToBeTested  with: 1 with: 2 with: 3 with: 4.
	collectionIncluded := self classToBeTested  with: 2 with: 3 .
	collectionWith3Elements := self classToBeTested  new.
	collectionWith3Elements add: 1; add: -2; add: 3. 
	collectResult := self classToBeTested  new add: SmallInteger ; yourself.
	emptyButAllocatedWith20 := self classToBeTested  new: 20.
	elementNotIn := 99.
	collectionOfFloat := self classToBeTested  with: 2.5 with: 4.6 with: 4.2.
	nonEmpty1element := self classToBeTested  with: 32.
	withoutEqualElements := self classToBeTested  with: 4 with: 5 with: 2.
	collection5Elements := self classToBeTested with: 1 with: 2 with: 3 with: 4 with: 5.
]

{
	#category : #'tests - size capacity',
	#timestamp : ' 8/31/2017 05:26:28'
}
SetTest>>sizeCollection [

	^ full
]

{
	#category : #'test - iterate',
	#timestamp : ' 8/31/2017 05:26:28'
}
SetTest>>speciesClass [
	
	^ Set
]

{
	#category : #'tests - fixture',
	#timestamp : ' 8/31/2017 05:26:28'
}
SetTest>>test0FixtureAddForUniquenessTest [
	self element.
	self collectionWithElement.
	self assert: (self collectionWithElement includes: self element).
	self collectionWithoutElement.
	self assert: (self collectionWithElement includes: self element)
]

{
	#category : #'sunit original tests',
	#timestamp : ' 8/31/2017 05:26:28'
}
SetTest>>testAdd  [
	empty add: 5.
	self assert: (empty includes: 5).
]

{
	#category : #'tests - growable',
	#timestamp : ' 8/31/2017 05:26:28'
}
SetTest>>testAddNonEmptyGrowsWhenNewElement [
	"self debug: #testAddNonEmptyGrowsWhenNewElement"
	| oldSize |
	oldSize := self nonEmpty size.
	self deny: (self nonEmpty includes: self elementNotInForOccurrences).
	self nonEmpty add: self elementNotInForOccurrences.
	self assert: self nonEmpty size > oldSize
]

{
	#category : #'some tests',
	#timestamp : ' 8/31/2017 05:26:28'
}
SetTest>>testAddWithOccurences [
 
	empty add: 2 withOccurrences: 3.
	self assert: (empty includes: 2).
	self assert: ((empty occurrencesOf: 2) = 1).
]

{
	#category : #'tests - with nil',
	#timestamp : ' 8/31/2017 05:26:28'
}
SetTest>>testAllowInclusionOfNils [
	| set |
	set := self classToBeTested new.
	set add: nil.
	self assert: (set includes: nil).
	set remove: nil.
	self deny: (set includes: nil)
]

{
	#category : #'some tests',
	#timestamp : ' 8/31/2017 05:26:28'
}
SetTest>>testAsSet [
	"could be moved in Array or Collection"

	| newFull |
	newFull := #(1 2 3 ) asSet.
	newFull add: 4.
	self assert: (newFull = full).
]

{
	#category : #'tests - iterating',
	#timestamp : ' 8/31/2017 05:26:28'
}
SetTest>>testCollect [

	| res element collection|
	collection := self collectionWithoutNilElements.
	element := self element.
	res := collection collect: [:each | element].
	
	self assert:(res class == self classToBeTested).
	self assert: res size = 1.
	
	res do: [ :each|
		self assert: each = element ]
]

{
	#category : #'some tests',
	#timestamp : ' 8/31/2017 05:26:28'
}
SetTest>>testCollect2 [
	| newFull result |
	newFull := Set withAll: (1 to: 10).
	result := newFull collect: [:each | each >= 1 ifTrue: [each] ifFalse: ['no']].
	self assert: (result = newFull).
	result := newFull collect: [:each | each >= 5 ifTrue: [each] ifFalse: ['no']].
	self assert: (result = ((Set withAll: (5 to: 10)) add: 'no'; yourself)).
]

{
	#category : #'some tests',
	#timestamp : ' 8/31/2017 05:26:28'
}
SetTest>>testCopy [
	| newFull |
	full add: 3.
	full add: 2.
	newFull := full copy.
	self assert: (full size = newFull size).
	self assert: ((full select: [:each | (newFull includes: each) not]) isEmpty).
	self assert: ((newFull select: [:each | (full includes: each) not]) isEmpty).
]

{
	#category : #'tests - copy',
	#timestamp : ' 8/31/2017 05:26:28'
}
SetTest>>testCopyNonEmptyWithoutAllNotIncluded [
	
]

{
	#category : #'some tests',
	#timestamp : ' 8/31/2017 05:26:28'
}
SetTest>>testCopyWithout [
	| newFull | 
	full add: 3.
	full add: 2.
	newFull := full copyWithout: 3.
	self assert: (newFull size = (full size - 1)).
	self deny: (newFull includes: 3).
	self assert: ((newFull select: [:each | (full includes: each) not]) isEmpty).
	self assert: ((full select: [:each | (newFull includes: each) not]) = (Set with: 3)).
	
]

{
	#category : #'some tests',
	#timestamp : ' 8/31/2017 05:26:28'
}
SetTest>>testDo2 [
	| newFull result |
	newFull := Set withAll: (1 to: 5).
	result := 0.
	newFull do: [:each | result := (result + each)].
	self assert: (result = 15).
]

{
	#category : #'test - iterate',
	#timestamp : ' 8/31/2017 05:26:28'
}
SetTest>>testDoWithoutNoDuplicates [
	"self debug: #testDoWithoutNoDuplicates"
	| res |
	res := self speciesClass new.  
	self collection do: [:each | res add: each] without: -2.
	self assert: res size = self doWithoutNumber.
]

{
	#category : #'test - enumerating',
	#timestamp : ' 8/31/2017 05:26:28'
}
SetTest>>testFlatCollect [
	self assert: (#(1 2) asSet flatCollect: [ :x | 1 to: (2 * x) ]) = #(1 2 3 4) asSet.
	self assert: (#() asSet flatCollect: [:x | 1 to: 4 ]) isEmpty
]

{
	#category : #'test - enumerating',
	#timestamp : ' 8/31/2017 05:26:28'
}
SetTest>>testFlatCollectAsSet [
	self assert: (#(1 2) asSet flatCollect: [ :x | 1 to: (2 * x) ]) = #(1 2 3 4) asSet
]

{
	#category : #'sunit original tests',
	#timestamp : ' 8/31/2017 05:26:28'
}
SetTest>>testGrow  [
	empty addAll: (1 to: 100).
	self assert: (empty size = 100).
			
]

{
	#category : #'tests - includes',
	#timestamp : ' 8/31/2017 05:26:28'
}
SetTest>>testIdentityIncludes [
	" test the comportement in presence of elements 'includes' but not 'identityIncludes' "

	" can not be used by collections that can't include elements for wich copy doesn't return another instance "

	| collection element |
	self collectionWithCopyNonIdentical.
	collection := self collectionWithCopyNonIdentical.
	element := collection anyOne copy.	"self assert: (collection includes: element)."
	self deny: (collection identityIncludes: element)
]

{
	#category : #'sunit original tests',
	#timestamp : ' 8/31/2017 05:26:28'
}
SetTest>>testIllegal [
	self should: [empty at: 5] raise: self defaultTestError.
	self should: [empty at: 5 put: #abc] raise: self defaultTestError.
			
]

{
	#category : #'sunit original tests',
	#timestamp : ' 8/31/2017 05:26:28'
}
SetTest>>testIncludes [
	self assert: (full includes: 4).
	self assert: (full includes: 3).
	self deny: (full includes: 6).
			
]

{
	#category : #'tests - includes',
	#timestamp : ' 8/31/2017 05:26:28'
}
SetTest>>testIncludesElementIsNotThere [
	"self debug: #testIncludesElementIsNotThere"
	self deny: (self nonEmpty includes: self elementNotInForOccurrences).
	self assert: (self nonEmpty includes: self nonEmpty anyOne).
	self deny: (self empty includes: self elementNotInForOccurrences)
]

{
	#category : #'some tests',
	#timestamp : ' 8/31/2017 05:26:28'
}
SetTest>>testIntersection  [
	| newFull col |
	full add: 3; add: 2.
	col := full intersection: full.
	self assert: (full = col).

	newFull := Set with: 8 with: 9 with: #z.
	col := newFull intersection: full.
	self assert: (col isEmpty).
	
	newFull add: 5; add: #abc; add: 7.
	col := newFull intersection: full.
	self assert: ((full select: [:each | (newFull includes: each)]) = col).
	
	
	
]

{
	#category : #'test - integrity',
	#timestamp : ' 8/31/2017 05:26:28'
}
SetTest>>testIsHealthy [
	"we use associations as keys on purpose, because they changing
	hash depending on the key"
	| a1 a2 set |

	set := Set new.
	[
		a1 := 3 -> nil.
		a2 := nil -> 3.
		set add: a1; add: a2.
		self assert: set isHealthy.
		a1 key: 0.
		a2 key: 0.
		self assert: set isHealthy not
	
	] ensure: [set removeAll]
]

{
	#category : #'some tests',
	#timestamp : ' 8/31/2017 05:26:28'
}
SetTest>>testLike [
	self assert: ((full like: 3) = 3).
	self assert: ((full like: 8) isNil).
]

{
	#category : #'sunit original tests',
	#timestamp : ' 8/31/2017 05:26:28'
}
SetTest>>testOccurrences [
	self assert: ((empty occurrencesOf: 0) = 0).
	self assert: ((full occurrencesOf: 4) = 1).
	full add: 4.
	self assert: ((full occurrencesOf: 4) = 1).
]

{
	#category : #'sunit original tests',
	#timestamp : ' 8/31/2017 05:26:28'
}
SetTest>>testRemove [
	full remove: 4.
	self assert: (full includes: 3).
	self deny: (full includes: 4).
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
SetTest>>testRemoveAll [
	"Allows one to remove all elements of a collection" 
	
	| c1 c2 s2 |
	c1 := full.
	c2 := c1 copy.
	s2 := c2 size.
	
	c1 removeAll.
	
	self assert: c1 size = 0.
	self assert: c2 size = s2 description: 'the copy has not been modified'.
]

{
	#category : #'some tests',
	#timestamp : ' 8/31/2017 05:26:28'
}
SetTest>>testRemoveIfAbsent [
	"self debug: #testRemoveIfAbsent"
	
	self assert: (full remove: 8 ifAbsent: [true]).
	self assert: (full remove: 4 ifAbsent: [false]) isNumber.
	
	
	
]

{
	#category : #'test - integrity',
	#timestamp : ' 8/31/2017 05:26:28'
}
SetTest>>testSetWithNilItemsIsHealthy [
	self classToBeTested = Set
		ifFalse: [ ^ self	"only works on Dictionary" ].
	self assert: {nil} asSet isHealthy
]

{
	#category : #'some tests',
	#timestamp : ' 8/31/2017 05:26:28'
}
SetTest>>testSize2 [
	self assert: (empty size = 0).
	self assert: (full size = 4).
	empty add: 2.
	empty add: 1.
	full add: 2.
	self assert: (empty size = 2).
	self assert: (full size = 4).
	empty remove: 2.
	self assert: (empty size = 1).
]

{
	#category : #'some tests',
	#timestamp : ' 8/31/2017 05:26:28'
}
SetTest>>testUnion [
	| newFull col newCol |
	full add: 3.
	full add: 2.
	col := full union: full.
	self assert: (full = col).

	newFull := Set with: 8 with: 9 with: #z.
	col := newFull union: full.
	self assert: (col size = (full size + newFull size)).
	self assert: ((col select: [:each | (full includes: each) not]) = newFull).
	self assert: ((col select: [:each | (newFull includes: each) not]) = full).

	full add: 9.
	col := newFull union: full.
	newCol := newFull copy.
	newCol remove: 9.
	self assert: (col size = (full size + newFull size - 1)).
	self assert: ((col select: [:each | (full includes: each) not]) = newCol).
	newCol := full copy.
	newCol remove: 9.
	self assert: ((col select: [:each | (newFull includes: each) not]) = newCol).
	
	
	
]
