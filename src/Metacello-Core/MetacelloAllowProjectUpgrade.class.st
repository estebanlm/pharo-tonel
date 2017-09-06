"

"
Class {
	#name : #MetacelloAllowProjectUpgrade,
	#superclass : #MetacelloResolveProjectUpgrade,
	#category : #Metacello-Core-Scripts,
	#timestamp : ''
}

{
	#category : #'exception handling',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAllowProjectUpgrade>>defaultAction [
    "Default for Upgrade is to allow"

    self checkAllowed.
    ^ self newProjectRegistration
]

{
	#category : #handlers,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAllowProjectUpgrade>>handleOnDownGrade: onDownGradeBlock onUpgrade: onUpgradeBlock [
    ^ onUpgradeBlock cull: self cull: self existingProjectRegistration cull: self newProjectRegistration
]

{
	#category : #handlers,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAllowProjectUpgrade>>handleResolutionFor: aScriptEngine [
    ^ aScriptEngine handleUpgrade: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAllowProjectUpgrade>>operationString [
  ^ 'upgrade to'
]
