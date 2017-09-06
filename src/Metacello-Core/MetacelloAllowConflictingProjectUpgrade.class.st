"

"
Class {
	#name : #MetacelloAllowConflictingProjectUpgrade,
	#superclass : #MetacelloResolveProjectUpgrade,
	#category : #Metacello-Core-Scripts,
	#timestamp : ''
}

{
	#category : #'exception handling',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAllowConflictingProjectUpgrade>>defaultAction [
  self existingProjectRegistration locked
    ifTrue: [ 
      "https://github.com/dalehenrich/metacello-work/issues/263"
      ^ self useIncoming ].
  ^ MetacelloConflictingProjectError
    signal:
      'Load Conflict between existing ' , self existingProjectRegistration printString
        , ' and ' , self newProjectRegistration printString
]

{
	#category : #handlers,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAllowConflictingProjectUpgrade>>handleResolutionFor: aScriptEngine [
    ^ aScriptEngine handleConflict: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAllowConflictingProjectUpgrade>>operationString [
  ^ 'load with conflicts'
]
