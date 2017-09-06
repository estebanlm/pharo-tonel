"

"
Class {
	#name : #MetacelloSpecTestCase,
	#superclass : #TestCase,
	#category : #Metacello-TestsCore-Specs,
	#timestamp : ''
}

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloSpecTestCase>>groupSpec [
    ^ self project groupSpec
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloSpecTestCase>>packagesSpec [
    ^ self project packagesSpec
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloSpecTestCase>>project [
    ^ self projectWith: #()
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloSpecTestCase>>projectClass [
    ^ MetacelloProject
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloSpecTestCase>>projectReferenceSpec [
    ^ self project projectReferenceSpec
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloSpecTestCase>>projectSpec [
    ^ self project projectSpec
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloSpecTestCase>>projectWith: projectAttributes [
    | project |
    "Construct Metacello project"
    project := self projectClass new.
    project projectAttributes: projectAttributes.
    MetacelloVersionConstructor on: self project: project.
    project loader: MetacelloNullRecordingMCSpecLoader new.
    ^ project
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloSpecTestCase>>valueHolderSpec [
    ^ self project valueHolderSpec
]

{
	#category : #specs,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloSpecTestCase>>versionSpec [
    ^ self project versionSpec
]
