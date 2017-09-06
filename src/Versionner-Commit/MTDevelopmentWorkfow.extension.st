Extension {
	#name : #MTDevelopmentWorkfow
}

{
	#category : #'*Versionner-Commit',
	#timestamp : ' 8/31/2017 05:26:39'
}
MTDevelopmentWorkfow>>releaseFixedDevelopment: versionName [
	"Release the development baseline (will give a version method) with the given version name."

	| devVersionString |
	devVersionString := self developmentVersion versionString.
	MetacelloToolBox
		createFixedVersion: versionName
		for: project name
		from: devVersionString 
		description: 'version ' , versionName.
	self setStableBlessingFor: versionName.
	MetacelloToolBox 
		stableVersion: versionName 
		for: project name
		platformAttribute: #common. 
	"keep the development version pointing to the baseline"	
	self
		developmentVersion: devVersionString
		platformAttribute: #common.
	self notifyConfigurationModified
]

{
	#category : #'*Versionner-Commit',
	#timestamp : ' 8/31/2017 05:26:39'
}
MTDevelopmentWorkfow>>releaseFixedDevelopment: versionName description: description [
	"Release the development baseline (will give a version method) with the given version name."

	| devVersionString |
	devVersionString := self developmentVersion versionString.
	MetacelloToolBox
		createFixedVersion: versionName
		for: project name
		from: devVersionString 
		description: (description ifNil: [ 'version ' , versionName]).
	self setStableBlessingFor: versionName.
	MetacelloToolBox 
		stableVersion: versionName 
		for: project name
		platformAttribute: #common. 
	"keep the development version pointing to the baseline"	
	self
		developmentVersion: devVersionString
		platformAttribute: #common.
	self notifyConfigurationModified
]
