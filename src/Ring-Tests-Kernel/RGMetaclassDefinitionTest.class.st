"
SUnit tests for Ring metaclass definitions
"
Class {
	#name : #RGMetaclassDefinitionTest,
	#superclass : #TestCase,
	#category : #Ring-Tests-Kernel,
	#timestamp : 'NicolaiHess 9/16/2014 23:54'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:29'
}
RGMetaclassDefinitionTest>>testAsMetaclassDefinition [
	| rgClass class |
	class := Class class.
	rgClass:= class asRingDefinition.
	
	self assert: (rgClass isRingObject).
	self assert: (rgClass isClass).  
	self assert: (rgClass name == #'Class class').  
	self assert: (rgClass category == class category).
	self assert: (rgClass theMetaClass == rgClass).

]
