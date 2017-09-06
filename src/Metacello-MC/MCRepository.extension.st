Extension {
	#name : #MCRepository
}

{
	#category : #'*metacello-mc',
	#timestamp : ' 8/31/2017 07:16:20'
}
MCRepository>>asRepositorySpecFor: aMetacelloMCProject [

	self subclassResponsibility
]

{
	#category : #'*metacello-mc',
	#timestamp : ' 8/31/2017 07:16:20'
}
MCRepository>>metacelloProjectClassFor: aScriptEngine [
    ^ MetacelloMCProject
]

{
	#category : #'*metacello-mc',
	#timestamp : ' 8/31/2017 07:16:20'
}
MCRepository>>projectVersion: aString [
    "noop"
]
