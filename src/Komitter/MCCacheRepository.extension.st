Extension {
	#name : #MCCacheRepository
}

{
	#category : #'*Komitter-Models',
	#timestamp : ' 8/31/2017 05:26:22'
}
MCCacheRepository>>isCache [
	"This is a bit hackish but we want to exclude the package cache which does not seem to be instance of a dedicated class"
	
	^ (self description includesSubstring: 'package-cache')
]
