"

"
Class {
	#name : #GTSpotterWidgetDarkThemer,
	#superclass : #GTSpotterWidgetThemer,
	#category : #GT-Spotter-Theme,
	#timestamp : ''
}

{
	#category : #values,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetDarkThemer>>itemActionSelectedBackgroundColor [

	^ self itemSelectedBackgroundColor slightlyDarker
]

{
	#category : #values,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetDarkThemer>>itemIconAlphaValue [

	^ 0.5
]

{
	#category : #values,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetDarkThemer>>itemSelectedBackgroundColor [

	^ self backgroundColor slightlyDarker
]

{
	#category : #values,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetDarkThemer>>searchFieldTextColor [
	
	^ Color white slightlyDarker
]

{
	#category : #values,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTSpotterWidgetDarkThemer>>titleTextColor [

	^ self backgroundColor muchLighter
]
