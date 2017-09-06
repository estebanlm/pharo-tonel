"
A GTEventBundleTest is a test class for testing the behavior of GTEventBundle
"
Class {
	#name : #GTEventBundleTest,
	#superclass : #TestCase,
	#instVars : [
		'bundle',
		'data',
		'category',
		'url',
		'entity'
	],
	#category : #GT-EventRecorder-Tests-Support,
	#timestamp : '<historical>'
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTEventBundleTest>>setUp [
	super setUp.
	bundle := GTEventBundle new.
	data := #[1 2 3 4].
	category := #category1.
	url := 'http://localhost/gt/events' asZnUrl.
	
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTEventBundleTest>>testData [
	"It is really important that it is the same object."
	bundle data: data.
	self assert: bundle data == bundle data.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTEventBundleTest>>testEntity [
	bundle data: data.
	entity := bundle entity.
	self assert: (entity isKindOf: ZnByteArrayEntity).
	self assert: entity bytes equals: data.
]
