"
I'm a Announcement used to indicate a color has changed. 

Example:

(ColorSelectorDialogWindow new
                        title: 'Choose a color';
                        open;
                        announcer) on: ColorChanged  do: [:ann|
                                                                        UIManager inform: 'Selected color: ', ann newColor asString].
"
Class {
	#name : #ColorChanged,
	#superclass : #Announcement,
	#instVars : [
		'newColor'
	],
	#category : #Morphic-Widgets-ColorPicker,
	#timestamp : 'LaurentLaffont 4/15/2011 20:19'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:14'
}
ColorChanged class>>to: aColor [
	^self new 
		newColor: aColor
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
ColorChanged>>newColor [
	^ newColor
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:14'
}
ColorChanged>>newColor: anObject [
	newColor := anObject
]
