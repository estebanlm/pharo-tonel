Extension {
	#name : #KomitNewSlice
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
