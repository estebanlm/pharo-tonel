"

"
Class {
	#name : #MorphicTreeAdapterTest,
	#superclass : #TestCase,
	#instVars : [
		'treeWithItems'
	],
	#category : #Spec-Tests,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:46'
}
MorphicTreeAdapterTest>>modelClass [
	^ TreeModel
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:46'
}
MorphicTreeAdapterTest>>setUp [
	treeWithItems := self modelClass new.
	treeWithItems roots: #(#first #second #third #fourth #fifth)
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:46'
}
MorphicTreeAdapterTest>>testDefaultRowColors [
	| defaultColor |
	defaultColor := Smalltalk ui theme backgroundColor.
	treeWithItems buildWithSpec.
	self
		assert: treeWithItems widget widget rowColors
		equals: (Array with: defaultColor with: defaultColor)
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:46'
}
MorphicTreeAdapterTest>>testRowColorsAfterBuild [
	treeWithItems buildWithSpec.
	treeWithItems oddRowColor: Color red.
	treeWithItems evenRowColor: Color green.
	self
		assert: treeWithItems widget widget rowColors
		equals: (Array with: Color green with: Color red)
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:46'
}
MorphicTreeAdapterTest>>testRowColorsBeforeBuild [
	treeWithItems oddRowColor: Color red.
	treeWithItems evenRowColor: Color green.
	treeWithItems buildWithSpec.
	self
		assert: treeWithItems widget widget rowColors
		equals: (Array with: Color green with: Color red)
]
