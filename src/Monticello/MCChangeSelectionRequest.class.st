"
Notify about a change selection request
"
Class {
	#name : #MCChangeSelectionRequest,
	#superclass : #Notification,
	#instVars : [
		'patch',
		'label'
	],
	#category : #Monticello-Versioning,
	#timestamp : 'TorstenBergmann 2/5/2014 13:45'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCChangeSelectionRequest>>label [
	^ label
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCChangeSelectionRequest>>label: aString [
	label := aString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCChangeSelectionRequest>>patch [
	^ patch
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:17:01'
}
MCChangeSelectionRequest>>patch: aPatch [
	patch := aPatch
]
