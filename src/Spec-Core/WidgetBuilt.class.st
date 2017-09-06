"
I am raised when a widget has been built
"
Class {
	#name : #WidgetBuilt,
	#superclass : #Announcement,
	#instVars : [
		'model',
		'widget'
	],
	#category : #Spec-Core-Support,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:18'
}
WidgetBuilt class>>model: model widget: widget [

	^ self new
		model: model;
		widget: widget;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
WidgetBuilt>>model [
	^ model
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
WidgetBuilt>>model: anObject [
	model := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
WidgetBuilt>>widget [
	^ widget
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
WidgetBuilt>>widget: anObject [
	widget := anObject
]
