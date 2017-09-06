"
A TrivialCritique with and extended actions to open a dependency browser for ArchitecturalRule
"
Class {
	#name : #ArchitecturalCritique,
	#superclass : #ReTrivialCritique,
	#category : #Kernel-Rules,
	#timestamp : 'YuriyTymchuk 8/8/2016 18:27'
}

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:39'
}
ArchitecturalCritique>>actions [
	^ super actions copyWith: 
		(RePropertyAction new
			icon: #smallWindow asIcon;
			description: 'Open dependency analyzer';
			action: [ :crit :package |
				self openDependencyAnalyzerOn: package ];
			yourself)
				
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:39'
}
ArchitecturalCritique>>openDependencyAnalyzerOn: package [

	^ (DAPackageAnalyzerPackageDependenciesWindow
			onPackagesNamed: {package packageName}) open
]
