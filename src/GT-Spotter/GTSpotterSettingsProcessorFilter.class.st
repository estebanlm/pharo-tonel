"
I implement a filtering strategy for processors that takes into account the GTSpotterExtensionSettings. Essentially, I will only allow processors that appear as enabled in the Settings Browser.
"
Class {
	#name : #GTSpotterSettingsProcessorFilter,
	#superclass : #GTSpotterProcessorFilter,
	#category : #GT-Spotter-Model,
	#timestamp : 'TudorGirba 1/21/2016 23:01'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterSettingsProcessorFilter>>configurationBlockForProcessorsCreatedBy: aMethod [
	"No need to configure anything."
	
	^ [ :processor | ]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterSettingsProcessorFilter>>shouldEnableProcessorsCreateBy: aMethod [
	"Enable everything."
	
	^ (GTSpotterExtensionSettings shouldSpotterIgnoreProcessorDefinedInMethod: aMethod) not
]
