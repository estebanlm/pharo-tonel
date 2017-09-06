"
I am a special layout version for CompiledMethods. 
Unlike default Object layouts, CompiledMethods define a custom format integer since they mix bytes and pointer types.

See CompiledMethod for more details.
"
Class {
	#name : #CompiledMethodLayout,
	#superclass : #ObjectLayout,
	#category : #Slot-Layout,
	#timestamp : '<historical>'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:35'
}
CompiledMethodLayout class>>extending: superLayout scope: aScope host: aClass [
	^ superLayout extendCompiledMethod
		host: aClass;
		yourself
]

{
	#category : #format,
	#timestamp : ' 8/31/2017 07:16:35'
}
CompiledMethodLayout>>instanceSpecification [
	 ^ 24
]
