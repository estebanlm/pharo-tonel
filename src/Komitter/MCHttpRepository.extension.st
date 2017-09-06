Extension {
	#name : #MCHttpRepository
}

{
	#category : #'*Komitter-Models',
	#timestamp : ' 8/31/2017 05:26:22'
}
MCHttpRepository>>isPrivatePharoRepository [
	
	^ self class pharoLocations includes: self location
]

{
	#category : #'*Komitter-Models',
	#timestamp : ' 8/31/2017 05:26:22'
}
MCHttpRepository>>isRemote [
	^ self isPrivatePharoRepository not
]

{
	#category : #'*Komitter-Models',
	#timestamp : ' 8/31/2017 05:26:22'
}
MCHttpRepository>>koRemote [

	^ KomitHttpRemote new
		remote: self;
		yourself
]

{
	#category : #'*Komitter-Models',
	#timestamp : ' 8/31/2017 05:26:22'
}
MCHttpRepository class>>pharoLocations [
	"Answer the locations for both pharo and pharo inbox repositories.
	No commit should actually be pushed directly there"

	^ #('http://smalltalkhub.com/mc/Pharo/Pharo60/main' 
		'http://smalltalkhub.com/mc/Pharo/Pharo60/main/' 
		'http://smalltalkhub.com/mc/Pharo/Pharo60Inbox/main'
		'http://smalltalkhub.com/mc/Pharo/Pharo60Inbox/main/'
		'http://smalltalkhub.com/mc/Pharo/Pharo50Inbox/main'
		'http://smalltalkhub.com/mc/Pharo/Pharo50Inbox/main/')
]
