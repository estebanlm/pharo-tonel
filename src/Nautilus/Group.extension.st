Extension {
	#name : #Group
}

{
	#category : #'*Nautilus',
	#timestamp : ' 8/31/2017 05:26:22'
}
Group>>asNautilusItemPath [
	^ Array with: self name
]

{
	#category : #'*Nautilus',
	#timestamp : ' 8/31/2017 05:26:22'
}
Group>>asNautilusSelection [
	^ PackageTreeGroupSelection group: self
]

{
	#category : #'*Nautilus',
	#timestamp : ' 8/31/2017 05:26:22'
}
Group>>restrict: anEnvironment [
	^ anEnvironment forClasses: self classes
]
