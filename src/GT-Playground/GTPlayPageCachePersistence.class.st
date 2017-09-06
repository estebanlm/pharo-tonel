"

"
Class {
	#name : #GTPlayPageCachePersistence,
	#superclass : #GTPlayPageFilePersistence,
	#category : #GT-Playground,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlayPageCachePersistence>>fileDirectory [
	^ GTPlayBook cacheDirectory
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:36'
}
GTPlayPageCachePersistence>>fileName [
	^ self page creationTimeForFileName, '.' , GTPlayPage fileExtension
]
