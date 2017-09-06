"
I am ZnByteStringBecameWideString, a resumable Error signalled to indicate that some byteString was changed to a wideString.

Used by ZnUTF8Encoder>>#readInto:startingAt:count:fromStream: to avoid a #becomeForward: when a ByteString automagically changes into a WideString.

Part of Zinc HTTP Components.
"
Class {
	#name : #ZnByteStringBecameWideString,
	#superclass : #Error,
	#instVars : [
		'byteString',
		'wideString'
	],
	#category : #Zinc-Character-Encoding-Core,
	#timestamp : '<historical>'
}

{
	#category : #convenience,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnByteStringBecameWideString class>>convert: byteString [
	"Convert byteString to a wideString, signalling a resumable error"
	
	| wideString |
	wideString := WideString from: byteString.
	self new
		byteString: byteString;
		wideString: wideString;
		signal.
	^ wideString
]

{
	#category : #convenience,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnByteStringBecameWideString>>becomeForward [
	"Switch the identities of byteString and wideString using #becomeForward:"

	byteString becomeForward: wideString 
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnByteStringBecameWideString>>byteString [
	^ byteString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnByteStringBecameWideString>>byteString: anObject [
	byteString := anObject
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnByteStringBecameWideString>>isResumable [
	^ true
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnByteStringBecameWideString>>wideString [
	^ wideString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:51'
}
ZnByteStringBecameWideString>>wideString: anObject [
	wideString := anObject
]
