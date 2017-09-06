"

"
Class {
	#name : #SortHierarchicallyTests,
	#superclass : #TestCase,
	#instVars : [
		'completeTree',
		'partialTree',
		'unrelatedClasses',
		'archivesClasses'
	],
	#category : #Nautilus-Tests,
	#timestamp : ''
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:44'
}
SortHierarchicallyTests>>nodes: nodes shouldBe: correctNodes [
	"sort the collection of nodes. The result should be the correctNodes"

	| sorted |
	sorted := SortHierarchically sortClasses: nodes .
	self assert: sorted size equals: correctNodes size.
	correctNodes with: sorted do: [:node :sortedNode | self assert: node equals: sortedNode]
]

{
	#category : #setup,
	#timestamp : ' 8/31/2017 05:26:44'
}
SortHierarchicallyTests>>setUp [

	completeTree := {String . ByteString . Symbol . ByteSymbol . WideSymbol . WideString} .
	partialTree := {String . ByteString . ByteSymbol . WideString}.
	unrelatedClasses :=  {ArrayedCollection . BlockClosure . Class  . Morph . Point}.
	archivesClasses :=  {Archive . TarArchive . ZipArchive . ArchiveMember . TarArchiveMember . ZipArchiveMember . ZipFileMember . ZipDirectoryMember . ZipNewFileMember . ZipStringMember . ZipFileConstants}
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:44'
}
SortHierarchicallyTests>>sortByNameSize: collection [

	^collection asSortedCollection: [:x :y | x name size < y name size]
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:44'
}
SortHierarchicallyTests>>testArchivesClassesReversed [

	self
		nodes: archivesClasses reversed
		shouldBe: archivesClasses
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:44'
}
SortHierarchicallyTests>>testArchivesClassesUnchanged [

	self
		nodes: archivesClasses
		shouldBe: archivesClasses
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:44'
}
SortHierarchicallyTests>>testArchivesClassesUnordered [

	self
		nodes: (self sortByNameSize: archivesClasses)
		shouldBe: archivesClasses
		
	
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:44'
}
SortHierarchicallyTests>>testCompleteTreeReversed [

	self
		nodes: completeTree reversed
		shouldBe: completeTree
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:44'
}
SortHierarchicallyTests>>testCompleteTreeUnchanged [

	self
		nodes: completeTree
		shouldBe: completeTree
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:44'
}
SortHierarchicallyTests>>testCompleteTreeUnordered [

	self
		nodes: (self sortByNameSize: completeTree)
		shouldBe: completeTree
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:44'
}
SortHierarchicallyTests>>testOneClass [

	| pointNode sorted |
	pointNode := SortHierarchicallyIndentNode.
	sorted := SortHierarchically sortClasses: {pointNode}.
	self assert: sorted size = 1.
	self assert: (sorted includes: pointNode)
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:44'
}
SortHierarchicallyTests>>testPartialTreeReversed [

	self
		nodes: partialTree reversed
		shouldBe: partialTree
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:44'
}
SortHierarchicallyTests>>testPartialTreeUnchanged [

	self
		nodes: partialTree
		shouldBe: partialTree
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:44'
}
SortHierarchicallyTests>>testPartialTreeUnsorted [

	self
		nodes: (self sortByNameSize: partialTree)
		shouldBe: partialTree
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:44'
}
SortHierarchicallyTests>>testUnrelatedClassesReversed [

	self
		nodes: unrelatedClasses reversed
		shouldBe: unrelatedClasses
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:44'
}
SortHierarchicallyTests>>testUnrelatedClassesUnchanged [

	self
		nodes: unrelatedClasses
		shouldBe: unrelatedClasses
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:44'
}
SortHierarchicallyTests>>testUnrelatedClassesUnsorted [

	self
		nodes: (self sortByNameSize: unrelatedClasses)
		shouldBe: unrelatedClasses
]
