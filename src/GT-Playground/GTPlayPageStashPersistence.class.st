"

"
Class {
	#name : #GTPlayPageStashPersistence,
	#superclass : #GTPlayPageFilePersistence,
	#category : #GT-Playground,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlayPageStashPersistence>>fileDirectory [
	^ GTPlayBook stashDirectory
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlayPageStashPersistence>>fileName [
	^ self page title, '-', self page creationTimeForFileName, '.', GTPlayPage fileExtension
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlayPageStashPersistence>>isStash [
	^ true
]
