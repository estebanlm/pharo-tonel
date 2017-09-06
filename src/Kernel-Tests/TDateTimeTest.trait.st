"
I am a helper Trait for date tests. By providing methods to locally change the time zones I simplify date and time tests.
"
Trait {
	#name : #TDateTimeTest,
	#traits : '{}',
	#classTraits : '{}',
	#category : #Kernel-Tests-Chronology,
	#timestamp : '<historical>'
}

{
	#category : #helpers,
	#timestamp : ' 8/31/2017 05:26:30'
}
TDateTimeTest>>restoreLocalTimeZoneAfter: aBlock [

	| realTimeZone |
	realTimeZone := DateAndTime localTimeZone.
	aBlock ensure: [ DateAndTime localTimeZone: realTimeZone ].
]

{
	#category : #helpers,
	#timestamp : ' 8/31/2017 05:26:30'
}
TDateTimeTest>>useNonUtcTimeZoneDuring: aBlock [

	self useTimeZone: 'EDT' during: aBlock.
]

{
	#category : #helpers,
	#timestamp : ' 8/31/2017 05:26:30'
}
TDateTimeTest>>useTimeZone: abbreviation during: aBlock [

  | timeZone |
  timeZone := TimeZone abbreviated: abbreviation.
  self restoreLocalTimeZoneAfter: [ 
    DateAndTime localTimeZone: timeZone. 
    aBlock cull: timeZone ].
]
