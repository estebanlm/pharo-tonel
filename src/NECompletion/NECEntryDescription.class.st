"
A NECEntryDescription is a holder for some information to be displayed.
"
Class {
	#name : #NECEntryDescription,
	#superclass : #Object,
	#instVars : [
		'title',
		'description',
		'label'
	],
	#category : #NECompletion-Model,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:21'
}
NECEntryDescription class>>label: firstString  [
	^ self new
		setLabel: firstString
		title: '(unknown)'
		description: nil
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:21'
}
NECEntryDescription class>>label: firstString title: secondString description: thirdString  [
	^ self new 
		setLabel: firstString
		title: secondString
		description: thirdString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECEntryDescription>>description [
(	description isNil or:[description isEmpty]) ifTrue:[^'-'].
	^ description
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECEntryDescription>>label [
	^ label
]

{
	#category : #initialize-release,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECEntryDescription>>setLabel: firstString title: secondString description: thirdString  [
	label := firstString.
	title := secondString.
	description := thirdString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NECEntryDescription>>title [
^ title
]
