"
I am a dummy object used to commit code in a new slice
"
Class {
	#name : #KomitNewSlice,
	#superclass : #KomitRemote,
	#category : #Komitter-Models,
	#timestamp : '<historical>'
}

{
	#category : #'*Komitter-UI',
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitNewSlice>>icon [
	^ self iconNamed: #komitterNewSlice
]

{
	#category : #'*Komitter-UI',
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitNewSlice>>komitOn: aKomitterUI [

	^ aKomitterUI newSliceFor: self
]

{
	#category : #'*Komitter-UI',
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitNewSlice>>label [

	^ 'New Slice'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitNewSlice>>remote [
	
	^ MCRepositoryGroup default repositories 
		detect: [ :e | e description = 'http://smalltalkhub.com/mc/Pharo/Pharo50Inbox/main/' ]
		ifNone: [ MCRepositoryGroup default repositories detect: [ :e | e description = 'http://smalltalkhub.com/mc/Pharo/Pharo50Inbox/main' ] ]
]
