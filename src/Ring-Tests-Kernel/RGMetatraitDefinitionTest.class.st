"
SUnit tests for Ring classtrait definitions
"
Class {
	#name : #RGMetatraitDefinitionTest,
	#superclass : #TestCase,
	#category : #Ring-Tests-Kernel,
	#timestamp : 'NicolaiHess 9/17/2014 00:02'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:29'
}
RGMetatraitDefinitionTest>>testAsClassTraitfinition [
	| rgCTrait cTrait |
	cTrait := TClass classTrait.
	rgCTrait := cTrait asRingDefinition.
	self assert: rgCTrait isRingObject.
	self assert: rgCTrait isTrait.
	self assert: rgCTrait name == #'TClass classTrait'.
	self assert: rgCTrait category == cTrait category.
	self assert: rgCTrait theMetaClass == rgCTrait
]
