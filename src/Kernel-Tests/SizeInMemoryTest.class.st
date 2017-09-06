"
SUnit tests for the size of objects in memory
"
Class {
	#name : #SizeInMemoryTest,
	#superclass : #TestCase,
	#category : #Kernel-Tests-Objects,
	#timestamp : 'TorstenBergmann 2/5/2014 08:44'
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
SizeInMemoryTest>>testSizeInMemoryCompactClasses [
	self skip.
	"One word for the header + one word per instance variable"
	self assert:  (Association key: 'aKey' value: 23) sizeInMemory = 12.

	"One word for the header + one word per instance variable"
	self assert:  Rectangle new sizeInMemory = 12.


]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
SizeInMemoryTest>>testSizeInMemoryLargeInstances [
	"Two words for the object header + a world per instance variable"

	self assert: Smalltalk allClasses sizeInMemory = 20.
	self
		assert:
			Smalltalk allClasses asArray sizeInMemory
				= (Smalltalk wordSize * 3 + (Smalltalk allClasses asArray size * Smalltalk wordSize))
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
SizeInMemoryTest>>testSizeInMemoryNormalClasses [
	"Two word for the header + one word per instance variable"
	self assert: Date today sizeInMemory = 16.

	"Two word for the header + one word per instance variable"
	self assert: TestCase new sizeInMemory = 16.




]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
SizeInMemoryTest>>testSizeInMemoryOfByteObjects [
	"Byte objects should be padded to words"
	self assert: 'a' sizeInMemory equals: 12.
	self assert: 'abcd' sizeInMemory equals: 12.
	self assert: '' sizeInMemory equals: 8.
	self assert: 'abcde' sizeInMemory equals: 16.
	self assert: 'abcdefghi' sizeInMemory equals: 20.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
SizeInMemoryTest>>testSizeInMemoryOfCharacters [
	self assert: 0 asCharacter sizeInMemory isZero.
	self assert: 255 asCharacter sizeInMemory isZero.
	self assert: 256 asCharacter sizeInMemory isZero.
	self assert: 16r10FFFF asCharacter sizeInMemory isZero
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:30'
}
SizeInMemoryTest>>testSizeInMemorySmallIntegers [
	self assert: SmallInteger minVal sizeInMemory isZero.
	self assert: 0 sizeInMemory isZero.
	self assert: SmallInteger maxVal sizeInMemory isZero.
	self assert: (SmallInteger minVal - 1) sizeInMemory > 0.
	self assert: (SmallInteger maxVal + 1) sizeInMemory > 0
]
