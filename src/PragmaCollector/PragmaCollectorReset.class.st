"
A PragmaCollectorReset is an announce which is announced by a PragamColllector when it is reset.
see PragmaCollector>>reset.

Instance Variables
	collector:		<PragmaCollector>

collector
	- the collector which is reset

"
Class {
	#name : #PragmaCollectorReset,
	#superclass : #Announcement,
	#instVars : [
		'collector'
	],
	#category : #PragmaCollector,
	#timestamp : 'alain.plantec 10/20/2009 11:14'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:11'
}
PragmaCollectorReset class>>collector: aCollector [
	^ self new collector: aCollector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:11'
}
PragmaCollectorReset>>collector [
	^collector
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:11'
}
PragmaCollectorReset>>collector: aCollector [
	collector := aCollector
]
