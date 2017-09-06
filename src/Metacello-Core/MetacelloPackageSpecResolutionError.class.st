"

"
Class {
	#name : #MetacelloPackageSpecResolutionError,
	#superclass : #Error,
	#instVars : [
		'packageSpec',
		'repositories',
		'repositoryError'
	],
	#category : #Metacello-Core-Exceptions-Errors,
	#timestamp : ''
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloPackageSpecResolutionError>>description [
    "Return a textual description of the exception."

    ^ 'Could not resolve: ' , packageSpec name , ' [' , packageSpec file , ']' , ' in' , self repositoryString
        ,
            (repositoryError == nil
                ifTrue: [ '' ]
                ifFalse: [ 
                    "report repository error to user here, since failure here is likely to be due to earlier repository error"
                    ' ERROR: ' , repositoryError description printString ])
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloPackageSpecResolutionError>>packageSpec [
	^ packageSpec
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloPackageSpecResolutionError>>packageSpec: anObject [
	packageSpec := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloPackageSpecResolutionError>>repositories [
	^ repositories
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloPackageSpecResolutionError>>repositories: anObject [
	repositories := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloPackageSpecResolutionError>>repositoryError [
	^ repositoryError
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloPackageSpecResolutionError>>repositoryError: anObject [
	repositoryError := anObject
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloPackageSpecResolutionError>>repositoryString [
    | repositoryString |
    repositoryString := ''.
    self repositories do: [ :repo | repositoryString := repositoryString , ' ' , repo description ].
    ^ repositoryString
]

{
	#category : #Signaling,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloPackageSpecResolutionError>>signal [
  "GemStone needs this to print exception correctly"

  self messageText: self description.
  ^ super signal
]
