"
I am raised when the current selection is modified 
"
Class {
	#name : #RubSelectionChanged,
	#superclass : #RubMorphAnnouncement,
	#instVars : [
		'previousMarkBlock',
		'previousPointBlock'
	],
	#category : #Rubric-Editing-Announcements,
	#timestamp : 'FranckWarlouzet 7/29/2015 11:15'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:20'
}
RubSelectionChanged class>>from: aTextArea previousMarkBlock: prevMarkBlock previousPointBlock: prevPointBlock  [
	^ self new from: aTextArea previousMarkBlock: prevMarkBlock previousPointBlock: prevPointBlock 

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubSelectionChanged>>from: aTextArea previousMarkBlock: prevMarkBlock previousPointBlock: prevPointBlock  [
	self morph: aTextArea.
	previousMarkBlock := prevMarkBlock.
	previousPointBlock := prevPointBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubSelectionChanged>>markBlock [
	^ self textArea markBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubSelectionChanged>>pointBlock [
	^ self textArea pointBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubSelectionChanged>>previousMarkBlock [
	^ previousMarkBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubSelectionChanged>>previousPointBlock [
	^ previousPointBlock
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:20'
}
RubSelectionChanged>>textArea [
	^ morph
]
