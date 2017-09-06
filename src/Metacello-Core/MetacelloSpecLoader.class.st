"

"
Class {
	#name : #MetacelloSpecLoader,
	#superclass : #Object,
	#instVars : [
		'spec'
	],
	#category : #Metacello-Core-Loaders,
	#timestamp : ''
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloSpecLoader class>>on: aMetacelloPackagesSpec [

	^(self new) 
		spec: aMetacelloPackagesSpec;
		yourself
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloSpecLoader>>load [

	self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloSpecLoader>>loadType [
	"#atomic or #linear"
	
	^self project loadType
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloSpecLoader>>project [

	^self spec project
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloSpecLoader>>spec [

	^spec
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloSpecLoader>>spec: aMetacelloPackagesSpec [

	spec := aMetacelloPackagesSpec
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloSpecLoader>>unload [

	self subclassResponsibility
]
