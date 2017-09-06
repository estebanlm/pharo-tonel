"
I encapsulate a gemstone repository
"
Class {
	#name : #KomitHttpRemote,
	#superclass : #KomitRemote,
	#category : #Komitter-Models,
	#timestamp : '<historical>'
}

{
	#category : #'*Komitter-UI',
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitHttpRemote>>icon [

	^ 'HTTP'
]

{
	#category : #'*Komitter-UI',
	#timestamp : ' 8/31/2017 05:26:22'
}
KomitHttpRemote>>label [
	
	^ self remote location
]
