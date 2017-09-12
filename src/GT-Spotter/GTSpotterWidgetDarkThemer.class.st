Class {
	#name : #GTSpotterWidgetDarkThemer,
	#superclass : #GTSpotterWidgetThemer,
	#category : #GT-Spotter-Theme
}

{ #category : #values }
GTSpotterWidgetDarkThemer >> itemActionSelectedBackgroundColor [

	^ self itemSelectedBackgroundColor slightlyDarker
]

{ #category : #values }
GTSpotterWidgetDarkThemer >> itemIconAlphaValue [

	^ 0.5
]

{ #category : #values }
GTSpotterWidgetDarkThemer >> itemSelectedBackgroundColor [

	^ self backgroundColor slightlyDarker
]

{ #category : #values }
GTSpotterWidgetDarkThemer >> searchFieldTextColor [
	
	^ Color white slightlyDarker
]

{ #category : #values }
GTSpotterWidgetDarkThemer >> titleTextColor [

	^ self backgroundColor muchLighter
]
