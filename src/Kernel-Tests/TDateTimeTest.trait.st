"
I am a helper Trait for date tests. By providing methods to locally change the time zones I simplify date and time tests.
"
Trait {
	#name : #TDateTimeTest,
	#category : #Kernel-Tests-Chronology
}

{ #category : #helpers }
TDateTimeTest >> restoreLocalTimeZoneAfter: aBlock [

	| realTimeZone |
	realTimeZone := DateAndTime localTimeZone.
	aBlock ensure: [ DateAndTime localTimeZone: realTimeZone ].
]

{ #category : #helpers }
TDateTimeTest >> useNonUtcTimeZoneDuring: aBlock [

	self useTimeZone: 'EDT' during: aBlock.
]

{ #category : #helpers }
TDateTimeTest >> useTimeZone: abbreviation during: aBlock [

  | timeZone |
  timeZone := TimeZone abbreviated: abbreviation.
  self restoreLocalTimeZoneAfter: [ 
    DateAndTime localTimeZone: timeZone. 
    aBlock cull: timeZone ].
]
