"
SUnit tests for bags
"
Class {
	#name : #BagTest,
	#superclass : #CollectionRootTest,
	#traits : 'TAddTest + TIncludesWithIdentityCheckTest + TCloneTest + TCopyTest + TSetArithmetic + TConvertTest + TAsStringCommaAndDelimiterTest + TRemoveForMultiplenessTest + TPrintTest + TConvertAsSortedTest + TConvertAsSetForMultiplinessTest + TConcatenationTest + TStructuralEqualityTest + (TCreationWithTest - {#testOfSize}) + TOccurrencesForMultiplinessTest',
	#classTraits : 'TAddTest classTrait + TIncludesWithIdentityCheckTest classTrait + TCloneTest classTrait + TCopyTest classTrait + TSetArithmetic classTrait + TConvertTest classTrait + TAsStringCommaAndDelimiterTest classTrait + TRemoveForMultiplenessTest classTrait + TPrintTest classTrait + TConvertAsSortedTest classTrait + TConvertAsSetForMultiplinessTest classTrait + TConcatenationTest classTrait + TStructuralEqualityTest classTrait + TCreationWithTest classTrait + TOccurrencesForMultiplinessTest classTrait',
	#instVars : [
		'empty',
		'nonEmpty',
		'collectResult',
		'emptyButAllocatedWith20',
		'elementExistsTwice',
		'element',
		'collectionWithElement',
		'collectionIn',
		'collectionNotIn',
		'collectionOfString',
		'elementNotIn',
		'collectionWithCharacters',
		'otherCollectionWithoutEqualElements',
		'collectionWithoutNilMoreThan5'
	],
	#category : #Collections-Tests-Unordered,
	#timestamp : 'TorstenBergmann 2/20/2014 15:20'
}

{
	#category : #'tests - includes',
	#timestamp : ' 8/31/2017 05:26:28'
}
BagTest>>anotherElementNotIn [
	^ 42
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
BagTest>>anotherElementOrAssociationIn [
	" return an element (or an association for Dictionary ) present  in 'collection' "
	^ self collection anyOne
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
BagTest>>anotherElementOrAssociationNotIn [
	" return an element (or an association for Dictionary )not present  in 'collection' "
	^ elementNotIn 
]

{
	#category : #setup,
	#timestamp : ' 8/31/2017 05:26:28'
}
BagTest>>collection [

	^ nonEmpty.
	
]

{
	#category : #'test - set arithmetic',
	#timestamp : ' 8/31/2017 05:26:28'
}
BagTest>>collectionClass [

	^ Bag
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
BagTest>>collectionInForIncluding [
	 ^ collectionIn 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
BagTest>>collectionMoreThan5Elements [
" return a collection including at least 5 elements"
	
	^ collectionWithoutNilMoreThan5 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
BagTest>>collectionNotIncluded [
	^ collectionNotIn 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
BagTest>>collectionOfFloat [
	^ collectionOfString
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
BagTest>>collectionWithCharacters [
	^ collectionWithCharacters .
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
BagTest>>collectionWithCopyNonIdentical [
	" return a collection that include elements for which 'copy' return a different object (this is not the case of SmallInteger)"
	^ collectionOfString
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
BagTest>>collectionWithElement [
	"Returns a collection that already includes what is returned by #element."
	^ collectionWithElement
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
BagTest>>collectionWithElementsToRemove [
	^ collectionIn
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
BagTest>>collectionWithEqualElements [
	^ nonEmpty 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
BagTest>>collectionWithSortableElements [
" return a collection elements that can be sorte ( understanding message ' < '  or ' > ')"
	^ nonEmpty 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
BagTest>>collectionWithoutEqualElements [
	^ otherCollectionWithoutEqualElements
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
BagTest>>collectionWithoutNilElements [
	" return a collection that doesn't includes a nil element  and that doesn't includes equal elements'"
	^ collectionWithoutNilMoreThan5
]

{
	#category : #'test - iterate',
	#timestamp : ' 8/31/2017 05:26:28'
}
BagTest>>doWithoutNumber [

	^ 4
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
BagTest>>element [
	^ super element
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
BagTest>>elementInForIncludesTest [

	^ self element 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
BagTest>>elementInForOccurrences [
" return an element included in nonEmpty"
	^self nonEmpty anyOne.
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
BagTest>>elementNotIn [

	^elementNotIn 
]

{
	#category : #'tests - includes',
	#timestamp : ' 8/31/2017 05:26:28'
}
BagTest>>elementNotInForOccurrences [
	^ 666
]

{
	#category : #'test - copy',
	#timestamp : ' 8/31/2017 05:26:28'
}
BagTest>>elementToAdd [
	^ 42
]

{
	#category : #'test - remove',
	#timestamp : ' 8/31/2017 05:26:28'
}
BagTest>>elementTwiceIn [
	^ super elementTwiceIn
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
BagTest>>elementTwiceInForOccurrences [
" return an element included exactly two time in # collectionWithEqualElements"
^ self elementTwiceIn 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
BagTest>>elementsCopyNonIdenticalWithoutEqualElements [
	" return a collection that does niot incllude equal elements ( classic equality )
	all elements included are elements for which copy is not identical to the element  "
	^ collectionOfString 
]

{
	#category : #setup,
	#timestamp : ' 8/31/2017 05:26:28'
}
BagTest>>empty [

	^ empty
	
	
]

{
	#category : #setup,
	#timestamp : ' 8/31/2017 05:26:28'
}
BagTest>>emptyButAllocatedWith20  [
	
		^ emptyButAllocatedWith20
]

{
	#category : #'test - iterate',
	#timestamp : ' 8/31/2017 05:26:28'
}
BagTest>>expectedSizeAfterReject [
	^ 2
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
BagTest>>firstCollection [
" return a collection that will be the first part of the concatenation"
	^ nonEmpty 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
BagTest>>integerCollectionWithoutEqualElements [
	^ otherCollectionWithoutEqualElements
]

{
	#category : #setup,
	#timestamp : ' 8/31/2017 05:26:28'
}
BagTest>>nonEmpty [

	^ nonEmpty
	
	
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
BagTest>>nonEmpty1Element [

	^ self speciesClass  new add: self element ;yourself.
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
BagTest>>nonEmptyWithoutEqualElements [
" return a collection without equal elements "
	^ otherCollectionWithoutEqualElements 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
BagTest>>otherCollection [
	^ otherCollectionWithoutEqualElements
]

{
	#category : #setup,
	#timestamp : ' 8/31/2017 05:26:28'
}
BagTest>>result [

	^ collectResult.
	
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
BagTest>>secondCollection [
" return a collection that will be the second part of the concatenation"
	^ collectionWithCharacters 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
BagTest>>selectedNumber [
	^ 4
]

{
	#category : #setup,
	#timestamp : ' 8/31/2017 05:26:28'
}
BagTest>>setUp [
	empty := self speciesClass new.
	nonEmpty := self speciesClass new
		add: 13;
		add: -2;
		add: self elementTwiceIn;
		add: 10;
		add: self elementTwiceIn;
		add: self element;
		yourself.
	elementNotIn := 0.
	collectionIn := self speciesClass new
		add: -2;
		add: self elementTwiceIn;
		add: 10;
		yourself.
	collectionNotIn := self speciesClass new
		add: self elementNotIn;
		add: 5;
		yourself.
	collectionOfString := self speciesClass new
		add: 1.5;
		add: 5.5;
		add: 7.5;
		yourself.
	otherCollectionWithoutEqualElements := self speciesClass new
		add: 1;
		add: 20;
		add: 30;
		add: 40;
		yourself.
	collectionWithoutNilMoreThan5 := self speciesClass new
		add: 1;
		add: 2;
		add: 3;
		add: 4;
		add: 5;
		add: 6;
		yourself.
	collectResult := self speciesClass new
		add: SmallInteger;
		add: SmallInteger;
		add: SmallInteger;
		add: SmallInteger;
		add: SmallInteger;
		add: SmallInteger;
		yourself.
	emptyButAllocatedWith20 := self speciesClass new: 20.
	collectionWithElement := self speciesClass new
		add: self element;
		yourself.
	collectionWithCharacters := self speciesClass new
		add: $p;
		add: $v;
		add: $i;
		add: $y;
		yourself
]

{
	#category : #setup,
	#timestamp : ' 8/31/2017 05:26:28'
}
BagTest>>sizeCollection [
	^ otherCollectionWithoutEqualElements
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
BagTest>>speciesClass [
	
	^ Bag
]

{
	#category : #'tests - fixture',
	#timestamp : ' 8/31/2017 05:26:28'
}
BagTest>>test0CopyTest [
	self empty.
	self assert: self empty size = 0.
	self nonEmpty.
	self assert: (self nonEmpty size = 0) not.
	self collectionWithElementsToRemove.
	self assert: (self collectionWithElementsToRemove size = 0) not.
	self elementToAdd
]

{
	#category : #'basic tests',
	#timestamp : ' 8/31/2017 05:26:28'
}
BagTest>>testAdd [
	"self run: #testAdd"
	"self debug: #testAdd"

	| aBag |
	aBag := Bag new.
	aBag add: 'a'.
	aBag add: 'b'.
	
	self assert: aBag size = 2.
	aBag add: 'a'.
	self assert: aBag size = 3.
	self assert: (aBag occurrencesOf: 'a') = 2
	

]

{
	#category : #'basic tests',
	#timestamp : ' 8/31/2017 05:26:28'
}
BagTest>>testAddWithOccurrences [
	"self debug:#testAddWithOccurrences"
	
	| aBag |
 	aBag := Bag new.	
	aBag add: 'a' withOccurrences: 3.
	self assert: (aBag size = 3).
	
	
	
	
		

]

{
	#category : #'tests - iterating',
	#timestamp : ' 8/31/2017 05:26:28'
}
BagTest>>testAnySastify [

	self assert: ( self collection anySatisfy: [:each | each = self element]).
	self deny: (self collection anySatisfy: [:each | each isString]).
]

{
	#category : #'basic tests',
	#timestamp : ' 8/31/2017 05:26:28'
}
BagTest>>testAsBag [

	| aBag |
 
	aBag := Bag new.	
	
	self assert: aBag asBag = aBag.
]

{
	#category : #'basic tests',
	#timestamp : ' 8/31/2017 05:26:28'
}
BagTest>>testAsSet [

	| aBag aSet |
	aBag := Bag new.	
	aBag add:'a' withOccurrences: 4.
	aBag add:'b' withOccurrences: 2.
	aSet := aBag asSet.
	self assert: aSet size = 2.
	self assert: (aSet occurrencesOf: 'a') = 1 
	
]

{
	#category : #'basic tests',
	#timestamp : ' 8/31/2017 05:26:28'
}
BagTest>>testCopy [
	"self run: #testCopy"
	
	| aBag newBag |
	aBag := Bag new.
	aBag add:'a' withOccurrences: 4.
	aBag add:'b' withOccurrences: 2.
	newBag := aBag copy.
	self assert: newBag = newBag.
	self assert: newBag asSet size = 2.
]

{
	#category : #'tests - copy',
	#timestamp : ' 8/31/2017 05:26:28'
}
BagTest>>testCopyNonEmptyWithoutAllNotIncluded [
	
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
BagTest>>testCreation [
	"self run: #testCreation" 
	"self debug: #testCreation"
		
	| bag |
	bag := Bag new.
	self assert: (bag size) = 0.
	self assert: (bag isEmpty).
	

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
BagTest>>testCumulativeCounts [
	"self run: #testCumulativeCounts" 
	"self debug: #testCumulativeCounts"
		
	| bag cumulativeCounts |
	bag := Bag new.
	bag add: '1' withOccurrences: 50.
	bag add: '2' withOccurrences: 40.
	bag add: '3' withOccurrences: 10.
	
	cumulativeCounts := bag cumulativeCounts.
	
	self assert: cumulativeCounts size = 3.
	self assert: cumulativeCounts first = (50 -> '1').
	self assert: cumulativeCounts second = (90 -> '2').
	self assert: cumulativeCounts third = (100 -> '3').

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
BagTest>>testEqual [
	"(self run: #testEqual)"
	"(self debug: #testEqual)"
	| bag1 bag2 |
	bag1 := Bag new.
	bag2 := Bag new.
	self assert: bag1 = bag2.
	bag1 add: #a;
		 add: #b.
	bag2 add: #a;
		 add: #a.
	self deny: bag1 = bag2.
	self assert: bag1 = bag1.
	bag1 add: #a.
	bag2 add: #b.
	self assert: bag1 = bag2.
	bag1 add: #c.
	self deny: bag1 = bag2.
	bag2 add: #c.
	self assert: bag1 = bag2
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
BagTest>>testFlatCollect [
	| bag |
	bag := Bag new.
	bag add: { 1. 2. 3 }.
	bag add: { 4. 5. 6 }.

	self assert: (bag flatCollect: [ :x | x ]) equals: #(1 2 3 4 5 6) asBag.
	self assert: (bag flatCollect: [ :x | x ]) class == Bag.
	self assert: (#() asBag flatCollect: [:x | 1 to: 4 ]) isEmpty
]

{
	#category : #'tests - includes',
	#timestamp : ' 8/31/2017 05:26:28'
}
BagTest>>testIdentityIncludes [
	" test the comportement in presence of elements 'includes' but not 'identityIncludes' "

	" can not be used by collections that can't include elements for wich copy doesn't return another instance "

	| collection anElement |
	self collectionWithCopyNonIdentical.
	collection := self collectionWithCopyNonIdentical.
	anElement := collection anyOne copy.	"self assert: (collection includes: element)."
	self deny: (collection identityIncludes: anElement)
]

{
	#category : #'tests - includes',
	#timestamp : ' 8/31/2017 05:26:28'
}
BagTest>>testIncludesElementIsNotThere [
	"self debug: #testIncludesElementIsNotThere"
	self deny: (self nonEmpty includes: self elementNotInForOccurrences).
	self assert: (self nonEmpty includes: self nonEmpty anyOne).
	self deny: (self empty includes: self elementNotInForOccurrences)
]

{
	#category : #'basic tests',
	#timestamp : ' 8/31/2017 05:26:28'
}
BagTest>>testOccurrencesOf [
	"self debug: #testOccurrencesOf"

	| aBag |
 	aBag := Bag new.	
	aBag add: 'a' withOccurrences: 3.
	aBag add: 'b'.
	aBag add: 'b'.
	aBag add: 'b'.
	aBag add: 'b'.	
	self assert: (aBag occurrencesOf:'a') = 3.
	self assert: (aBag occurrencesOf:'b') = 4.
	self assert: (aBag occurrencesOf:'c') = 0.
	self assert: (aBag occurrencesOf: nil) =0.
	aBag add: nil.
	self assert: (aBag occurrencesOf: nil) =1.
	
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
BagTest>>testRemove [
	"self run: #testRemove"
	"self debug: #testRemove" 
	
	| bag item |
	item := 'test item'.
	bag := Bag new. 
	
	bag add: item.
	self assert: (bag size) = 1.
	bag remove: item.
	self assert: bag isEmpty.
	
	bag add: item withOccurrences: 2.
	bag remove: item.
	bag remove: item.
	self assert: (bag size) = 0.
	
	self should: [bag remove: item.] raise: Error.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
BagTest>>testRemoveAll [
	"Allows one to remove all elements of a collection" 
	
	| c1 c2 s2 |
	c1 := #(10 9 8 7 5 4 4 2) asBag.
	c2 := c1 copy.
	s2 := c2 size.
	
	c1 removeAll.
	
	self assert: c1 size = 0.
	self assert: c2 size = s2 description: 'the copy has not been modified'.
]

{
	#category : #'test - remove',
	#timestamp : ' 8/31/2017 05:26:28'
}
BagTest>>testRemoveElementThatExistsTwice [
	"self debug: #testRemoveElementThatDoesExistsTwice"
	| size |
	size := self nonEmpty size.
	self assert: (self nonEmpty includes: self elementTwiceIn).
	self nonEmpty remove: self elementTwiceIn.
	self assert: size - 1 = self nonEmpty size
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
BagTest>>testSortedCounts [
	"self run: #testSortedCounts"
	"self debug: #testSortedCounts" 
	
	| bag sortedCounts|
	bag := Bag new.
	bag add: '1' withOccurrences: 10.
	bag add: '2' withOccurrences: 1.
	bag add: '3' withOccurrences: 5.
	
	sortedCounts := bag sortedCounts.
	self assert: sortedCounts size = 3.
	
	self assert: sortedCounts first = (10->'1').
	self assert: sortedCounts second =  (5->'3').
	self assert: sortedCounts third =  (1->'2').	
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:28'
}
BagTest>>testSortedElements [
	"self run: #testSortedElements" 
	"self debug: #testSortedElements"
	
	| bag sortedElements|
	bag := Bag new.
	bag add: '2' withOccurrences: 1.
	bag add: '1' withOccurrences: 10.
	bag add: '3' withOccurrences: 5.
	
	sortedElements := bag sortedElements.
	
	self assert: sortedElements size = 3.
	
	self assert: sortedElements first = ('1'->10).
	self assert: sortedElements second =  ('2'->1).
	self assert: sortedElements third =  ('3'->5).
	
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
BagTest>>withEqualElements [
	" return a collection  including equal elements (classic equality)"
	^ nonEmpty .
]
