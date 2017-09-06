"
This is a custom help book for the announcements framework.

"
Class {
	#name : #AnnouncementsHelp,
	#superclass : #CustomHelp,
	#category : #Announcements-Help,
	#timestamp : 'Tbn 11/12/2010 11:17'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
AnnouncementsHelp class>>bookName [
	^'Announcements framework'
]

{
	#category : #pages,
	#timestamp : ' 8/31/2017 05:26:22'
}
AnnouncementsHelp class>>introduction [
	"This method was automatically generated. Edit it using:"
	"AnnouncementsHelp edit: #introduction"
	^HelpTopic
		title: 'Introduction'
		contents: 
'The announcement framwork is an event notification framework. Compared to "traditional" Smalltalk event systems in this new framework, an event is a real object rather than a symbol.

An event someone might want to announce, such as a button click or an attribute change, is defined as a subclass of the abstract superclass Announcement. The subclass can have instance variables for additional information to pass along, such as a timestamp, or mouse coordinates at the time of the event, or the old value of the parameter that has changed. To signal the actual occurrence of an event, the "announcer" creates and configures an instance of an appropriate announcement, then broadcasts that instance. Objects subscribed to receive such broadcasts from the announcer receive a broadcast notification together with the instance. They can talk to the instance to find out any additional information about the event that has occurred.!'  
]

{
	#category : #pages,
	#timestamp : ' 8/31/2017 05:26:22'
}
AnnouncementsHelp class>>links [
	"This method was automatically generated. Edit it using:"
	"AnnouncementsHelp edit: #links"
	^HelpTopic
		title: 'Links'
		contents: 'You can get more informations on the framework on the following websites:

http://book.pharo-project.org/book/announcements
				
http://www.cincomsmalltalk.com/userblogs/vbykov/blogView?searchCategory=Announcements%20Framework

http://www.cincomsmalltalk.com/userblogs/vbykov/blogView?entry=3310034894

http://dougedmunds.com/pmwiki.php?n=Pharo.AnnouncementsTutorial
'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
AnnouncementsHelp class>>pages [
	^#(introduction AnnouncementsTutorial AnnouncementsAPIDocumentation links)
]
