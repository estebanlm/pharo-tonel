"

"
Class {
	#name : #MCOrganizationTest,
	#superclass : #MCTestCase,
	#category : #Monticello-Tests,
	#timestamp : ''
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCOrganizationTest>>testLoadAndUnload [
	| category |
	category := 'TestPackageToUnload'.
	SystemOrganization addCategory: category.
	(MCOrganizationDefinition categories: { category }) unload.
	self deny: (SystemOrganization includesCategory: category)
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCOrganizationTest>>testReordering [
	|dec cats newCats |
	dec := MCOrganizationDefinition categories: #(A B C).
	cats := #(X Y B Z C A Q).
	newCats := dec reorderCategories: cats original: #(B C A).
	self assert: newCats asArray = #(X Y A B C Z Q).
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCOrganizationTest>>testReorderingWithNoCategoriesInVersion [
	|dec cats newCats |
	dec := MCOrganizationDefinition categories: #().
	cats := #(X Y B Z C A Q).
	newCats := dec reorderCategories: cats original: #().
	self assert: newCats asArray = cats.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:31'
}
MCOrganizationTest>>testReorderingWithRemovals [
	|dec cats newCats |
	dec := MCOrganizationDefinition categories: #(A B C).
	cats := #(X Y B Z C A Q).
	newCats := dec reorderCategories: cats original: #(Y B C A Q).
	self assert: newCats asArray = #(X A B C Z).
]
