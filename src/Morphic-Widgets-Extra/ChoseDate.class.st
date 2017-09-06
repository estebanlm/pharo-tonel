"
A ChoseDate is an announcement raised by the CalendarMorph
"
Class {
	#name : #ChoseDate,
	#superclass : #Announcement,
	#instVars : [
		'date',
		'calendar'
	],
	#category : #Morphic-Widgets-Extra,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:14'
}
ChoseDate class>>of: aDate from: aCalendarChooserMorph [

	^ self new
		date: aDate;
		calendar: aCalendarChooserMorph.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
ChoseDate>>calendar [

	^ calendar.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:14'
}
ChoseDate>>calendar: aCalendarChooserMorph  [

	calendar := aCalendarChooserMorph.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
ChoseDate>>date [

	^ date.
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:14'
}
ChoseDate>>date: aDate  [

	date := aDate.
]
