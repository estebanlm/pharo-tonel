"
I implement a filtering strategy for processors that always returns true. Use me by default instead of adding null checks to determnine if a filter is present.
"
Class {
	#name : #GTSpotterNullProcessorFilter,
	#superclass : #GTSpotterProcessorFilter,
	#category : #GT-Spotter-Model,
	#timestamp : 'AndreiChis 7/7/2015 16:36'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterNullProcessorFilter>>configurationBlockForProcessorsCreatedBy: aMethod [
	"No need to configure anything."
	
	^ [ :processor | ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterNullProcessorFilter>>shouldEnableProcessorsCreateBy: aMethod [
	"Enable everything."
	
	^ true
]
