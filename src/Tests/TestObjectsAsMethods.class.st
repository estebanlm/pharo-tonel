"

"
Class {
	#name : #TestObjectsAsMethods,
	#superclass : #TestCase,
	#category : #Tests-ObjectsAsMethods,
	#timestamp : ''
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:29'
}
TestObjectsAsMethods>>setUp [
	SystemAnnouncer uniqueInstance suspendAllWhile: [
		self class addSelector: #add:with: withMethod: ObjectsAsMethodsExample new.
		self class addSelector: #answer42 withMethod: ObjectsAsMethodsExample new.
		self class addSelector: #foo withMethod: AbstractObjectsAsMethod new ]
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:29'
}
TestObjectsAsMethods>>tearDown [
	SystemAnnouncer uniqueInstance suspendAllWhile: [
		self class removeSelector: #add:with:.
		self class removeSelector: #answer42.
		self class removeSelector: #foo ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:29'
}
TestObjectsAsMethods>>testAddNumbers [

	self assert: (self add: 3 with: 4) = 7.
	self assert: (self perform: #add:with: withArguments: #(3 4)) = 7.
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:29'
}
TestObjectsAsMethods>>testAnswer42  [

	self assert: self answer42 = 42
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:29'
}
TestObjectsAsMethods>>testDNU  [

	self should: [self foo] raise: MessageNotUnderstood
]
