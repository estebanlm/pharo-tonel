"
A PragmaAnnouncement is announced by a PragmaCollector when it adds, removes or updates a PragmaHandler.

Instance Variables
	pragma:		<Pragma>

pragma
	- the pragma which has been added, removed or updated

"
Class {
	#name : #PragmaAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'pragma'
	],
	#category : #PragmaCollector,
	#timestamp : 'alain.plantec 10/20/2009 11:34'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:11'
}
PragmaAnnouncement class>>pragma: aPragma [
	^ self new pragma: aPragma
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:11'
}
PragmaAnnouncement>>pragma [
	^ pragma
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:11'
}
PragmaAnnouncement>>pragma: aPragma [
	pragma := aPragma
]
