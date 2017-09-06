"
Browser for working history
"
Class {
	#name : #MCWorkingHistoryBrowser,
	#superclass : #MCVersionHistoryBrowser,
	#category : #MonticelloGUI,
	#timestamp : 'TorstenBergmann 2/20/2014 15:53'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCWorkingHistoryBrowser>>baseSnapshot [
	^ package snapshot
]
