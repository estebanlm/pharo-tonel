"

"
Class {
	#name : #KMCategoryTest,
	#superclass : #AbstractKeymappingTest,
	#instVars : [
		'categoryContainer'
	],
	#category : #Keymapping-Tests,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:43'
}
KMCategoryTest>>categoryContainer [
	^ KMFactory keymapContainer
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
KMCategoryTest>>testAddKeymapToCategory [
	| categoryToAdd entry |
	categoryToAdd := KMCategory named: #TestCategory.
	entry := KMKeymap named: #Foo shortcut: $a asKeyCombination, $b asKeyCombination, $c asKeyCombination action: [ "nothing" ].

	self assert: (categoryToAdd allEntries) size = 0.
	categoryToAdd addKeymapEntry: entry.
	self assert: (categoryToAdd allEntries) size = 1.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
KMCategoryTest>>testCreateExistentCategoryFails [
	| categoryToAdd |
	categoryToAdd := KMCategory named: #TestCategory.
	
	self assert: self categoryContainer categories size = 0.
	self categoryContainer addCategory: categoryToAdd.
	self assert: self categoryContainer categories size = 1.
	self should: [self categoryContainer addCategory: categoryToAdd] raise: Error.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:43'
}
KMCategoryTest>>testCreateUnexistentCategory [
	| categoryToAdd |
	categoryToAdd := KMCategory named: #TestCategory.
	
	self assert: self categoryContainer categories size = 0.
	self categoryContainer addCategory: categoryToAdd.
	self assert: self categoryContainer categories size = 1.
	self assert: (self categoryContainer includesCategory: categoryToAdd).
]
