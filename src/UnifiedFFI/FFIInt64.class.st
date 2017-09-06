"
I'm an signed int type (64bits)
I map to a longlong type. 
"
Class {
	#name : #FFIInt64,
	#superclass : #FFIUInt64,
	#category : #UnifiedFFI-Types,
	#timestamp : '<historical>'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:10'
}
FFIInt64 class>>externalType  [
	^ ExternalType signedLongLong
]
