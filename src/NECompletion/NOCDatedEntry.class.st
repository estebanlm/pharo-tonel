"
I keep a symbol entry, along with the last time it was used in the system. 
I am used to sort the possible answers.
"
Class {
	#name : #NOCDatedEntry,
	#superclass : #NECSelectorEntry,
	#instVars : [
		'date',
		'next',
		'previous'
	],
	#category : #NECompletion-OCompletion,
	#timestamp : '<historical>'
}

{
	#category : #operations,
	#timestamp : ' 8/31/2017 05:26:21'
}
NOCDatedEntry>><= anEntry [
	^ date = anEntry date 
		ifTrue: [contents <= anEntry contents]
		ifFalse: [date > anEntry date]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NOCDatedEntry>>date [
	^ date
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NOCDatedEntry>>date: d [
	date := d
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NOCDatedEntry>>link: anODatedEntry [
	"Link the given entry after me."

	anODatedEntry
		next: next;
		previous: self.
	next previous: anODatedEntry.
	next := anODatedEntry
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NOCDatedEntry>>matches: pref [

	^contents beginsWithEmpty: pref caseSensitive: false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NOCDatedEntry>>next [

	^next
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NOCDatedEntry>>next: anODatedEntry [

	next := anODatedEntry
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NOCDatedEntry>>now [
	date := DateAndTime now
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NOCDatedEntry>>previous [

	^previous
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NOCDatedEntry>>previous: anODatedEntry [

	previous := anODatedEntry
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
NOCDatedEntry>>unlink [

	next previous: previous.
	previous next: next
]
