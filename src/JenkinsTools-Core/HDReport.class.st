"
A Hudson report
"
Class {
	#name : #HDReport,
	#superclass : #Object,
	#category : #JenkinsTools-Core,
	#timestamp : 'TorstenBergmann 2/12/2014 22:30'
}

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDReport class>>runCategories: aCollectionOfStrings [
	^ aCollectionOfStrings do: [ :each | self runCategory: each ]
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDReport class>>runCategory: aString [
	^ self runClasses: (Smalltalk organization classesInCategory: aString) named: aString
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDReport class>>runClasses: aCollectionOfClasses named: aString [
	self subclassResponsibility
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDReport class>>runPackage: aString [
	self subclassResponsibility
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDReport class>>runPackages: aCollectionOfStrings [
	^ aCollectionOfStrings collect: [ :each | self runPackage: each ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDReport>>convert: aString [
	^ (aString asString 
		copyReplaceAll: (String with: Character cr with: Character lf) with: (String with: Character lf))
		copyReplaceAll: (String with: Character cr) with: (String with: Character lf)
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:09'
}
HDReport>>encode: aString [
	^ ((aString asString 
		copyReplaceAll: '&' with: '&amp;') 
		copyReplaceAll: '"' with: '&quot;') 
		copyReplaceAll: '<' with: '&lt;'
]
