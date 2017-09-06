"
SUnit tests for class CollectVisitor
"
Class {
	#name : #CollectVisitorTest,
	#superclass : #AbstractEnumerationVisitorTest,
	#category : #FileSystem-Tests-Core,
	#timestamp : 'TorstenBergmann 1/31/2014 11:41'
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
CollectVisitorTest>>testBreadthFirst [
	| entries |
	entries := CollectVisitor breadthFirst: self root.
	self 
		assertEntries: entries
		are: #(
				'/alpha'
				'/alpha/beta'
				'/alpha/epsilon'
				'/alpha/beta/delta'
				'/alpha/beta/gamma'
				'/alpha/epsilon/zeta'
			)
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
CollectVisitorTest>>testPostorder [
	| entries |
	entries := CollectVisitor postorder: self root.
	self 
		assertEntries: entries
		are: #(
				'/alpha/beta/delta'
				'/alpha/beta/gamma'
				'/alpha/beta'
				'/alpha/epsilon/zeta'
				'/alpha/epsilon'
				'/alpha'
			)
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
CollectVisitorTest>>testPreorder [
	| entries |
	entries := CollectVisitor preorder: self root.
	self 
		assertEntries: entries
		are: #(
				'/alpha'
				'/alpha/beta'
				'/alpha/beta/delta'
				'/alpha/beta/gamma'
				'/alpha/epsilon'
				'/alpha/epsilon/zeta'
			)
]
