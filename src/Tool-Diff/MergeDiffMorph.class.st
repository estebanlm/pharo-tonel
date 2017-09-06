"

"
Class {
	#name : #MergeDiffMorph,
	#superclass : #DiffMorph,
	#instVars : [
		'allowJoinClicks'
	],
	#category : #Tool-Diff,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
MergeDiffMorph>>allowJoinClicks [
	"Answer the value of allowJoinClicks"

	^ allowJoinClicks
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:25'
}
MergeDiffMorph>>allowJoinClicks: anObject [
	"Set the value of allowJoinClicks"

	allowJoinClicks := anObject
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:25'
}
MergeDiffMorph>>calculatedJoinMappings [
	"Specify click allowance for each section."
	
	^super calculatedJoinMappings do: [:j |
		j allowClick: self allowJoinClicks]
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:25'
}
MergeDiffMorph>>compositeText [
	"Answer the composite text based on the selection state
	of the joins."

	^self joinMorph compositeText
	
]

{
	#category : #obsolete,
	#timestamp : ' 8/31/2017 05:26:25'
}
MergeDiffMorph>>indicateDst [
	"Change the indicators of the joins to the dst side."

	self joinMappings do: [:section |
		section selectionState: #dst].
	self
		changed;
		changed: #selectedDifferences
]

{
	#category : #obsolete,
	#timestamp : ' 8/31/2017 05:26:25'
}
MergeDiffMorph>>indicateSrc [
	"Change the indicators of the joins to the src side."

	self joinMappings do: [:section |
		section selectionState: #src].
	self
		changed;
		changed: #selectedDifferences
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 05:26:25'
}
MergeDiffMorph>>initialize [
	"Initialize the receiver."

	super initialize.
	self
		allowJoinClicks: true
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:25'
}
MergeDiffMorph>>joinSectionClass [
	"Answer the class to use for a new join section."

	^MergeJoinSection
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:25'
}
MergeDiffMorph>>newJoinMorph [
	"Answer a new join morph."

	^super newJoinMorph
		when: #joinClicked send: #update: to: self with: #joinClicked
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:25'
}
MergeDiffMorph>>update: aspect [
	"A join has probably changed its selection state."

	super update: aspect.
	aspect == #joinClicked
		ifTrue: [self
				changed;
				changed: #selectedDifferences]
]
