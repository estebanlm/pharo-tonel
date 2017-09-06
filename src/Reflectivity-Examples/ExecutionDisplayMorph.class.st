"
Inidicator morph for the Nautilus plugin ExecutionDisplayPlugin.
I change my color on invokation of the registered method.

My color (the execution indicator) fades away over time.
"
Class {
	#name : #ExecutionDisplayMorph,
	#superclass : #BorderedMorph,
	#category : #Reflectivity-Examples,
	#timestamp : 'NicolaiHess 11/20/2016 22:10'
}

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:45'
}
ExecutionDisplayMorph>>nextAlphaStep [
	^ 0.0 max: self color alpha - 0.15
]

{
	#category : #'meta link action',
	#timestamp : ' 8/31/2017 05:26:45'
}
ExecutionDisplayMorph>>noteExecuted [
	self color: Color red.
]

{
	#category : #'stepping and presenter',
	#timestamp : ' 8/31/2017 05:26:45'
}
ExecutionDisplayMorph>>step [
	self color: (self color alpha: self nextAlphaStep)
]

{
	#category : #'model - stepping',
	#timestamp : ' 8/31/2017 05:26:45'
}
ExecutionDisplayMorph>>stepTime [
	^ 200
]

{
	#category : #'stepping and presenter',
	#timestamp : ' 8/31/2017 05:26:45'
}
ExecutionDisplayMorph>>wantsSteps [
	^ true
]
