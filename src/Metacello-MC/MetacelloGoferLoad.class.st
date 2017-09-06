"

"
Class {
	#name : #MetacelloGoferLoad,
	#superclass : #GoferLoad,
	#category : #Metacello-MC-Gofer,
	#timestamp : ''
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloGoferLoad>>updateCategories [
	MetacelloPlatform current bypassGoferLoadUpdateCategories
		ifFalse: [ super updateCategories ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloGoferLoad>>updateRepositories [
	"Noop for Metacello...done by loader itself"
]
