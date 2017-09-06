"
I store meta-data for a package assembly. I'm the common superclass of all package assemblies.
"
Class {
	#name : #AssemblyManifest,
	#superclass : #Object,
	#category : #Kernel,
	#timestamp : 'ChristopheDemarey 2/13/2015 11:40'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
AssemblyManifest class>>description [
	^ self name , ' description'
]

{
	#category : #'compatibility - package manifest',
	#timestamp : ' 8/31/2017 07:16:33'
}
AssemblyManifest class>>ignoredDependencies [
	^ #()
]

{
	#category : #default,
	#timestamp : ' 8/31/2017 07:16:33'
}
AssemblyManifest class>>manifestClassComment [
	^ 'I store metadata for this package assembly.'
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:33'
}
AssemblyManifest class>>newNamed: aString category: aCategoryName [
	| assemblyClass |
	assemblyClass := self subclass: aString asSymbol
			instanceVariableNames: ''
			classVariableNames: ''
			poolDictionaries: ''
			category: aCategoryName.
	assemblyClass comment: self manifestClassComment.
	^ assemblyClass
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
AssemblyManifest class>>packageName [
	self shouldBeImplemented
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
AssemblyManifest class>>parts [
	^ #()
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:33'
}
AssemblyManifest class>>version [
	^ '0.1-dev'
]
