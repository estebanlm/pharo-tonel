"

"
Class {
	#name : #MetacelloAllowLockedProjectChange,
	#superclass : #MetacelloResolveProjectUpgrade,
	#instVars : [
		'operationString'
	],
	#category : #Metacello-Core-Scripts,
	#timestamp : ''
}

{
	#category : #'exception handling',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAllowLockedProjectChange>>break [
  ^ self allow
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAllowLockedProjectChange>>checkAllowed [
  "noop ... if user decided to allow lock to be broken, then so be it"
]

{
	#category : #'exception handling',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAllowLockedProjectChange>>defaultAction [
  Warning
    signal:
      'LOCK ENFORCED: Attempt to ' , self operationString printString
        , ' new project: ' , self newProjectRegistration printString printString
        , ' when existing project: '
        , self existingProjectRegistration printString printString
        , ' is locked. New project not loaded. Use #onLock: to intercept.'.
  ^ self disallow
]

{
	#category : #handlers,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAllowLockedProjectChange>>handleResolutionFor: aScriptEngine [
  ^ aScriptEngine handleLock: self
]

{
	#category : #'exception handling',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAllowLockedProjectChange>>honor [
  ^ self disallow
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAllowLockedProjectChange>>operationString [
  ^ operationString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAllowLockedProjectChange>>operationString: aString [
  operationString := aString
]
