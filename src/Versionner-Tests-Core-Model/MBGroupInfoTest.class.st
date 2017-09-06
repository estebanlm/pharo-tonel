"
SUnit tests for MBGroupInfo in Versionner
"
Class {
	#name : #MBGroupInfoTest,
	#superclass : #MBSpecInfoTest,
	#category : #Versionner-Tests-Core-Model,
	#timestamp : 'TorstenBergmann 2/20/2014 14:17'
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBGroupInfoTest>>testPrintOn [
	| str | 
	self shouldnt: [str := MBGroupInfo new printString] raise: Error.
	self assert: (str = 'nil ---').
	

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:38'
}
MBGroupInfoTest>>testgroupContentsIfLoaded [

	self assert: MBGroupInfo new groupContentsIfLoaded isEmpty
]
