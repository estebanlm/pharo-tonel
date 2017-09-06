"

"
Class {
	#name : #KomitRemote,
	#superclass : #Model,
	#instVars : [
		'remote'
	],
	#classInstVars : [
		'icon'
	],
	#category : #Komitter-Models,
	#timestamp : ''
}

{
	#category : #'*Komitter-UI',
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitRemote>>icon [

	^ nil
]

{
	#category : #'*Komitter-UI',
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitRemote>>komitOn: aKomitterUI [

	^ aKomitterUI newKomitFor: self
]

{
	#category : #'*Komitter-UI',
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitRemote>>label [

	^ ''
]

{
	#category : #'as yet unclassified ',
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitRemote>>password [
	
	^ self remote password
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitRemote>>password: aString [

	self remote password: aString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitRemote>>remote [
	^ remote
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitRemote>>remote: anObject [
	remote := anObject
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitRemote>>username [
	
	^ self remote user
]

{
	#category : #protocol,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitRemote>>username: aString  [
	
	self remote user: aString
]
