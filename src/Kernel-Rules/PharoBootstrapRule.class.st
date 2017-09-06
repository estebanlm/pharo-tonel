"
A package from the bootstrap layer (minimal image) is depending on an external package.
"
Class {
	#name : #PharoBootstrapRule,
	#superclass : #ReAbstractRule,
	#classVars : [
		'DependencyChecker'
	],
	#category : #Kernel-Rules,
	#timestamp : 'ChristopheDemarey 9/30/2016 15:31'
}

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:39'
}
PharoBootstrapRule class>>checksPackage [

	^ true
]

{
	#category : #running,
	#timestamp : ' 8/31/2017 05:26:39'
}
PharoBootstrapRule>>basicCheck: aPackage [
	(self bootstrapPackages includes: aPackage packageName)
		ifFalse: [ ^ false "Do not check" ].
	^ self newExternalDependencyExistFor: aPackage
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
PharoBootstrapRule>>bootstrapPackages [
	^ #(
	#'AST-Core'
	#'Announcements-Core'
	#CodeExport
	#CodeImport
	#CodeImportCommandLineHandlers
	#Collections
	#Compression
	#'FileSystem-Core'
	#'FileSystem-Disk'
	#Files
	#Jobs
	#Kernel
	#Monticello
	#'Multilingual-Encodings'
	#'Multilingual-Languages'
	#'Multilingual-TextConversion'
	#'Network-UUID'
	#'OpalCompiler-Core'
	#'Random-Core'
	#'RPackage-Core'
	#'Ring-Core-Containers'
	#'Ring-Core-Kernel'
	#'Ring-Monticello'
	#RingChunkImporter
	#Slot
	#'System-Announcements'
	#'System-BasicCommandLineHandler'
	#'System-Changes'
	#'System-CommandLine'
	#'System-CommandLineHandler'
	#'System-Finalization'
	#'System-Hashing'
	#'System-Localization'
	#'System-Model'
	#'System-Platforms'
	#'System-SessionManager'
	#'System-Sources'
	#'System-Support'
	#Traits
	#Transcript
	#UIManager
	#'Collections-Abstract'
	#'Collections-Arithmetic'
	#'Collections-Native'
	#'Collections-Sequenceable'
	#'Collections-Stack'
	#'Collections-Streams'
	#'Collections-Strings'
	#'Collections-Support'
	#'Collections-Unordered'
	#'Collections-Weak'
	#'Zinc-Character-Encoding-Core'
	#'Zinc-Resource-Meta-Core'
	#'PharoBootstrap-Initialization'
	#NonInteractiveTranscript
	)

]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
PharoBootstrapRule>>collectionsPackages [
	^ (CollectionsAssembly parts collect: #key)
		reject: [ :each | each = #'Collections-Atomic' ]
]

{
	#category : #helpers,
	#timestamp : ' 8/31/2017 05:26:39'
}
PharoBootstrapRule>>critiqueFor: aPackage [

	^ ArchitecturalCritique
		withAnchor: (self anchorFor: aPackage)
		by: self
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 05:26:39'
}
PharoBootstrapRule>>dependencyChecker [
	^ (DependencyChecker ifNil: [ DADependencyChecker ]) new
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
PharoBootstrapRule>>group [

	^ 'Architectural'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:39'
}
PharoBootstrapRule>>name [
	^ 'Illegal dependency of Bootstrap Layer'
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:39'
}
PharoBootstrapRule>>newExternalDependencyExistFor: aPackage [
	"Check if there are new dependencies to a package outside this layer"
	| dependencies newDependencies |
	dependencies := self dependencyChecker dependenciesOf: aPackage packageName.
	newDependencies := dependencies difference: self bootstrapPackages.
	^ newDependencies notEmpty
]
