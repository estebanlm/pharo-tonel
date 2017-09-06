"

"
Class {
	#name : #GLMRubTextAreaBrick,
	#superclass : #GLMRubEditingAreaBrick,
	#category : #Glamour-Morphic-Brick-Widgets-Core,
	#timestamp : ''
}

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMRubTextAreaBrick>>initialize [
	super initialize.
	
	self rubricBackgroundColor: Color transparent
]

{
	#category : #rubric-brick-creation,
	#timestamp : ' 8/31/2017 05:26:34'
}
GLMRubTextAreaBrick>>newRubricMorph [

	^ super newRubricMorph
		beReadOnly;
		withoutAnyDecorator
]
