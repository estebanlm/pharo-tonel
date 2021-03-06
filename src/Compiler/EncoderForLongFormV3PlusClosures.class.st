"
An encoder for the V3 bytecode set augmented with the following bytecodes that are part of the full closure implementation.
	138   10001010 jkkkkkkk		Push (Array new: kkkkkkk) (j = 0)
								or	Pop kkkkkkk elements into: (Array new: kkkkkkk) (j = 1)

	140   10001100 kkkkkkkk jjjjjjjj 	Push Temp At kkkkkkkk In Temp Vector At: jjjjjjjj
	141   10001101 kkkkkkkk jjjjjjjj 	Store Temp At kkkkkkkk In Temp Vector At: jjjjjjjj
	142   10001110 kkkkkkkk jjjjjjjj 	Pop and Store Temp At kkkkkkkk In Temp Vector At: jjjjjjjj
	143   10001111 llllkkkk jjjjjjjj iiiiiiii	Push Closure Num Copied llll Num Args kkkk BlockSize jjjjjjjjiiiiiiii
This is an exact duplicate of EncoderForV3PlusClosures.
Could be a trait (or in Newspeak, a Mixin).
For now we impose upon you to synchronise any and all changes between these two classes.
"
Class {
	#name : #EncoderForLongFormV3PlusClosures,
	#superclass : #EncoderForLongFormV3,
	#category : #Compiler-Kernel
}

{ #category : #'bytecode generation' }
EncoderForLongFormV3PlusClosures >> genPushClosureCopyNumCopiedValues: numCopied numArgs: numArgs jumpSize: jumpSize [
	"143 	10001111 llllkkkk jjjjjjjj iiiiiiii	Push Closure Num Copied llll Num Args kkkk BlockSize jjjjjjjjiiiiiiii"
	(jumpSize < 0 or: [jumpSize > 65535]) ifTrue:
		[^self outOfRangeError: 'block size' index: jumpSize range: 0 to: 65535].
	(numCopied < 0 or: [numCopied > 15]) ifTrue:
		[^self outOfRangeError: 'num copied' index: numCopied range: 0 to: 15].
	(numArgs < 0 or: [numArgs > 15]) ifTrue:
		[^self outOfRangeError: 'num args' index: numArgs range: 0 to: 15].
	stream
		nextPut: 143;
		nextPut: numArgs + (numCopied bitShift: 4);
		nextPut: (jumpSize bitShift: -8);
		nextPut: (jumpSize bitAnd: 16rFF)
]

{ #category : #'bytecode generation' }
EncoderForLongFormV3PlusClosures >> genPushConsArray: size [
	(size < 0 or: [size > 127]) ifTrue:
		[^self outOfRangeError: 'numElements' index: size range: 0 to: 127].
	"138 	10001010 1kkkkkkk 	Pop kkkkkkk into: (Array new: kkkkkkk)"
	stream
		nextPut: 138;
		nextPut: size + 128
]

{ #category : #'bytecode generation' }
EncoderForLongFormV3PlusClosures >> genPushNewArray: size [
	(size < 0 or: [size > 127]) ifTrue:
		[^self outOfRangeError: 'size' index: size range: 0 to: 127].
	"138 	10001010 0kkkkkkk 	Push (Array new: kkkkkkk)"
	stream
		nextPut: 138;
		nextPut: size
]

{ #category : #'bytecode generation' }
EncoderForLongFormV3PlusClosures >> genPushRemoteTemp: tempIndex inVectorAt: tempVectorIndex [
	(tempIndex >= 0 and: [tempIndex < 256
	 and: [tempVectorIndex >= 0 and: [tempVectorIndex < 256]]]) ifTrue:
		["140 	10001100 kkkkkkkk jjjjjjjj 	Push Temp At kkkkkkkk In Temp Vector At: jjjjjjjj"
		 stream
			nextPut: 140;
			nextPut: tempIndex;
			nextPut: tempVectorIndex.
		 ^self].
	tempIndex >= 256 ifTrue:
		[^self outOfRangeError: 'remoteTempIndex' index: tempIndex range: 0 to: 255].
	tempVectorIndex >= 256 ifTrue:
		[^self outOfRangeError: 'tempVectorIndex' index: tempVectorIndex range: 0 to: 255]
]

{ #category : #'bytecode generation' }
EncoderForLongFormV3PlusClosures >> genStorePopRemoteTemp: tempIndex inVectorAt: tempVectorIndex [
	"142 	10001110 kkkkkkkk jjjjjjjj 	Pop and Store Temp At kkkkkkkk In Temp Vector At: jjjjjjjj"
	(tempIndex >= 0 and: [tempIndex < 256
	 and: [tempVectorIndex >= 0 and: [tempVectorIndex < 256]]]) ifTrue:
		[stream
			nextPut: 142;
			nextPut: tempIndex;
			nextPut: tempVectorIndex.
		 ^self].
	tempIndex >= 256 ifTrue:
		[^self outOfRangeError: 'remoteTempIndex' index: tempIndex range: 0 to: 255].
	tempVectorIndex >= 256 ifTrue:
		[^self outOfRangeError: 'tempVectorIndex' index: tempVectorIndex range: 0 to: 255]
]

{ #category : #'bytecode generation' }
EncoderForLongFormV3PlusClosures >> genStoreRemoteTemp: tempIndex inVectorAt: tempVectorIndex [
	"141 	10001101 kkkkkkkk jjjjjjjj 	Store Temp At kkkkkkkk In Temp Vector At: jjjjjjjj"
	(tempIndex >= 0 and: [tempIndex < 256
	 and: [tempVectorIndex >= 0 and: [tempVectorIndex < 256]]]) ifTrue:
		[stream
			nextPut: 141;
			nextPut: tempIndex;
			nextPut: tempVectorIndex.
		 ^self].
	tempIndex >= 256 ifTrue:
		[^self outOfRangeError: 'remoteTempIndex' index: tempIndex range: 0 to: 255].
	tempVectorIndex >= 256 ifTrue:
		[^self outOfRangeError: 'tempVectorIndex' index: tempVectorIndex range: 0 to: 255]
]

{ #category : #testing }
EncoderForLongFormV3PlusClosures >> supportsClosureOpcodes [
	^true
]
