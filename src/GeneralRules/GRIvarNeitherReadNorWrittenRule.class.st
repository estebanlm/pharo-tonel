"
This smell arises when an instance variable is not both read and written. If an instance variable is only read, the reads can be replaced by nil, since it could not have been assigned a value. If the variable is only written, then it does not need to store the result since it is never used. This check does not work for the data model classes since they use the #instVarAt:put: messages to set instance variables.
"
Class {
	#name : #GRIvarNeitherReadNorWrittenRule,
	#superclass : #ReAbstractRule,
	#category : #GeneralRules,
	#timestamp : 'YuriyTymchuk 1/12/2017 08:45'
}

{
	#category : #testing-interest,
	#timestamp : ' 8/31/2017 05:26:41'
}
GRIvarNeitherReadNorWrittenRule class>>checksClass [
	^ true
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 05:26:41'
}
GRIvarNeitherReadNorWrittenRule>>check: aClass forCritiquesDo: aCriticBlock [
	| methods |
	
	methods := aClass withAllSubclasses flatCollect: #methods.
	
	aClass slots
		select: [ :slot |
			| read written |
			read := written := false.
			methods noneSatisfy: [ :method |
				read := read or: [ method readsSlot: slot ].
				written := written or: [ method writesSlot: slot ].
				read and: [ written ] ] ]
		thenDo: [ :slot |
			aCriticBlock cull:
				(self critiqueFor: aClass about: slot) ]
]

{
	#category : #enumerating,
	#timestamp : ' 8/31/2017 05:26:41'
}
GRIvarNeitherReadNorWrittenRule>>critiqueFor: aClass about: aSlot [
	| crit |
	crit := ReTrivialCritique
		withAnchor: (ReVarSearchSourceAnchor
			entity: aClass
			string: aSlot name)
		by: self.
	
	crit tinyHint: aSlot name.
	^ crit
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:41'
}
GRIvarNeitherReadNorWrittenRule>>name [

	^ 'Instance variable not read or not written'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:41'
}
GRIvarNeitherReadNorWrittenRule>>severity [
	^ #information
]
