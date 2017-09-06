"
I'm a platform independent environment who is intent to work when none other works. 
Specially, I'm intended to work as a replacement for environments when there is no NativeBoost present, therefore I provide stubs for method calls that answers just default values. 

"
Class {
	#name : #PlatformIndependentEnvironment,
	#superclass : #OSEnvironment,
	#category : #System-OSEnvironments,
	#timestamp : 'EstebanLorenzano 1/24/2014 16:41'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:17'
}
PlatformIndependentEnvironment class>>isAvailable  [
	^ true
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:17'
}
PlatformIndependentEnvironment class>>isDefaultFor: aPlatform  [
	^ false
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:17'
}
PlatformIndependentEnvironment>>getEnv: aVariableName [
	^ nil
]

{
	#category : #enumeration,
	#timestamp : ' 8/31/2017 05:26:17'
}
PlatformIndependentEnvironment>>keysAndValuesDo: aBlock [
	"Do nothing"
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:17'
}
PlatformIndependentEnvironment>>setEnv: nameString value: valueString [
	"Do nothing"
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:17'
}
PlatformIndependentEnvironment>>unsetEnv: aString [
	^ self setEnv: aString value: nil
]
