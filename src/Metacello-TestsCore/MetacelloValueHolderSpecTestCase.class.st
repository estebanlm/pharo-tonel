"

"
Class {
	#name : #MetacelloValueHolderSpecTestCase,
	#superclass : #MetacelloSpecTestCase,
	#category : #Metacello-TestsCore-Specs,
	#timestamp : ''
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloValueHolderSpecTestCase>>testValueHolderMergeSpec [
    | valueHolderA valueHolderB valueHolder |
    valueHolderA := self valueHolderSpec
        value: 'an Object';
        yourself.
    valueHolderB := self valueHolderSpec
        value: 1.1;
        yourself.
    valueHolder := valueHolderA mergeSpec: valueHolderB.
    self assert: valueHolder value = 1.1
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloValueHolderSpecTestCase>>testValueHolderSpec [
    | valueHolder |
    valueHolder := self valueHolderSpec
        value: 'an Object';
        yourself.
    self assert: valueHolder value = 'an Object'
]
