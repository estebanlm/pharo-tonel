Extension {
	#name : #DefaultExternalDropHandler
}

{
	#category : #'*Morphic-Base',
	#timestamp : ' 8/31/2017 05:26:13'
}
DefaultExternalDropHandler>>handle: dropStream in: pasteUp dropEvent: anEvent  [
	"the file was just droped, let's do our job"
	| fileName services theOne |
	fileName := dropStream name.
	services := self servicesForFileNamed: fileName.

	"no service, default behavior"
	services isEmpty ifTrue: [
			dropStream edit.
			^ self].
	theOne := self chooseServiceFrom: services.
	theOne ifNotNil: [theOne performServiceFor: dropStream]
]
