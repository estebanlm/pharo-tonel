"
SUnit tests for class organization
"
Class {
	#name : #ClassOrganizationTest,
	#superclass : #TestCase,
	#instVars : [
		'organization',
		'class'
	],
	#category : #Kernel-Tests-Protocols,
	#timestamp : 'TorstenBergmann 2/4/2014 22:00'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:30'
}
ClassOrganizationTest>>organization  [
	^ organization
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:30'
}
ClassOrganizationTest>>runCase  [
	SystemAnnouncer uniqueInstance 
		suspendAllWhile: [ super runCase ]
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:30'
}
ClassOrganizationTest>>setUp  [
	class := Object subclass: #ClassForTests instanceVariableNames: '' classVariableNames: '' category: 'ClassOrganizer-Tests'.
	organization := ClassOrganization forClass: class.
	organization addCategory: 'empty'.
	organization addCategory: 'one'.
	organization classify: #one under: 'one' suppressIfDefault: true.
	
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:30'
}
ClassOrganizationTest>>tearDown [
	class removeFromSystem
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
ClassOrganizationTest>>testAddCategory [
	
	self organization addCategory: 'test-protocol'.
	
	self assert: (self organization categories includes: 'test-protocol')
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
ClassOrganizationTest>>testCategories [
	| categories |
	
	categories := self organization categories.
	self assert: categories notEmpty.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
ClassOrganizationTest>>testListAtCategoryNamed [
	| methods |

	methods := self organization listAtCategoryNamed: 'empty'.
	self assert: methods isEmpty.
		
	methods := self organization listAtCategoryNamed: 'one'.
	self assert: methods size = 1.
	self assert: methods first = #one.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
ClassOrganizationTest>>testRemoveCategory [
	self assert: self organization categories size = 2.
	self should: [ self organization removeCategory: 'one' ] raise: Error.
	self organization removeCategory: 'empty'.
	self assert: self organization categories size = 1.
	self assert: self organization categories first = 'one'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
ClassOrganizationTest>>testRemoveNonExistingProtocol [
	self organization removeCategory: 'non-existent'
]
