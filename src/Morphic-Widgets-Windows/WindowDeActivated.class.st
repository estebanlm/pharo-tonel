"
This announcement is emitted when the top window switches from ""this"" window to another. 
The new window will announce WindowActivated, while the old will announce this annoucnement.
"
Class {
	#name : #WindowDeActivated,
	#superclass : #WindowAnnouncement,
	#category : #Morphic-Widgets-Windows-Announcements,
	#timestamp : 'HenrikNergaard 10/17/2015 15:56'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:15'
}
WindowDeActivated>>isDeActivated [

	^true
]
