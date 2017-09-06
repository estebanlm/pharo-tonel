"

"
Class {
	#name : #MetacelloIgnorePackageLoaded,
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
MetacelloIgnorePackageLoaded class>>signal: aMetacelloPackageSpec [

	^(self new packageSpec: aMetacelloPackageSpec) signal
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloIgnorePackageLoaded>>defaultAction [
  "Default action is to NOT ignore whether or not the package is loaded. 
   Basically allow for package level ignoreImage. "

  ^ false
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloIgnorePackageLoaded>>packageSpec [

   ^packageSpec
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloIgnorePackageLoaded>>packageSpec: anObject [

   packageSpec := anObject
]
