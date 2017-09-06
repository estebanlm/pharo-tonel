"
SUnit tests for heap collections
"
Class {
	#name : #HeapTest,
	#superclass : #CollectionRootTest,
	#traits : 'TAddTest + TGrowableTest + TConvertTest + TConvertAsSortedTest + TConvertAsSetForMultiplinessIdentityTest + TCopyTest + TSetArithmetic + TRemoveForMultiplenessTest + TOccurrencesForMultiplinessTest + (TCreationWithTest - {#testOfSize}) + TIncludesWithIdentityCheckTest',
	#classTraits : 'TAddTest classTrait + TGrowableTest classTrait + TConvertTest classTrait + TConvertAsSortedTest classTrait + TConvertAsSetForMultiplinessIdentityTest classTrait + TCopyTest classTrait + TSetArithmetic classTrait + TRemoveForMultiplenessTest classTrait + TOccurrencesForMultiplinessTest classTrait + TCreationWithTest classTrait + TIncludesWithIdentityCheckTest classTrait',
	#instVars : [
		'collectionWithElement',
		'otherCollection',
		'nonEmpty',
		'empty',
		'elementNotIn',
		'collectResult',
		'expectedElementByDetect',
		'speciesClass',
		'elementTwiceIn',
		'doWithoutNumber',
		'element',
		'expectedSizeAfterReject',
		'collectionNotIncluded',
		'nonEmpty5ElementsWithoutDuplicate',
		'sameAtEndAndBegining',
		'nonEmpty1Element',
		'floatCollection',
		'indexArray',
		'subCollection',
		'duplicateElement',
		'collectionWithDuplicateElement',
		'collectionWith4Elements'
	],
	#category : #Collections-Tests-Sequenceable,
	#timestamp : 'TorstenBergmann 2/20/2014 15:28'
}

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>aValue [
" return a value to put into nonEmpty"
	^ self nonEmpty anyOne 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>accessCollection [
	^ nonEmpty5ElementsWithoutDuplicate
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>anotherElementNotIn [
" return an element different of 'elementNotIn'  not included in 'nonEmpty' "
	^ 9999
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>anotherElementOrAssociationIn [
	" return an element (or an association for Dictionary ) present  in 'collection' "
	^ self collection anyOne
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>anotherElementOrAssociationNotIn [
	" return an element (or an association for Dictionary )not present  in 'collection' "
	^ elementNotIn 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>collection [
	^ collectionWith4Elements.
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>collectionClass [
" return the class to be used to create instances of the class tested"
	^ Heap
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>collectionMoreThan1NoDuplicates [
	" return a collection of size > 1 without equal elements"
	^ nonEmpty5ElementsWithoutDuplicate 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>collectionMoreThan5Elements [
" return a collection including at least 5 elements"
	
	^nonEmpty5ElementsWithoutDuplicate 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>collectionNotIncluded [
" return a collection for wich each element is not included in 'nonEmpty' "
	^ collectionNotIncluded 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>collectionOfSize5 [
" return a collection of size 5"
^ nonEmpty5ElementsWithoutDuplicate 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>collectionWith5Elements [
" return a collection of size 5 including 5 elements"
^ nonEmpty5ElementsWithoutDuplicate 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>collectionWithCopyNonIdentical [
	" return a collection that include elements for which 'copy' return a different object (this is not the case of SmallInteger)"
	^ floatCollection 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>collectionWithElement [
	^ collectionWithElement
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>collectionWithElementsToRemove [
" return a collection of elements included in 'nonEmpty'  "
	^ self nonEmpty 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>collectionWithEqualElements [
" return a collecition including atLeast two elements equal"

^ collectionWithDuplicateElement 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>collectionWithNonIdentitySameAtEndAndBegining [
	" return a collection with elements at end and begining equals only with classic equality (they are not the same object).
(others elements of the collection are not equal to those elements)"
	^ sameAtEndAndBegining 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>collectionWithSameAtEndAndBegining [
	" return a collection with elements at end and begining equals .
(others elements of the collection are not equal to those elements)"
	^ sameAtEndAndBegining 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>collectionWithSortableElements [
" return a collection elements that can be sorte ( understanding message ' < '  or ' > ')"
	^ nonEmpty5ElementsWithoutDuplicate 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>collectionWithoutEqualElements [

" return a collection not including equal elements "
	^ nonEmpty5ElementsWithoutDuplicate 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>collectionWithoutNilElements [
" return a collection that doesn't includes a nil element  and that doesn't includes equal elements'"
	^ nonEmpty5ElementsWithoutDuplicate 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>element [
	^ element
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>elementInForElementAccessing [
" return an element inculded in 'moreThan4Elements'"
	^ self moreThan4Elements anyOne.
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>elementInForIndexAccessing [
" return an element included in 'collectionMoreThan1NoDuplicates' "
	^ self collectionMoreThan1NoDuplicates anyOne.
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>elementInForOccurrences [
	^self nonEmpty anyOne
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>elementNotIn [
	^ elementNotIn 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>elementNotInForElementAccessing [
" return an element not included in 'moreThan4Elements' "
	^ elementNotIn 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>elementNotInForIndexAccessing [
" return an element not included in 'collectionMoreThan1NoDuplicates' "
	^ elementNotIn 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>elementNotInForOccurrences [
	^ elementNotIn
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>elementToAdd [
" return an element of type 'nonEmpy' elements'type'"
	^ elementNotIn 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>elementTwiceIn [
	^elementTwiceIn
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>elementTwiceInForOccurrences [
" return an element included exactly two time in # collectionWithEqualElements"
^ duplicateElement 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>elementsCopyNonIdenticalWithoutEqualElements [
	" return a collection that does niot incllude equal elements ( classic equality )
	all elements included are elements for which copy is not identical to the element  "
	^ floatCollection 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>empty [
	^empty.
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>expectedElementByDetect [
	"Returns the first even element of #collection"
	^ expectedElementByDetect.
	
	
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>expectedSizeAfterReject [
	"Number of even elements in #collection"
	^ expectedSizeAfterReject.
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>firstCollection [
" return a collection that will be the first part of the concatenation"
	^nonEmpty 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>firstIndex [
" return an index between 'nonEmpty' bounds that is < to 'second index' "
	^2
]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>heapExample	"HeapTest new heapExample" [
	"Create a sorted collection of numbers, remove the elements
	sequentially and add new objects randomly.
	Note: This is the kind of benchmark a heap is designed for."
	| n rnd array time sorted |
	n := 5000. "# of elements to sort"
	rnd := Random new.
	array := (1 to: n) collect:[:i| rnd next].
	"First, the heap version"
	time := Time millisecondsToRun:[
		sorted := Heap withAll: array.
		1 to: n do:[:i| 
			sorted removeFirst.
			sorted add: rnd next].
	].
	Transcript cr; show:'Time for Heap: ', time printString,' msecs'.
	"The quicksort version"
	time := Time millisecondsToRun:[
		sorted := SortedCollection withAll: array.
		1 to: n do:[:i| 
			sorted removeFirst.
			sorted add: rnd next].
	].
	Transcript cr; show:'Time for SortedCollection: ', time printString,' msecs'.

]

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>heapSortExample	"HeapTest new heapSortExample" [
	"Sort a random collection of Floats and compare the results with
	SortedCollection (using the quick-sort algorithm) and 
	ArrayedCollection>>mergeSortFrom:to:by: (using the merge-sort algorithm)."
	| n rnd array  time sorted |
	n := 10000. "# of elements to sort"
	rnd := Random new.
	array := (1 to: n) collect:[:i| rnd next].
	"First, the heap version"
	time := Time millisecondsToRun:[
		sorted := Heap withAll: array.
		1 to: n do:[:i| sorted removeFirst].
	].
	Transcript cr; show:'Time for heap-sort: ', time printString,' msecs'.
	"The quicksort version"
	time := Time millisecondsToRun:[
		sorted := SortedCollection withAll: array.
	].
	Transcript cr; show:'Time for quick-sort: ', time printString,' msecs'.
	"The merge-sort version"
	time := Time millisecondsToRun:[
		array mergeSortFrom: 1 to: array size by: [:v1 :v2| v1 <= v2].
	].
	Transcript cr; show:'Time for merge-sort: ', time printString,' msecs'.

]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>indexArray [
" return a Collection including indexes between bounds of 'nonEmpty' "

	^ indexArray 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>indexInForCollectionWithoutDuplicates [
" return an index between 'collectionWithoutEqualsElements'  bounds"
	^ 2
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>indexInNonEmpty [
" return an index between bounds of 'nonEmpty' "

	^2
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>integerCollectionWithoutEqualElements [
" return a collection of integer without equal elements"
	^ nonEmpty5ElementsWithoutDuplicate 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>moreThan3Elements [
	" return a collection including atLeast 3 elements"
	^ nonEmpty5ElementsWithoutDuplicate 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>moreThan4Elements [

" return a collection including at leat 4 elements"
	^ nonEmpty5ElementsWithoutDuplicate 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>newElement [
"return an element that will be put in the collection in place of another"
	^ elementNotIn 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>nonEmpty [
	^nonEmpty.
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>nonEmpty1Element [
" return a collection of size 1 including one element"
	^ nonEmpty1Element 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>nonEmptyMoreThan1Element [
" return a collection that don't includes equal elements'" 
	^nonEmpty5ElementsWithoutDuplicate .
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>nonEmptyWithoutEqualElements [
" return a collection without equal elements "
	^ nonEmpty5ElementsWithoutDuplicate 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>otherCollection [
	^ otherCollection
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>replacementCollection [
" return a collection including elements of type 'collectionOfSize5' elements'type"
^ collectionWith4Elements 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>replacementCollectionSameSize [
" return a collection of size (secondIndex - firstIndex + 1)"
	^subCollection 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>result [
	^ collectResult.
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>secondCollection [
" return a collection that will be the second part of the concatenation"
	^ nonEmpty5ElementsWithoutDuplicate 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>secondIndex [
" return an index between 'nonEmpty' bounds that is > to 'second index' "
	^3
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>setUp [
	element := 33.
	elementNotIn := 666.
	elementTwiceIn := 3.
	expectedSizeAfterReject := 1.
	expectedElementByDetect := -2.
	nonEmpty5ElementsWithoutDuplicate := Heap
		new 
		add: 2;
		add: 98;
		add: 4;
		add: 25;
		add: 1;
		yourself.
	collectionWithElement := Heap new.
	{  4. 5. 6. 2. 1. 1. (self element)  } do: [ :nb | collectionWithElement add: nb ].
	collectionWith4Elements := Heap
		new
		add: 1;
		add: -2;
		add: 3;
		add: 1;
		yourself.
	otherCollection := Heap new
		add: 1;
		add: 20;
		add: 30;
		yourself.
	empty := Heap new.
	nonEmpty := Heap
		new
		add: self valuePutIn;
		add: self element;
		add: self elementTwiceIn;
		add: self elementTwiceIn;
		yourself.
	collectionNotIncluded := Heap new
		add: elementNotIn;
		add: elementNotIn;
		yourself.
	doWithoutNumber := 3.
	collectResult := collectionWith4Elements collect: [ :each | each + 1 ].
	speciesClass := Heap.
	sameAtEndAndBegining := Heap new add: 1.5 ;  add: 1.5 copy ; yourself.
	nonEmpty1Element := Heap new add: 5 ; yourself.
	floatCollection := Heap new add: 2.5 ; add: 5.5 ; add:4.2 ; yourself.
	indexArray := #( 1 3).
	subCollection := Heap new.
	duplicateElement := 1.
	collectionWithDuplicateElement := Heap new add: duplicateElement ; add: duplicateElement ; add:4 ; yourself.
	self firstIndex to: self secondIndex do: [:each | subCollection add: elementNotIn  ].		

]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>sizeCollection [
	"Answers a collection whose #size is 4"
	^collectionWith4Elements 
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>speciesClass [
	
	^ speciesClass
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>subCollectionNotIn [
" return a collection for which at least one element is not included in 'moreThan4Elements' "
	^ collectionNotIncluded 
]

{
	#category : #'tests - fixture',
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>test0FixtureRequirementsOfTGrowableTest [
	self empty.
	self nonEmpty.
	self element.
	self elementNotInForOccurrences.
	self assert: self empty isEmpty.
	self deny: self nonEmpty isEmpty.
	self assert: (self nonEmpty includes: self element).
	self deny: (self nonEmpty includes: self elementNotInForOccurrences)
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>test1 [
	| data |

	"The first element of each array is the sort value, and the second will be updated by the heap with the index of the element within the heap."
	data :=  (1 to: 8) collect: [:i | {i*2. 0}].

	"Repeat with different data ordering."
	5 timesRepeat: [ | h |
		h := Heap new sortBlock: [:e1 :e2 | e1 first < e2 first].
		h indexUpdateBlock: [:array :index | array at: 2 put: index].

		data shuffled do: [:d | h add: d].
		data do: [:d | self should: (h asArray at: d second) == d].
	]
]

{
	#category : #'basic tests',
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>testAdd [
	"self run: #testAdd" 

	| heap |
	heap := Heap new.
	self assert: heap size = 0.
	heap add: 3.
	self assert: heap size = 1.
	self assert: heap isEmpty not.
	self assert: heap first = 3.
	heap add: 2.
	self assert: heap size = 2.
	self assert: heap first = 2.
	
]

{
	#category : #'tests - growable',
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>testAddNonEmptyGrowsWhenNewElement [
	"self debug: #testAddNonEmptyGrowsWhenNewElement"
	| oldSize |
	oldSize := self nonEmpty size.
	self deny: (self nonEmpty includes: self elementNotInForOccurrences).
	self nonEmpty add: self elementNotInForOccurrences.
	self assert: self nonEmpty size > oldSize
]

{
	#category : #'basic tests',
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>testDo [
	"self run: #testDo" 

	| heap coll |
	heap := Heap withAll: #(1 3 5).
	coll := OrderedCollection new.
	
	heap do: [:each | coll add: each].
	
	self assert: coll = #(1 3 5) asOrderedCollection.

]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>testExamples [
	self heapExample.
	self heapSortExample
]

{
	#category : #'basic tests',
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>testFirst [
	"self run: #testFirst"
	| heap | 
	heap := Heap new.
	heap add: 5.
	heap add: 12.
	heap add: 1.
	self assert: heap first = 1.
	heap removeFirst.
	self assert: heap first = 5.
]

{
	#category : #'basic tests',
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>testHeap [
	"self run: #testHeap"

	| heap | 
	heap := Heap new.
	self assert: heap isHeap.
	
	self assert: heap isEmpty.
	heap add: 1.
	self assert: heap isEmpty not
	

]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>testIfEqualIsTransitive [
	"This is http://bugs.squeak.org/view.php?id=6943"

    | anArray heap1 heap2 |
    anArray := #(1 2 3).
    heap1 := Heap withAll: (1 to: 3) sortBlock: [:a :b | a < b].
    heap2 := Heap withAll: (1 to: 3) sortBlock: [:a :b | b > a].
    self
		assert: (heap1 = anArray) & (heap2 = anArray) ==> (heap1 = heap2)
		description: 'Heap equality should be transitive'
]

{
	#category : #'basic tests',
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>testRemove [
	"self run: #testRemove"

	| heap |
	heap := Heap new.
	self should: [ heap removeFirst ] raise: Error.
	heap add: 5.
	heap removeFirst.
	self assert: heap size = 0.
	heap add: 5.
	self should: [ heap removeAt: 2 ] raise: Error
]

{
	#category : #'basic tests',
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>testSortBlock [
	"self run: #testSortBlock"

	| heap |
	heap := Heap withAll: #(1 3 5).
	self assert: heap asArray = #(1 3 5).
	
	heap sortBlock: [ :e1 :e2 | e1 >= e2 ].
	self assert: heap asArray = #(5 3 1)

]

{
	#category : #parameters,
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>valuePutIn [
	"the value that we will put in the non empty collection"
	
	^ 7
]

{
	#category : #requirements,
	#timestamp : ' 8/31/2017 05:26:28'
}
HeapTest>>withEqualElements [
	^ sameAtEndAndBegining 
]
