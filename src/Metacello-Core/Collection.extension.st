Extension {
	#name : #Collection
}

{
	#category : #'*Metacello-Core',
	#timestamp : ' 8/31/2017 07:16:49'
}
Collection>>addToMetacelloPackages: aMetacelloPackagesSpec [

	self do: [:each | each addToMetacelloPackages: aMetacelloPackagesSpec ]
]

{
	#category : #'*Metacello-Core',
	#timestamp : ' 8/31/2017 07:16:49'
}
Collection>>asMetacelloAttributeList [
    ^ self
]

{
	#category : #'*Metacello-Core',
	#timestamp : ' 8/31/2017 07:16:49'
}
Collection>>asMetacelloAttributePath [
    ^ MetacelloMethodSectionPath withAll: self
]

{
	#category : #'*Metacello-Core-scripting',
	#timestamp : ' 8/31/2017 07:16:49'
}
Collection>>execute: projectSpecBlock against: aScriptExecutor [
    aScriptExecutor executeCollection: self do: projectSpecBlock
]

{
	#category : #'*Metacello-Core',
	#timestamp : ' 8/31/2017 07:16:49'
}
Collection>>mergeIntoMetacelloPackages: aMetacelloPackagesSpec [

	self do: [:each | each mergeIntoMetacelloPackages: aMetacelloPackagesSpec ]
]

{
	#category : #'*Metacello-Core',
	#timestamp : ' 8/31/2017 07:16:49'
}
Collection>>removeFromMetacelloPackages: aMetacelloPackagesSpec [

	self do: [:each | each removeFromMetacelloPackages: aMetacelloPackagesSpec ]
]

{
	#category : #'*Metacello-Core',
	#timestamp : ' 8/31/2017 07:16:49'
}
Collection>>setForDo: aBlock withInMetacelloConfig: aMetacelloConstructore [
    aMetacelloConstructore setFor: self do: aBlock
]

{
	#category : #'*Metacello-Core',
	#timestamp : ' 8/31/2017 07:16:49'
}
Collection>>setForVersion: aString withInMetacelloConfig: aMetacelloConstructore [
    aMetacelloConstructore setFor: self version: aString
]

{
	#category : #'*Metacello-Core',
	#timestamp : ' 8/31/2017 07:16:49'
}
Collection>>setImportInVersionSpec: aMetacelloVersionSpec [
  aMetacelloVersionSpec setImport: self asArray
]

{
	#category : #'*Metacello-Core',
	#timestamp : ' 8/31/2017 07:16:49'
}
Collection>>setIncludesInMetacelloPackage: aMetacelloPackageSpec [

	aMetacelloPackageSpec setIncludes: self asArray.
]

{
	#category : #'*Metacello-Core',
	#timestamp : ' 8/31/2017 07:16:49'
}
Collection>>setLoadsInMetacelloProject: aMetacelloPackageSpec [

	aMetacelloPackageSpec setLoads: self asArray.
]

{
	#category : #'*Metacello-Core',
	#timestamp : ' 8/31/2017 07:16:49'
}
Collection>>setRequiresInMetacelloPackage: aMetacelloPackageSpec [

	aMetacelloPackageSpec setRequires: self asArray.
]
