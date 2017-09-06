"
I'm a class to create classes with a category. I'm only used by Tests.

I am similar to ClassFactoryForTestCase (i.e., I can be used in place of a ClassFactoryForTestCase), expect that classes may be created on a specific class category.
"
Class {
	#name : #ClassFactoryWithOrganization,
	#superclass : #ClassFactoryForTestCase,
	#instVars : [
		'organization'
	],
	#category : #SUnit-Core-Extensions,
	#timestamp : 'LaurentLaffont 5/4/2011 21:25'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassFactoryWithOrganization class>>newWithOrganization: aSystemOrganizer [
	^self new
		organization: aSystemOrganizer;
		yourself
]

{
	#category : #cleaning,
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassFactoryWithOrganization>>deletePackage [
	| categoriesMatchString |
	categoriesMatchString := self packageName, '-*'.
	self organization removeCategoriesMatching: categoriesMatchString ; 
		removeEmptyCategories
	
]

{
	#category : #creating,
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassFactoryWithOrganization>>newClassNamed: aString subclassOf: aClass instanceVariableNames: ivNamesString classVariableNames:  classVarsString  [
	^self 
		newClassNamed: aString
		subclassOf: aClass 
		instanceVariableNames: ivNamesString 
		classVariableNames: classVarsString 
		category:  (self packageName, '-', self defaultCategoryPostfix) asSymbol.
]

{
	#category : #creating,
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassFactoryWithOrganization>>newClassNamed: aString subclassOf: aClass instanceVariableNames: ivNamesString classVariableNames: classVarsString category: category [
	| newClass |
	newClass := aClass classInstaller
		make: [ :builder | 
			builder
				superclass: aClass;
				name: aString;
				layoutClass: aClass classLayout class;
				slots: ivNamesString asSlotCollection;
				sharedVariablesFromString: classVarsString;
				sharedPools: '';
				category: category asSymbol;
				environment: self organization environment ].
	self createdClasses add: newClass.
	^ newClass
]

{
	#category : #creating,
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassFactoryWithOrganization>>newSubclassOf: aClass instanceVariableNames: ivNamesString classVariableNames:  classVarsString  [
	^self 
		newSubclassOf: aClass 
		instanceVariableNames: ivNamesString 
		classVariableNames: classVarsString 
		category:  (self packageName, '-', self defaultCategoryPostfix) asSymbol.
]

{
	#category : #creating,
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassFactoryWithOrganization>>newSubclassOf: aClass instanceVariableNames: ivNamesString classVariableNames: classVarsString category: category [
	| newClass |
	newClass := aClass classInstaller
		make: [ :builder | 
			builder
				superclass: aClass;
				name: self newClassName;
				layoutClass: aClass classLayout class;
				slots: ivNamesString asSlotCollection;
				sharedVariablesFromString: classVarsString;
				sharedPools: '';
				category: category asSymbol;
				environment: self organization environment ].
	self createdClasses add: newClass.
	^ newClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassFactoryWithOrganization>>organization [
	^organization
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:08'
}
ClassFactoryWithOrganization>>organization: aSystemOrganizer [
	organization := aSystemOrganizer
]
