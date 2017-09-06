"

"
Class {
	#name : #MetacelloMCProject,
	#superclass : #MetacelloProject,
	#category : #Metacello-MC-Model,
	#timestamp : ''
}

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCProject>>asBaselineProject [
    ^ MetacelloMCBaselineProject new
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCProject>>asConfigurationProject [
    ^ self
]

{
	#category : #'spec classes',
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCProject>>baselineOfProjectSpecClass [
    ^ MetacelloMCBaselineOfProjectSpec
]

{
	#category : #'spec classes',
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCProject>>configurationOfProjectSpecClass [
    ^ MetacelloMCConfigurationOfProjectSpec
]

{
	#category : #'repository creation',
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCProject>>createRepository: aRepositorySpec [

	^ MetacelloPlatform current createRepository: aRepositorySpec
]

{
	#category : #'spec classes',
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCProject>>defaultLoaderClass [

	^MetacelloLoadingMCSpecLoader
]

{
	#category : #'development support',
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCProject>>fetchProject [
	"fetch the latest version of the configuration package"
	
	^self fetchProject: MetacelloLoaderPolicy new
]

{
	#category : #'development support',
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCProject>>fetchProject: aLoaderPolicy [
	"fetch the latest version of the configuration package"
	
	| mcLoader |
	(mcLoader := self loader) == nil
		ifTrue: [ mcLoader := self project loaderClass on: nil ].
	mcLoader loaderPolicy: aLoaderPolicy.
	mcLoader doingLoads: [ 
		MCWorkingCopy
			managersForClass: self configuration class
			do: [:mgr | | pkg |
				pkg := self packageSpec.
				mgr repositoryGroup repositories do: [:repo | pkg repositories repository: (repo asRepositorySpecFor: self) ].
				pkg name: mgr packageName.
				pkg fetchUsing: mcLoader.
				^true ]].
	^true
]

{
	#category : #'development support',
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCProject>>goferBranch: branchName project: commitMessage [
    | pkgSpec |
    pkgSpec := self projectPackage.
    pkgSpec file: pkgSpec name , '.' , branchName.
    ^ pkgSpec goferBranchPackage: branchName message: commitMessage
]

{
	#category : #'development support',
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCProject>>goferCommitProject: commitMessage [

	| pkgSpec |
	(pkgSpec := self projectPackage) == nil ifTrue: [ ^false ].
	^pkgSpec goferCommitPackage: commitMessage
]

{
	#category : #'spec classes',
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCProject>>packageSpec [

	^self packageSpecClass for: self
]

{
	#category : #'spec classes',
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCProject>>packageSpecClass [

	^MetacelloPackageSpec
]

{
	#category : #'development support',
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCProject>>packagesNeedSaving: aVersionString [
	"Answer a collection of associations (package -> repository) representing the packages 
	 reachable from this project that need to be saved"

	| packages |
	packages := Set new.
	(self version: aVersionString) spec 
		packagesNeedSavingVisited: (Set with: self configuration class name asString)
		into: packages.
	^packages
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCProject>>pragmaKeywords [

	^super pragmaKeywords, #(projectPackage:attribute: packages:attribute: repositories:attribute: )
]

{
	#category : #scripting,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCProject>>projectForScriptEngine: aMetacelloScriptEngine unconditionalLoad: aBool [
    ^ aMetacelloScriptEngine getConfigurationProjectUnconditionalLoad: aBool
]

{
	#category : #'development support',
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCProject>>projectPackage [
  MCWorkingCopy
    managersForClass: self configuration class
    do: [ :mgr | 
      | pkgSpec repo |
      pkgSpec := self packageSpec
        name: mgr packageName;
        yourself.
      mgr ancestors notEmpty
        ifTrue: [ pkgSpec file: mgr ancestors first name ].
      repo := mgr repositoryGroup repositories
        detect: [ :each | each ~~ MetacelloPlatform current defaultPackageCache ]
        ifNone: [ 
          Transcript
            cr;
            show:
                'Using cache repository for ' , self label , ' project package'.
          MetacelloPlatform current defaultPackageCache ].
      pkgSpec repository: (repo asRepositorySpecFor: self).
      ^ pkgSpec ].
  ^ nil
]

{
	#category : #'spec classes',
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCProject>>projectSpecClass [
	^ MetacelloMCNamelessProjectSpec
]

{
	#category : #'spec classes',
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCProject>>repositoriesSpec [

	^self repositoriesSpecClass for: self
]

{
	#category : #'spec classes',
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCProject>>repositoriesSpecClass [

	^MetacelloRepositoriesSpec
]

{
	#category : #'spec classes',
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCProject>>repositorySpec [

	^self repositorySpecClass for: self
]

{
	#category : #'spec classes',
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCProject>>repositorySpecClass [

	^MetacelloRepositorySpec
]

{
	#category : #'development support',
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCProject>>saveProject [

	| pkgSpec |
	(pkgSpec := self projectPackage) == nil ifTrue: [ ^false ].
	^pkgSpec savePackage
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCProject>>setBaselineRepositoryDescription: aListOrRepositoryDescriptions [
    "noop "
]

{
	#category : #'repository updating',
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCProject>>updatePackageRepositoriesFor: versionString [

	| versionSpec |
	(versionSpec := (self version: versionString) versionSpec) packageSpecsInLoadOrder do: [:pkgSpec |
		pkgSpec updatePackageRepositoriesFor: versionSpec ].
	^true
]

{
	#category : #'development support',
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCProject>>updateProject [
	"load the latest version of the configuration package"

	"WARNING: don't forget to refresh your project instance after doing an #updateProject, 
	 otherwise your instance won't reflect the info in the freshly loaded configuration"
	
	^self updateProject: MetacelloLoaderPolicy new
]

{
	#category : #'development support',
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCProject>>updateProject: aLoaderPolicy [
	"load the latest version of the configuration package"

	"WARNING: don't forget to refresh your project instance after doing an #updateProject, 
	 otherwise your instance won't reflect the info in the freshly loaded configuration"

	| mcLoader |
	(mcLoader := self loader) == nil
		ifTrue: [ mcLoader := self project loaderClass on: nil ].
	mcLoader loaderPolicy: aLoaderPolicy.
	mcLoader
		doingLoads: [ 
			MCWorkingCopy
				managersForClass: self configuration class
				do: [ :mgr | 
					| pkg ar |
					pkg := self packageSpec.
					mgr repositoryGroup repositories do: [ :repo | pkg repositories repository: (repo asRepositorySpecFor: self) ].
					ar := mgr metacelloPackageNameWithBranch.
					pkg name: (ar at: 1).
					(ar at: 2) notEmpty
						ifTrue: [ pkg file: (ar at: 2) ].
					pkg load.
					^ true ] ].
	^ true
]

{
	#category : #'spec classes',
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCProject>>versionSpecClass [

	^MetacelloMCVersionSpec
]
