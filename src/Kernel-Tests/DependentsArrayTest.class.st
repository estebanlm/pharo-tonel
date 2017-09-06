"

"
Class {
	#name : #DependentsArrayTest,
	#superclass : #TestCase,
	#category : #Kernel-Tests-Objects,
	#timestamp : ''
}

{
	#category : #test,
	#timestamp : ' 8/31/2017 05:26:30'
}
DependentsArrayTest>>testSize [

	self 
		assert: (DependentsArray with: nil) size = 0;
		assert: (DependentsArray with: nil with: 1 with: nil) size = 1;
		assert: (DependentsArray with: 1 with: 3) size = 2;
		assert: (DependentsArray with: nil with: nil with: nil) size = 0
]
