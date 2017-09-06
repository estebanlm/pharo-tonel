"
An explicit subclass of MCHttpRepository to provide a template for gemstone repositories.
"
Class {
	#name : #MCGemstoneRepository,
	#superclass : #MCHttpRepository,
	#category : #MonticelloRemoteRepositories,
	#timestamp : 'CamilloBruni 2/8/2012 18:10'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:56'
}
MCGemstoneRepository class>>baseURL [
	^ 'http://ss3.gemtalksystems.com/ss/'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:56'
}
MCGemstoneRepository class>>description [
	^ 'ss3.gemstone.com'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:56'
}
MCGemstoneRepository class>>isResponsibleFor: aUrl [
	^ (aUrl includesSubstring: 'ss3.gemstone.com/') or: [  aUrl includesSubstring: 'ss3.gemtalksystems.com/' ]
]

{
	#category : #interface,
	#timestamp : ' 8/31/2017 07:16:56'
}
MCGemstoneRepository>>includesVersionNamed: aString [
	"directly do a filename check since squeaksource only stores mcz"
	^ self includesFileNamed: aString, '.mcz'
]
