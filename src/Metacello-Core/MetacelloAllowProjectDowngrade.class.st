"

"
Class {
	#name : #MetacelloAllowProjectDowngrade,
	#superclass : #MetacelloResolveProjectUpgrade,
	#category : #Metacello-Core-Scripts,
	#timestamp : ''
}

{
	#category : #'exception handling',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAllowProjectDowngrade>>defaultAction [
  "Default for Downgrade is to disallow, but still should check for locks"

  self checkAllowed.
  ^ super defaultAction
]

{
	#category : #handlers,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAllowProjectDowngrade>>handleOnDownGrade: onDownGradeBlock onUpgrade: onUpgradeBlock [
    ^ onDownGradeBlock cull: self cull: self existingProjectRegistration cull: self newProjectRegistration
]

{
	#category : #handlers,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAllowProjectDowngrade>>handleResolutionFor: aScriptEngine [
    ^ aScriptEngine handleDowngrade: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAllowProjectDowngrade>>operationString [
  ^ 'downgrade to'
]
