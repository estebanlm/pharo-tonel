"

"
Class {
	#name : #MetacelloResolveProjectUpgrade,
	#superclass : #MetacelloScriptNotification,
	#instVars : [
		'existingProjectRegistration',
		'newProjectRegistration'
	],
	#category : #Metacello-Core-Scripts,
	#timestamp : ''
}

{
	#category : #'exception handling',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloResolveProjectUpgrade>>allow [
    self checkAllowed.
    self resume: self newProjectRegistration
]

{
	#category : #'exception handling',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloResolveProjectUpgrade>>allowEvenIfLocked [
  "for internal ScriptEngine use only. from the Scripting API use:
		onLocked: [:ex | ex allow]
		"

  self resume: self newProjectRegistration
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloResolveProjectUpgrade>>checkAllowed [
  self existingProjectRegistration locked
    ifTrue: [ 
      self
        resume:
          (MetacelloAllowLockedProjectChange new
            operationString: self operationString;
            existingProjectRegistration: self existingProjectRegistration;
            newProjectRegistration: self newProjectRegistration;
            signal) ]
]

{
	#category : #'exception handling',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloResolveProjectUpgrade>>defaultAction [
    "Result of signal should be the projectRegistration to be used to perform the load ... default is to disallow"

    ^ self existingProjectRegistration
]

{
	#category : #'exception handling',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloResolveProjectUpgrade>>disallow [
    "default action"

    self resume: self existingProjectRegistration
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloResolveProjectUpgrade>>existingProjectRegistration [
	^ existingProjectRegistration
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloResolveProjectUpgrade>>existingProjectRegistration: anObject [
	existingProjectRegistration := anObject
]

{
	#category : #handlers,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloResolveProjectUpgrade>>handleOnDownGrade: onDownGradeBlock onUpgrade: onUpgradeBlock [
    self subclassResponsibility
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloResolveProjectUpgrade>>newProjectRegistration [
	^ newProjectRegistration
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloResolveProjectUpgrade>>newProjectRegistration: anObject [
	newProjectRegistration := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloResolveProjectUpgrade>>operationString [
    self subclassResponsibility
]

{
	#category : #'exception handling',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloResolveProjectUpgrade>>useExisting [
  "to be deprecated: useLoaded"

  self disallow
]

{
	#category : #'exception handling',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloResolveProjectUpgrade>>useIncoming [
  self allow
]

{
	#category : #'exception handling',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloResolveProjectUpgrade>>useLoaded [
  self disallow
]

{
	#category : #'exception handling',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloResolveProjectUpgrade>>useNew [
  "to be deprecated: useIncoming"

  self allow
]
