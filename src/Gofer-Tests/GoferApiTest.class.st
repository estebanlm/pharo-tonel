"
SUnit tests for Gofer API
"
Class {
	#name : #GoferApiTest,
	#superclass : #GoferTest,
	#category : #Gofer-Tests,
	#timestamp : 'TorstenBergmann 2/5/2014 09:36'
}

{
	#category : #asserting,
	#timestamp : ' 8/31/2017 05:26:30'
}
GoferApiTest>>assert: registry on: serverUrlString hasUser: nameString withPassword: passwordString  [

	registry repositoryAt: serverUrlString credentialsDo: [ :user :password |
		self assert: nameString equals: user.
		self assert: passwordString equals: password ].
]

{
	#category : #utilities,
	#timestamp : ' 8/31/2017 05:26:30'
}
GoferApiTest>>assert: aGofer repositories: anArray [
	self assert: aGofer repositories size = anArray size.
	aGofer repositories with: anArray
		do: [ :first :second | 
			self assert: first description equals: second ]
]

{
	#category : #testing-repositories-places,
	#timestamp : ' 8/31/2017 05:26:30'
}
GoferApiTest>>testBlueplane [
	gofer blueplane: 'SIXX'.
	self assert: gofer repositories: #('http://squeaksource.blueplane.jp/SIXX')
]

{
	#category : #testing-references,
	#timestamp : ' 8/31/2017 05:26:30'
}
GoferApiTest>>testConstraintReference [
	gofer 
		repository: self monticelloRepository; 
		package: 'GoferBar' constraint: [ :ref | ref branch = 'branch' ].
	self assert: (gofer resolved size = 1).
	self assert: (gofer resolved first isKindOf: GoferResolvedReference).
	self assert: (gofer resolved first packageName = 'GoferBar').
	self assert: (gofer resolved first author = 'lr').
	self assert: (gofer resolved first branch = 'branch').
	self assert: (gofer resolved first versionNumber = 2).
	self assert: (gofer resolved first repository = self monticelloRepository)
]

{
	#category : #testing-repositories,
	#timestamp : ' 8/31/2017 05:26:30'
}
GoferApiTest>>testCustomRepository [
	gofer repository: self monticelloRepository.
	self assert: gofer repositories: (Array with: self monticelloRepository description).
	self assert: (gofer repositories first = self monticelloRepository)
]

{
	#category : #testing-repositories,
	#timestamp : ' 8/31/2017 05:26:30'
}
GoferApiTest>>testDirectoryRepository [
	gofer directory: FileSystem disk workingDirectory fullName.
	self assert: gofer repositories: (Array with: FileSystem disk workingDirectory fullName).
	self assert: (gofer repositories first isKindOf: MCDirectoryRepository)
]

{
	#category : #testing-repositories-places,
	#timestamp : ' 8/31/2017 05:26:30'
}
GoferApiTest>>testGemsource [
	gofer gemsource: 'Seaside29'.
	self assert: gofer repositories: #('http://seaside.gemstone.com/ss/Seaside29')
]

{
	#category : #testing-repositories,
	#timestamp : ' 8/31/2017 05:26:30'
}
GoferApiTest>>testHttpRepository [
	gofer url: 'http://source.lukas-renggli.ch/pier' username: 'foo' password: 'bar'.
	self assert: gofer repositories: #('http://source.lukas-renggli.ch/pier').
	self assert: (gofer repositories first isKindOf: MCHttpRepository)
]

{
	#category : #testing-repositories,
	#timestamp : ' 8/31/2017 05:26:30'
}
GoferApiTest>>testHttpRepositoryOverrideStoredCredentials [

	| exampleServer registry |
	[
		exampleServer := 'http://my.cool.repo.server.com/'.
		registry := MCServerRegistry uniqueInstance.
		registry on: exampleServer beUser: 'myusername' withPassword: 'mypassword'.
		
		gofer url: exampleServer username: 'foo' password: 'bar'..
		
		self assert: gofer repositories: { exampleServer }.
		self assert: gofer repositories first user equals: 'foo'.
		self assert: registry on: exampleServer hasUser: 'myusername' withPassword: 'mypassword'.
	] ensure: [
		registry removeCredentialsFor: exampleServer ].
	
]

{
	#category : #testing-repositories,
	#timestamp : ' 8/31/2017 05:26:30'
}
GoferApiTest>>testHttpRepositoryUseStoredCredentials [

	| exampleServer registry |
	[
		exampleServer := 'http://my.cool.repo.server.com/'.
		registry := MCServerRegistry uniqueInstance.
		registry on: exampleServer beUser: 'myusername' withPassword: 'mypassword'.
		
		gofer url: exampleServer.
		
		self assert: gofer repositories: { exampleServer }.
		self assert: gofer repositories first user equals: 'myusername'
	] ensure: [
		registry removeCredentialsFor: exampleServer ].
	
]

{
	#category : #testing-repositories-places,
	#timestamp : ' 8/31/2017 05:26:30'
}
GoferApiTest>>testImpara [
	gofer impara: 'Tweak'.
	self assert: gofer repositories: #('http://source.impara.de/Tweak')
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:30'
}
GoferApiTest>>testInitialReferences [
	self assert: gofer references isEmpty
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:30'
}
GoferApiTest>>testInitialRepositories [
	gofer := Gofer new.
	self assert: (gofer repositories size = 1).
	self assert: (gofer repositories first isKindOf: MCCacheRepository uniqueInstance class)
]

{
	#category : #testing-repositories-options,
	#timestamp : ' 8/31/2017 05:26:30'
}
GoferApiTest>>testPackageCache [
	gofer squeaksource: 'r1'; squeaksource: 'r2'.
	
	gofer enablePackageCache.
	self assert: gofer repositories: (Array with: MCCacheRepository uniqueInstance description) , #('http://www.squeaksource.com/r1' 'http://www.squeaksource.com/r2').
	
	gofer disablePackageCache.
	self assert: gofer repositories: #('http://www.squeaksource.com/r1' 'http://www.squeaksource.com/r2')
]

{
	#category : #testing-references,
	#timestamp : ' 8/31/2017 05:26:30'
}
GoferApiTest>>testPackageReference [
	gofer 
		repository: self monticelloRepository;
		package: 'GoferFoo'.
	self assert: (gofer resolved size = 1).
	self assert: (gofer resolved first isKindOf: GoferResolvedReference).
	self assert: (gofer resolved first packageName = 'GoferFoo').
	self assert: (gofer resolved first author = 'lr').
	self assert: (gofer resolved first branch isEmpty).
	self assert: (gofer resolved first versionNumber = 4).
	self assert: (gofer resolved first repository = self monticelloRepository)
]

{
	#category : #testing-repositories-places,
	#timestamp : ' 8/31/2017 05:26:30'
}
GoferApiTest>>testRenggli [
	gofer renggli: 'pier'.
	self assert: gofer repositories: #('http://source.lukas-renggli.ch/pier')
]

{
	#category : #testing-repositories-options,
	#timestamp : ' 8/31/2017 05:26:30'
}
GoferApiTest>>testRepositoryErrors [
	gofer
		url: 'http://pharo-project.org/page-that-will-never-ever-exist';
		repository: self monticelloRepository.
	gofer package: 'GoferFoo'.
	gofer enableRepositoryErrors.
	self should: [ gofer resolved ] raise: GoferRepositoryError.
	gofer disableRepositoryErrors.
	gofer resolved
]

{
	#category : #testing-repositories-places,
	#timestamp : ' 8/31/2017 05:26:30'
}
GoferApiTest>>testSmalltalkhub [
	gofer smalltalkhubUser: 'dh83' project: 'ci'.
	self assert: gofer repositories: #('http://smalltalkhub.com/mc/dh83/ci/main/')
]

{
	#category : #testing-repositories-places,
	#timestamp : ' 8/31/2017 05:26:30'
}
GoferApiTest>>testSqueakfoundation [
	gofer squeakfoundation: '39a'.
	self assert: gofer repositories: #('http://source.squeakfoundation.org/39a')
]

{
	#category : #testing-repositories-places,
	#timestamp : ' 8/31/2017 05:26:30'
}
GoferApiTest>>testSqueaksource [
	gofer squeaksource: 'Seaside29'.
	self assert: gofer repositories: #('http://www.squeaksource.com/Seaside29')
]

{
	#category : #testing-repositories,
	#timestamp : ' 8/31/2017 05:26:30'
}
GoferApiTest>>testSubDirectoryRepository [
	Smalltalk globals
		at: #MCSubDirectoryRepository
		ifPresent: [ :subDirectoryRepositoryClass | |path|
			path := (FileSystem disk workingDirectory / '*') fullName.
			gofer directory: path.
			self assert: gofer repositories: (Array with: path).
			self assert: (gofer repositories first isKindOf: subDirectoryRepositoryClass) ]
]

{
	#category : #testing-references,
	#timestamp : ' 8/31/2017 05:26:30'
}
GoferApiTest>>testVersionReference [
	gofer 
		repository: self monticelloRepository; 
		version: 'GoferFoo-lr.2'.
	self assert: (gofer resolved size = 1).
	self assert: (gofer resolved first isKindOf: GoferResolvedReference).
	self assert: (gofer resolved first packageName = 'GoferFoo').
	self assert: (gofer resolved first author = 'lr').
	self assert: (gofer resolved first branch isEmpty).
	self assert: (gofer resolved first versionNumber = 2).
	self assert: (gofer resolved first repository = self monticelloRepository)
]

{
	#category : #testing-repositories-places,
	#timestamp : ' 8/31/2017 05:26:30'
}
GoferApiTest>>testWiresong [
	gofer wiresong: 'ob'.
	self assert: gofer repositories: #('http://source.wiresong.ca/ob')
]
