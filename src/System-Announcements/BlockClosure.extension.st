Extension {
	#name : #BlockClosure
}

{
	#category : #'*system-announcements',
	#timestamp : ' 8/31/2017 07:17:00'
}
BlockClosure>>valueWithoutNotifications  [
	^SystemAnnouncer uniqueInstance suspendAllWhile: self
]
