"
I am an abstract class to get the correct menu of a text area
"
Class {
	#name : #RubGetMenuPolicy,
	#superclass : #Object,
	#instVars : [
		'textArea'
	],
	#category : #Rubric-Editing-Core,
	#timestamp : 'FranckWarlouzet 7/29/2015 13:02'
}

{
	#category : #'accessing menu',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubGetMenuPolicy>>lookupMenu  [
	^ textArea lookupMenu
]

{
	#category : #'accessing menu',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubGetMenuPolicy>>lookupShiftMenu  [
	^ textArea lookupShiftMenu
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubGetMenuPolicy>>textArea [
	^ textArea
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubGetMenuPolicy>>textArea: aTextArea [
	textArea := aTextArea
]
