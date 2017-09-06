Extension {
	#name : #MetacelloAbstractPackageSpec
}

{
	#category : #'*metacello-mc-querying',
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloAbstractPackageSpec>>file  [
	"MetacelloPackageSpec compatibility"
	
	^nil
]

{
	#category : #'*metacello-mc',
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloAbstractPackageSpec>>forceUpdatePackageSpec: updatedSpecs using: anMCLoader [

	^self updatePackageSpec: updatedSpecs using: anMCLoader
]

{
	#category : #'*metacello-mc-querying',
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloAbstractPackageSpec>>getFile [
  "MetacelloPackageSpec compatibility"

  ^ nil
]

{
	#category : #'*metacello-mc-querying',
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloAbstractPackageSpec>>isPackageLoaded [

	^false
]

{
	#category : #'*metacello-mc',
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloAbstractPackageSpec>>loadUsing: aLoader gofer: gofer [

	^self subclassResponsibility
]

{
	#category : #'*metacello-mc',
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloAbstractPackageSpec>>packagesNeedSavingVisited: visitedProjects using: repos into: aCollection [
	"noop by default"
]

{
	#category : #'*metacello-mc',
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloAbstractPackageSpec>>repositorySpecs [

	^#()
]

{
	#category : #'*metacello-mc',
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloAbstractPackageSpec>>resolveToAllPackagesIn: aVersionSpec into: packages visited: visited [

	visited
		visit: self
		doing: [:spec |
			self visitingWithPackages: packages.
			(spec includes, spec requires) do: [:pkgName |
				(aVersionSpec packageNamed: pkgName)
					projectDo: [:prj | 
						(prj resolveToAllPackagesIn: aVersionSpec visited: visited) do: [:pkg | 
							packages at: pkg name put: pkg ]] 
					packageDo: [:pkg | 
						packages at: pkg name put: pkg.
						(pkg resolveToAllPackagesIn: aVersionSpec visited: visited) do: [:rpkg | 
							packages at: rpkg name put: rpkg ] ] 
					groupDo: [:grp | grp resolveToAllPackagesIn: aVersionSpec into: packages  visited: visited ]]]
]

{
	#category : #'*metacello-mc',
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloAbstractPackageSpec>>resolveToAllPackagesIn: aVersionSpec visited: visited [

	| packages |
	packages := Dictionary new.
	self resolveToAllPackagesIn: aVersionSpec into: packages visited: visited.
	^packages values asOrderedCollection
]

{
	#category : #'*metacello-mc',
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloAbstractPackageSpec>>resolveToLoadableSpec [

	^self
]

{
	#category : #'*metacello-mc',
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloAbstractPackageSpec>>resolveToPackagesIn: aVersionSpec andProjects: andProjectsBool visited: visited [
  ^ self resolveToPackagesIn: aVersionSpec visited: visited
]

{
	#category : #'*metacello-mc',
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloAbstractPackageSpec>>resolveToPackagesIn: aVersionSpec visited: visited [

	^self subclassResponsibility
]

{
	#category : #'*metacello-mc',
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloAbstractPackageSpec>>updateForSpawnMethod: sourceSpec [
	"This means that this spec was used in a baseline and will be used in a version .... drop all information that isn't useful"

	answers := name := requires := includes := nil
]

{
	#category : #'*metacello-mc',
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloAbstractPackageSpec>>updatePackageRepositoriesFor: aVersionSpec [
	"noop by default"
	
	^true
]

{
	#category : #'*metacello-mc',
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloAbstractPackageSpec>>updatePackageSpec: updatedSpecs using: anMCLoader [
	"Add pkg copy to updatedSpecs if the file in current image is different from the receiver's file"
]

{
	#category : #'*metacello-mc-querying',
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloAbstractPackageSpec>>version  [
	"MetacelloPackageSpec compatibility"
	
	^nil
]

{
	#category : #'*metacello-mc',
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloAbstractPackageSpec>>visitingWithPackages: packages [
	"noop"
]
