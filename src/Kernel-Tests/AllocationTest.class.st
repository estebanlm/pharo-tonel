"
Test originally from Andreas Raab
"
Class {
	#name : #AllocationTest,
	#superclass : #TestCase,
	#category : #Kernel-Tests-Exception,
	#timestamp : 'StephaneDucasse 12/18/2009 12:03'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:30'
}
AllocationTest>>testOneGigAllocation [
	"Documentating a weird bug in the allocator"
	
	| sz array failed |
	failed := false.
	sz := 1024*1024*1024.
	array := [Array new: sz] on: OutOfMemory do: [:ex| failed := true].
	self assert: (failed or:[array size = sz]).
	
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:30'
}
AllocationTest>>testOneMegAllocation [
	"Documentating a weird bug in the allocator"
	
	| sz array failed |
	failed := false.
	sz := 1024*1024.
	array := [Array new: sz] on: OutOfMemory do: [:ex| failed := true].
	self assert: (failed or:[array size = sz]).
	
]
