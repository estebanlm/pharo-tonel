"
Error raised when a tab is asked its contents but have no morph and no retrieving block, or the retrieving block is returning nil.
"
Class {
	#name : #TabWithNoContents,
	#superclass : #Error,
	#instVars : [
		'tab'
	],
	#category : #Morphic-Widgets-Tabs-Support,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:14'
}
TabWithNoContents class>>signalTab: aTab  [
	
	^ self new
		tab: aTab;
		signal
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabWithNoContents>>tab [
	^tab
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
TabWithNoContents>>tab: aTab  [

	tab := aTab
]
