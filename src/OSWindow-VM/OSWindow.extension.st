Extension {
	#name : #OSWindow
}

{
	#category : #'*OSWindow-VM',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindow class>>resetVMWindow [
	"self resetVMWindow"
	VMWindow := nil.
	

]

{
	#category : #'*OSWindow-VM',
	#timestamp : ' 8/31/2017 05:26:40'
}
OSWindow class>>vmWindow [
	| attributes |
	^ VMWindow ifNil: [ 
		attributes := OSWindowAttributes new.
		attributes preferableDriver: VMWindowDriver new.
		attributes extent: 640@480.
		VMWindow := OSWindow createWithAttributes: attributes
	] 
]
