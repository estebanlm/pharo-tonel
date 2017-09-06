"

"
Class {
	#name : #MetacelloSkipDirtyPackageLoad,
	#superclass : #Notification,
	#instVars : [
		'packageSpec'
	],
	#category : #Metacello-Core-Exceptions-Notifications,
	#timestamp : ''
}

{
	#category : #signalling,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloSkipDirtyPackageLoad class>>signal: aMetacelloPackageSpec [

	^(self new packageSpec: aMetacelloPackageSpec) signal
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloSkipDirtyPackageLoad>>defaultAction [
	"Default action is to skip the load of a dirty package"

	^true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloSkipDirtyPackageLoad>>packageSpec [

	^packageSpec
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloSkipDirtyPackageLoad>>packageSpec: aMetacelloPackageSpec [

	packageSpec := aMetacelloPackageSpec
]
