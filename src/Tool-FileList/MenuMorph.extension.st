Extension {
	#name : #MenuMorph
}

{
	#category : #'*Tool-FileList',
	#timestamp : ' 8/31/2017 05:26:25'
}
MenuMorph>>addService: aService for: serviceUser [
	"Append a menu item with the given service. If the item is selected, it will perform the given service."

	aService addServiceFor: serviceUser toMenu: self.
]

{
	#category : #'*Tool-FileList',
	#timestamp : ' 8/31/2017 05:26:25'
}
MenuMorph>>addServices: services for: served extraLines: linesArray [

	services withIndexDo: [:service :i |
		self 
		addService: service for: served;
		balloonTextForLastItem: service description.
		(service usingLineAfter or: [linesArray includes: i]) 
			ifTrue: [ self addLine ]
	].

]
