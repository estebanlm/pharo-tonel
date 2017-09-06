"
Notify that a method can not be decompiled because of a native boost call
"
Class {
	#name : #CannotDecompileNativeBoostCalls,
	#superclass : #Exception,
	#category : #Flashback-Decompiler,
	#timestamp : 'KevinLanvin 7/21/2015 13:35'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:28'
}
CannotDecompileNativeBoostCalls>>defaultAction [
	UnhandledError signalForException: self
]
