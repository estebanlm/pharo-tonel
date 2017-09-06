"
This is the unit test for the class Array. Unit tests are a good way to exercise the functionality of your system in a repeatable and automatic manner. They are therefore recommended if you plan to release anything. For more information, see: 
	- http://www.c2.com/cgi/wiki?UnitTest
	- there is a chapter in the PharoByExample book (http://pharobyexample.org/)	
	- the sunit class category
"
Class {
	#name : #ArrayTest,
	#superclass : #CollectionRootTest,
	#traits : 'TEmptySequenceableTest + TSequencedElementAccessTest + TCloneTest + TIncludesWithIdentityCheckTest + TCopyTest + TCreationWithTest + TPutBasicTest + (TConvertTest - {}) + TOccurrencesForMultiplinessTest + TIterateSequencedReadableTest + TSequencedConcatenationTest + TReplacementSequencedTest + TAsStringCommaAndDelimiterSequenceableTest + TBeginsEndsWith + TPrintOnSequencedTest + TIndexAccess + TSubCollectionAccess + TConvertAsSetForMultiplinessIdentityTest + TCopyPartOfSequenceable + TCopySequenceableSameContents + TCopySequenceableWithOrWithoutSpecificElements + TCopySequenceableWithReplacement + TIndexAccessForMultipliness + TCopyPartOfSequenceableForMultipliness + TConvertAsSortedTest + TPutTest + TSequencedStructuralEqualityTest + TSortTest + TSetArithmetic + TEnumeratingTest',
	#classTraits : 'TEmptySequenceableTest classTrait + TSequencedElementAccessTest classTrait + TCloneTest classTrait + TIncludesWithIdentityCheckTest classTrait + TCopyTest classTrait + TCreationWithTest classTrait + TPutBasicTest classTrait + TConvertTest classTrait + TOccurrencesForMultiplinessTest classTrait + TIterateSequencedReadableTest classTrait + TSequencedConcatenationTest classTrait + TReplacementSequencedTest classTrait + TAsStringCommaAndDelimiterSequenceableTest classTrait + TBeginsEndsWith classTrait + TPrintOnSequencedTest classTrait + TIndexAccess classTrait + TSubCollectionAccess classTrait + TConvertAsSetForMultiplinessIdentityTest classTrait + TCopyPartOfSequenceable classTrait + TCopySequenceableSameContents classTrait + TCopySequenceableWithOrWithoutSpecificElements classTrait + TCopySequenceableWithReplacement classTrait + TIndexAccessForMultipliness classTrait + TCopyPartOfSequenceableForMultipliness classTrait + TConvertAsSortedTest classTrait + TPutTest classTrait + TSequencedStructuralEqualityTest classTrait + TSortTest classTrait + TSetArithmetic classTrait + TEnumeratingTest classTrait',
	#instVars : [
		'example1',
		'literalArray',
		'selfEvaluatingArray',
		'otherArray',
		'nonSEArray1',
		'nonSEarray2',
		'example2',
		'empty',
		'collectResult',
		'withoutEqualElements',
		'withEqualElements',
		'withCharacters',
		'unsortedCollection',
		'sortedInAscendingOrderCollection',
		'sizeCollection',
		'collectionNotIncluded',
		'removedCollection',
		'elementInForCopy',
		'elementNotInForCopy',
		'firstIndex',
		'secondIndex',
		'replacementCollection',
		'indexArray',
		'valueArray',
		'nonEmptyMoreThan1Element',
		'subCollectionNotIn',
		'replacementCollectionSameSize',
		'oldSubCollection',
		'nonEmpty1Element',
		'collectionOfCollection',
		'collectionOfFloatWithEqualElements',
		'floatCollectionWithSameBeginingAnEnd',
		'collectionWithoutNil',
		'duplicateElement',
		'collection5Elements',
		'collectionWith4Elements',
		'collectionOfCollectionsOfStrings',
		'collectionOfCollectionsOfInts',
		'simpleCollection'
	],
	#category : #Collections-Tests-Arrayed,
	#timestamp : '<historical>'
}

{
	#category : #helpers,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>aValue [

	^ 33
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>accessCollection [

	^ example1
]

{
	#category : #helpers,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>anIndex [

	^ 2
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>anotherElementNotIn [
	^ elementNotInForCopy 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>anotherElementOrAssociationIn [
	" return an element (or an association for Dictionary ) present  in 'collection' "
	^ self collection anyOne.
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>anotherElementOrAssociationNotIn [
	" return an element (or an association for Dictionary )not present  in 'collection' "
	^ elementNotInForCopy 
]

{
	#category : #helpers,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>anotherValue [

	^ 66
]

{
	#category : #'tests - converting',
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>assertSameContents: aCollection whenConvertedTo: aClass  [
	| result |
	result := aCollection perform: ('as' , aClass name) asSymbol.
	self assert: (result class includesBehavior: aClass).
	result do: 
		[ :each | 
		self assert: (aCollection occurrencesOf: each) = (result occurrencesOf: each) ].
	self assert: result size = aCollection size
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>collection  [

	^ collectionWith4Elements 
]

{
	#category : #'test - creation',
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>collectionClass  [
	
	^ Array
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>collectionInForIncluding [
	^ self nonEmpty copyWithoutFirst.
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>collectionMoreThan1NoDuplicates [
	" return a collection of size 5 without equal elements"
	^ withoutEqualElements 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>collectionMoreThan5Elements [
" return a collection including at least 5 elements"
	
	^ collection5Elements 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>collectionNotIncluded [
	^ collectionNotIncluded.
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>collectionOfCollectionsOfInts [
	^collectionOfCollectionsOfInts.
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>collectionOfCollectionsOfStrings [
	^ collectionOfCollectionsOfStrings.
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>collectionOfFloat [
	^ collectionOfCollection
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>collectionWith1TimeSubcollection [
	^ (self oldSubCollection copyWithoutFirst),self oldSubCollection,(self oldSubCollection copyWithoutFirst). 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>collectionWith2TimeSubcollection [
	^ (self oldSubCollection copyWithoutFirst),self oldSubCollection,(self oldSubCollection copyWithoutFirst),self oldSubCollection .
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>collectionWithCharacters [
	^ withCharacters.
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>collectionWithCopyNonIdentical [
	" return a collection that include elements for which 'copy' return a different object (this is not the case of SmallInteger)"
	^ collectionOfCollection
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>collectionWithElementsToRemove [
	^ removedCollection
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>collectionWithEqualElements [
	^ withEqualElements.
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>collectionWithNonIdentitySameAtEndAndBegining [
	" return a collection with elements at end and begining equals only with classic equality (they are not the same object).
(others elements of the collection are not equal to those elements)"
	^ floatCollectionWithSameBeginingAnEnd 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>collectionWithSameAtEndAndBegining [
" return a collection with elements at end and begining equals .
(others elements of the collection are not equal to those elements)"
	^ floatCollectionWithSameBeginingAnEnd 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>collectionWithSortableElements [
" return a collection elements that can be sorte ( understanding message ' < '  or ' > ')"
	^ withoutEqualElements 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>collectionWithoutEqualElements [
	^ withoutEqualElements 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>collectionWithoutNilElements [
" return a collection that doesn't includes a nil element  and that doesn't includes equal elements'"
	^ collectionWithoutNil  
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>elementInCollectionOfFloat [
	^ collectionOfCollection atRandom
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>elementInForCopy [
	^ elementInForCopy 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>elementInForElementAccessing [
" return an element inculded in 'accessCollection '"
	^ self accessCollection anyOne
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>elementInForIncludesTest [

	^ elementInForCopy 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>elementInForIndexAccess [
	^ elementInForCopy 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>elementInForIndexAccessing [

	^ withoutEqualElements anyOne
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>elementInForOccurrences [
	^ elementInForCopy 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>elementInForReplacement [
	^ elementInForCopy 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>elementNotIn [
"return an element not included in 'nonEmpty' "

	^ elementNotInForCopy 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>elementNotInForCopy [
	^ elementNotInForCopy 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>elementNotInForElementAccessing [
" return an element not included in 'accessCollection' "
	^ elementNotInForCopy 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>elementNotInForIndexAccessing [

	^elementNotInForCopy 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>elementNotInForOccurrences [
	^ elementNotInForCopy 
]

{
	#category : #'test - copy',
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>elementToAdd [
	^ 55
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>elementTwiceInForOccurrences [
" return an element included exactly two time in # collectionWithEqualElements"
^ duplicateElement 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>elementsCopyNonIdenticalWithoutEqualElements [
	" return a collection that does niot include equal elements ( classic equality )"
	^ collectionOfCollection
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>empty [

	^ empty
]

{
	#category : #'test - iterate',
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>expectedSizeAfterReject [
	^1
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>firstCollection [
	^example1 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>firstEven [
	"Returns the first even number of #collection"
	^ -2
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>firstIndex [
	^ firstIndex 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>firstOdd [
	"Returns the first odd number of #collection"
	^ 1
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>floatCollectionWithSameAtEndAndBegining [
" return a collection with elements at end and begining equals only with classic equality (they are not the same object).
(others elements of the collection are not equal to those elements)"
	^ floatCollectionWithSameBeginingAnEnd 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>indexArray [
	^ indexArray .
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>indexInForCollectionWithoutDuplicates [
	^ 2.
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>indexInNonEmpty [
	^ 2 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>integerCollection [
	^example1 .
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>integerCollectionWithoutEqualElements [
	^{1. 2. 6. 5.}
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>moreThan3Elements [
	" return a collection including atLeast 3 elements"
	^ example1 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>moreThan4Elements [

" return a collection including at leat 4 elements"
	^ example1 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>newElement [
	^999
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>nonEmpty [

	^ example1
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>nonEmpty1Element [

	^ nonEmpty1Element  
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>nonEmptyMoreThan1Element [
	^nonEmptyMoreThan1Element .
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>oldSubCollection [
	^oldSubCollection 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>replacementCollection [
	^replacementCollection .
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>replacementCollectionSameSize [
	^replacementCollectionSameSize 
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>result [
	
	^ collectResult
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>secondCollection [
	^example2 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>secondIndex [
	^ secondIndex 
]

{
	#category : #parameters,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>selectorToAccessValuePutIn [
	"return the selector of the method that should be invoked to access an element"
	
	^ #second
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>setUp [

	
	literalArray := #(1 true 3 #four).
	selfEvaluatingArray := { 1. true. (3/4). String loremIpsum. (2 to: 4) . 5 }.
	nonSEArray1 := { 1 . Set with: 1 }.
	nonSEarray2 := { Smalltalk globals associationAt: #Array }.
	example1 := #(1 2 3 4 5) copy.
	indexArray:= {2. 3. 4.}.
	valueArray:={0. 0. 0.}.
	oldSubCollection:= {2. 3. 4.}.
	nonEmptyMoreThan1Element:= example1.
	subCollectionNotIn:= {1. 8. 3.}.
	collectionNotIncluded:= {7. 8. 9.}.
	removedCollection:=  { 2. 4. }.
	
	example2 := {1. 2. 3/4. 4. 5}.
	collectionWith4Elements := #(1 -2 3 1). 
	collectionWithoutNil := #( 1 2 3 4).
	simpleCollection := #( 1 8 3).
	collectionOfCollectionsOfInts := { 1. { 2. 3 }. { 4. { 5. 6} } }.
	collectionOfCollectionsOfStrings:= {{{'foo'}. {'bar'}}. 'zorg'}.
	collectResult := {SmallInteger. SmallInteger. SmallInteger. SmallInteger.}.
	empty := #().
	duplicateElement := 5.2.
	withEqualElements := {1.5. duplicateElement . 6.1. 2.0. duplicateElement .} .
	withoutEqualElements := {1.1. 4.4. 6.5. 2.4. 3.1.}.
	withCharacters := {$a. $x. $d. $c. $m.}.
	unsortedCollection := {1. 2.  8. 5. 6. 7.}.
	sortedInAscendingOrderCollection := {1. 2. 3. 4. 5. 6.}.
	elementInForCopy:= 2.
	elementNotInForCopy:= 9.
	firstIndex:= 2.
	secondIndex:= 4.
	replacementCollection:= {4. 3. 2. 1.}.
	replacementCollectionSameSize := {5. 4. 3.}.	
	nonEmpty1Element:={ 5.}.
	collectionOfCollection:={1.5. 5.5. 6.5.}.
	collectionOfFloatWithEqualElements:={1.5. 5.5. 6.5. 1.5}.
	floatCollectionWithSameBeginingAnEnd := {1.5. 5.5. 1.5 copy}.
	collection5Elements := { 1. 2. 5. 3. 4.}.
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>simpleCollection [
	^simpleCollection.
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>sizeCollection [

	^ self collection
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>smallerIndex [
	^ firstIndex -1
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>sortedInAscendingOrderCollection [
	^sortedInAscendingOrderCollection .
	
]

{
	#category : #'test - iterate',
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>speciesClass [
	
	^ Array
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>subCollectionNotIn [

	^subCollectionNotIn 
]

{
	#category : #'tests - fixture',
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>test0CopyTest [
	self empty.
	self assert: self empty size = 0.
	self nonEmpty.
	self assert: (self nonEmpty size = 0) not.
	self collectionWithElementsToRemove.
	self assert: (self collectionWithElementsToRemove size = 0) not.
	self elementToAdd
]

{
	#category : #'tests - fixture',
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>test0FixtureIncludeTest [
	| anElementIn |
	self nonEmpty.
	self deny: self nonEmpty isEmpty.
	self elementNotIn.
	anElementIn := true.
	self nonEmpty detect: [ :each | each = self elementNotIn ] ifNone: [ anElementIn := false ].
	self assert: anElementIn = false.
	self anotherElementNotIn.
	anElementIn := true.
	self nonEmpty detect: [ :each | each = self anotherElementNotIn ] ifNone: [ anElementIn := false ].
	self assert: anElementIn = false.
	self collection.
	self empty.
	self assert: self empty isEmpty.
	self collectionOfFloat.
	self collectionOfFloat do: [ :each | self assert: each isFloat ].
	self elementInForIncludesTest.
	anElementIn := true.
	self nonEmpty detect: [ :each | each = self elementInForIncludesTest ] ifNone: [ anElementIn := false ].
	self assert: anElementIn = true
]

{
	#category : #'tests - fixture',
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>test0FixtureOccurrencesTest [
	self empty.
	self assert: self empty isEmpty.
	self nonEmpty.
	self deny: self nonEmpty isEmpty.
	self elementInForOccurrences.
	self assert: (self nonEmpty includes: self elementInForOccurrences).
	self elementNotInForOccurrences.
	self deny: (self nonEmpty includes: self elementNotInForOccurrences)
]

{
	#category : #'tests - fixture',
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>test0FixtureTConvertAsSetForMultiplinessTest [
	"a collection ofFloat with equal elements:"

	| res |
	self withEqualElements.
	self withEqualElements do: [ :each | self assert: each isFloat ].
	res := true.
	self withEqualElements detect: [ :each | (self withEqualElements occurrencesOf: each) > 1 ] ifNone: [ res := false ].
	self assert: res = true.	"a collection of Float without equal elements:"
	self elementsCopyNonIdenticalWithoutEqualElements.
	self elementsCopyNonIdenticalWithoutEqualElements do: [ :each | self assert: each isFloat ].
	res := true.
	self elementsCopyNonIdenticalWithoutEqualElements
		detect: [ :each | (self elementsCopyNonIdenticalWithoutEqualElements occurrencesOf: each) > 1 ]
		ifNone: [ res := false ].
	self assert: res = false
]

{
	#category : #'test - iterate',
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>testAnySatisfy [

	self assert: ( self collection anySatisfy: [:each | each = -2]).
	self deny: (self collection anySatisfy: [:each | each isString]).
]

{
	#category : #'tests - converting',
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>testAsArrayKeepsIdentity [
	 
	|x y|
	x := #(1 2 3 4 5).
	y := x asArray.
	self assert: y identityHash = x identityHash
]

{
	#category : #'tests - accessing',
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>testAtWrap2 [
	| tabTest |
	tabTest := #(5 6 8 ).
	self assert: (tabTest atWrap: 2) = 6.
	self assert: (tabTest atWrap: 7) = 5.
	self assert: (tabTest atWrap: 5) = 6.
	self assert: (tabTest atWrap: 0) = 8.
	self assert: (tabTest atWrap: 1) = 5.
	self assert: (tabTest atWrap: -2) = 5
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>testCombinations [

	self assert: #(1 2 3) combinations = #(#(1) #(2) #(3) #(1 2) #(1 3) #(2 3) #(1 2 3)).
	self assert: (1 to: 3) combinations = #(#(1) #(2) #(3) #(1 2) #(1 3) #(2 3) #(1 2 3)).
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>testComplexIsSelfEvaluating [
	"self run: #testComplexIsSelfEvaluating"

	| complexArray restoredArray |
	complexArray := {1.
	true.
	false.
	nil.
	#a.
	'a'.
	$a.
	(Float pi).
	(Float halfPi).
	(4 / 5).
	(Float infinity negated).
	(1 @ 2).
	(0 @ 0 extent: 1 @ 1).
	('hola' -> 0).
	Object.
	(Object class)}.
	complexArray := complexArray copyWith: complexArray.
	self assert: complexArray isSelfEvaluating.
	restoredArray := self class evaluate: complexArray printString.
	self assert: restoredArray = complexArray
]

{
	#category : #'tests - copy',
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>testCopyNonEmptyWithoutAllNotIncluded [
	
]

{
	#category : #'test - iterate',
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>testDo [

	| res |
	res := OrderedCollection new.  
	self collection do: [:each | res add: each class].
	self assert: res asArray = self result.
]

{
	#category : #'test - iterate',
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>testDo2 [

	| res |
	res := OrderedCollection new.  
	self collection do: [:each | res add: each class].
	self assert: res asArray = self result. 
]

{
	#category : #'tests - find binary',
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>testFindBinary [
	self assert: (#(1 3 5 7 11 15 23) findBinary: [ :arg | 1 - arg ]) = 1.
	self assert: (#(1 3 5 7 11 15 23) findBinary: [ :arg | 23 - arg ]) = 23.
	self assert: (#(1 3 5 7 11 15 23) findBinary: [ :arg | 11 - arg ]) = 11.
	self should: [ #(1 3 5 7 11 15 23) findBinary: [ :arg | 8 - arg ] ] raise: NotFound
]

{
	#category : #'tests - find binary',
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>testFindBinaryIfNone [
	self assert: (#(1 3 5 7 11 15 23) findBinary: [ :arg | 11 - arg ] ifNone: [ #none ]) = 11.
	self should: (#(1 3 5 7 11 15 23) findBinary: [ :arg | 8 - arg ] ifNone: [ #none ]) = #none
]

{
	#category : #'tests - includes',
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>testIdentityIncludes [
	" test the comportement in presence of elements 'includes' but not 'identityIncludes' "

	" can not be used by collections that can't include elements for wich copy doesn't return another instance "

	| collection element |
	self collectionWithCopyNonIdentical.
	collection := self collectionWithCopyNonIdentical.
	element := collection anyOne copy.	"self assert: (collection includes: element)."
	self deny: (collection identityIncludes: element)
]

{
	#category : #'tests - index access',
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>testIdentityIndexOf [
	"self debug: #testIdentityIndexOf"
	| collection element |
	element := self elementInCollectionOfFloat copy.
	self deny: self elementInCollectionOfFloat == element.
	collection := self collectionOfFloat copyWith: element.
	self assert: (collection identityIndexOf: element) = collection size
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>testIsArray [
	
	self assert: example1 isArray
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>testIsLiteral [
	"We work with a copy of literalArray, to avoid corrupting the code."
	
	| aLiteralArray |
	aLiteralArray := literalArray copy.
	self assert: aLiteralArray isLiteral.
	aLiteralArray at: 1 put: self class.
	self deny: aLiteralArray isLiteral.
	self deny: (literalArray as: WeakArray) isLiteral description: 'instances of Array subclasses are not literal'.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>testIsSelfEvaluating [

	self assert: example1 isSelfEvaluating.
	example1 at: 1 put: Bag new.
	self deny: example1 isSelfEvaluating.
	example1 at: 1 put: 1.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>testLiteralEqual [

	self deny: (example1 literalEqual: example1 asIntegerArray)
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>testNewWithSize [
	|array|
	array := Array new: 5.
	self assert: array size = 5.
	1 to: 5 do: [:index | self assert: (array at: index) isNil]
]

{
	#category : #'tests - occurrencesOf',
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>testOccurrencesOf [
	| result expected |
	result := self nonEmpty occurrencesOf: self elementInForOccurrences.
	expected := 0.
	self nonEmpty do: [ :each | self elementInForOccurrences = each ifTrue: [ expected := expected + 1 ] ].
	self assert: result = expected
]

{
	#category : #'tests - occurrencesOf',
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>testOccurrencesOfEmpty [
	| result |
	result := self empty occurrencesOf: self elementInForOccurrences.
	self assert: result = 0
]

{
	#category : #'tests - occurrencesOf',
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>testOccurrencesOfNotIn [
	| result |
	result := self empty occurrencesOf: self elementNotInForOccurrences.
	self assert: result = 0
]

{
	#category : #'tests - arithmetic',
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>testPremultiply [
	self assert: example1 +* #(2 ) = #(2 4 6 8 10 ) 
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>testPrinting [
	"self debug: #testPrinting"
	
	self assert: literalArray printString = '#(1 true 3 #four)'.
	self assert: (literalArray = (self class compiler evaluate: literalArray printString)).
	self assert: (selfEvaluatingArray = (self class compiler evaluate: selfEvaluatingArray printString)).
	self assert: nonSEArray1 printString =  'an Array(1 a Set(1))'.
	self assert: nonSEarray2 printString = '{#Array->Array}'

]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>unsortedCollection [
	^unsortedCollection .
]

{
	#category : #parameters,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>valuePutIn [
	"the value that we will put in the non empty collection"
	
	^ 2
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
ArrayTest>>withEqualElements [
	" return a collection of float including equal elements (classic equality)"
	^ collectionOfFloatWithEqualElements
]
