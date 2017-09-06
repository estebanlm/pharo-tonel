"

"
Class {
	#name : #MetacelloAbstractVersionConstructor,
	#superclass : #MetacelloAbstractConstructor,
	#instVars : [
		'root',
		'configuration',
		'project',
		'attributeMap',
		'attributeOrder',
		'symbolicVersion',
		'currentContext'
	],
	#category : #Metacello-Core-Constructors,
	#timestamp : ''
}

{
	#category : #'method generation',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor class>>symbolicMethodSelectorAndPragma: selector symbolicVersionSymbol: symbolicVersionSymbol on: strm [
	strm
		nextPutAll: selector asString , ' spec';
		cr;
		tab;
		nextPutAll: '<symbolicVersion: #' , symbolicVersionSymbol asString printString;
		nextPutAll: '>';
		cr
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>addAttribute: anAttribute [

	self attributeOrder add: anAttribute
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>attributeMap [

	attributeMap == nil ifTrue: [ attributeMap := Dictionary new ].
	^attributeMap
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>attributeOrder [

	attributeOrder == nil ifTrue: [ attributeOrder := OrderedCollection new ].
	^attributeOrder
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>author: aBlockOrString [
    "Define author field of version spec (MetacelloMCVersionSpec).
	 If <aBlockOrString> is a String, the version spec author is set to the String.
	If <aBlockOrString> is a Block, the specifications in <aBlockOrString> are applied to the author spec (MetacelloValueHolderSpec). Not Recommended!
	
		spec author: 'dkh'.
		
		spec author: [
			spec value: 'dkh'. ].
	 "

    self root author: aBlockOrString constructor: self
]

{
	#category : #'api spec callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>authorForVersion: aBlockOrString [
    aBlockOrString setAuthorInMetacelloConfig: self
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>baseline: aString [
    self root baseline: aString constructor: self
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>baseline: aString with: aBlockOrString [
    self root baseline: aString with: aBlockOrString constructor: self
]

{
	#category : #'api spec callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>baselineForVersion: aString [
    self setBaseline: aString
]

{
	#category : #'api spec callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>baselineForVersion: aString with: aBlock [
    aBlock setBaseline: aString withInMetacelloConfig: self
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>blessing: aBlockOrString [
    "Define blessing field of version spec (MetacelloMCVersionSpec).
	 If <aBlockOrString> is a String, the version spec blessing is set to the String. It is recommended to use a Symbol.
	If <aBlockOrString> is a Block, the specifications in <aBlockOrString> are applied to the blessing spec (MetacelloValueHolderSpec). Not Recommended!
	
		spec blessing: #release.
		
		spec blessing: [
			spec value: #release. ].
	
	The blessing should typically be set to one of three values:
		#baseline - indicating that the version spec is specifying a baseline version
		#development - indicating that the version spec is not stabilized and will change over time
		#release - indicating that the version spec has stabilized and will NOT change over time
	 "

    self root blessing: aBlockOrString constructor: self
]

{
	#category : #'api spec callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>blessingForVersion: aBlockOrString [
    aBlockOrString setBlessingInMetacelloConfig: self
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>className: aString [
    "Define className field of a project spec (MetacelloMCProjectSpec).
	
		spec project: 'CoolBrowser' with: [
			spec className: 'ConfigurationOfCoolBrowser'. ].

	The className field is OPTIONAL in the project spec. If omitted, the className will be created by prepending 'ConfigurationOf' to the project name.
	 "

    self root className: aString constructor: self
]

{
	#category : #'api spec callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>classNameForProject: aString [
    self root className: aString
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>configuration [

	^configuration
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>configuration: aConfig [

	configuration := aConfig
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>configuration: aString with: aBlockOrString [
    self root configuration: aString with: aBlockOrString constructor: self
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>configurationClass [

	^self configuration class
]

{
	#category : #'api spec callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>configurationForVersion: aString with: aBlock [
    aBlock setConfiguration: aString withInMetacelloConfig: self
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>description: aBlockOrString [
    "Define description field of version spec (MetacelloMCVersionSpec).
	 If <aBlockOrString> is a String, the version spec blessing is set to the String. It is recommended to use a Symbol.
	If <aBlockOrString> is a Block, the specifications in <aBlockOrString> are applied to the blessing spec (MetacelloValueHolderSpec). Not Recommended!
	
		spec description: 'Descriptive comment'.
		
		spec description: [
			spec value: 'Descriptive comment'.
	 "

    self root description: aBlockOrString constructor: self
]

{
	#category : #'api spec callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>descriptionForVersion: aBlockOrString [
    aBlockOrString setDescriptionInMetacelloConfig: self
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>evaluatePragma: pragma [
	currentContext := pragma.
	[ self configuration perform: pragma methodSelector with: self ]
		ensure: [ currentContext := nil ]
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>file: aString [
    "Define file field of a package spec (MetacelloPackageSpec) or project spec (MetacelloMCProjectSpec).

	For a package spec, the file: field is optional in a baseline. In a baseline, the file field may be used to specify a package branch for the package:
	
		spec package: 'MyPackage' with: [
			spec file: 'MyPackage.gemstone'. ]'.

	The file: field is required in a version. In a version, the file field defines the explicit version of the package to be loaded:
	
		spec package: 'MyPackage' with: [
			spec file: 'MyPackage.gemstone-dkh.1'. ]'.

	The following may be used as a short cut for specifying the file field in a version:

		spec package: 'MyPackage' with: 'MyPackage.gemstone-dkh.1'.

	For a project spec, the file field specifies the name of the Monticello package that contains the configuration. If you are using the convention of 
	naming the class and package usingthe  'ConfigurationOf' prefix, then there is no need to specify the file field:
	
		spec project: 'MyProject' with: [
			spec file: 'ConfigurationMyProject'.

	It should only be used when the package name for the configuration is different from the name of the project:

		spec project: 'MyProject' with: [
			spec file: 'MyProject-Metacello'.
	 "

    self root file: aString constructor: self
]

{
	#category : #'api spec callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>fileForPackage: aString [
    self root file: aString
]

{
	#category : #'api spec callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>fileForProject: aString [
    self root file: aString
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>for: attributeListOrSymbol do: aBlock [
    "conditional version support"

    attributeListOrSymbol setForDo: aBlock withInMetacelloConfig: self
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>for: attributeListOrSymbol version: aString [
    "conditional symbolicVersion support"

    attributeListOrSymbol setForVersion: aString withInMetacelloConfig: self
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>group: aString overrides: aStringOrCollection [
    self root group: aString overrides: aStringOrCollection constructor: self
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>group: aString with: aStringOrCollection [
    self root group: aString with: aStringOrCollection constructor: self
]

{
	#category : #'api spec callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>groupForVersion: aString overrides: aStringOrCollection [
    | spec |
    spec := self project groupSpec
        name: aString;
        includes: aStringOrCollection;
        yourself.
    self root packages add: spec
]

{
	#category : #'api spec callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>groupForVersion: aString with: aStringOrCollection [
    | spec |
    spec := self project groupSpec
        name: aString;
        includes: aStringOrCollection;
        yourself.
    self root packages merge: spec
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>import: aStringOrCollection [
  "import names defined in baseline <aString> to be used when loading the version

		spec baseline: 'Sample' with: [ spec repository: 'github://dalehenrich/sample:master/repository' ].
		spec import: 'Sample' ]
	
	or a list of names for multiple project imports:
	
		spec baseline: 'Sample' with: [ spec repository: 'github://dalehenrich/sample:master/repository' ].
		spec baseline: 'Example' with: [ spec repository: 'github://dalehenrich/example:master/repository' ].
		spec import: #('Sample' 'Example')]	
	 "

  self root import: aStringOrCollection constructor: self
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>import: aString provides: aCollection [
  "import names defined in baseline <aString> to be used when loading the version

	
		spec baseline: 'Sample' with: [ spec repository: 'github://dalehenrich/sample:master/repository' ].
		spec import: 'Sample' provides: #('Sample Core');
		spec baseline: 'Example' with: [ spec repository: 'github://dalehenrich/example:master/repository' ].
		spec import: 'Example' provides: #('Example Core')]	
	 "

  self root import: aString provides: aCollection constructor: self
]

{
	#category : #'api spec callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>importForVersion: aString [
    self root import: aString
]

{
	#category : #'api spec callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>importForVersion: aString provides: anArray [
  self root import: aString provides: anArray
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>includes: anObject [
    self root includes: anObject constructor: self
]

{
	#category : #'api spec callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>includesForPackage: anObject [
    self root includes: anObject
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>loads: aStringOrCollection [
  self root loads: aStringOrCollection constructor: self
]

{
	#category : #'api spec callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>loadsForProject: anObject [
    self root loads: anObject
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>name: anObject [
    self root name: anObject constructor: self
]

{
	#category : #'api spec callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>nameForProject: aString [
    self root name: aString
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>operator: anObject [
    self root operator: anObject constructor: self
]

{
	#category : #'api spec callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>operatorForProject: anObject [
    self root operator: anObject
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>package: aString [
    self root package: aString constructor: self
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>package: aString overrides: aBlock [
    self root package: aString overrides: aBlock constructor: self
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>package: packageName with: aBlockOrString [
    "Define specification for package <packageName>.
	 If <aBlockOrString> is a String (or Symbol), the String is expected to be a version (or symbolic version).
	If <aBlockOrString> is a Block, the specifications in <aBlockOrString> are applied to the project:
	
		spec package: 'MyPackage' with: '1.0'.
		
		spec package: 'MyPackage' with: [
			spec file:'MyPackage-dkh.1'.
			spec repository: '/opt/gemstone/repository'.
	 "

    self root package: packageName with: aBlockOrString constructor: self
]

{
	#category : #'api spec callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>packageForVersion: aString [
    | spec |
    spec := self project packageSpec
        name: aString;
        yourself.
    self root packages add: spec
]

{
	#category : #'api spec callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>packageForVersion: aString overrides: aBlock [
    | spec |
    spec := self project packageSpec
        name: aString;
        yourself.
    self root packages add: spec.
    self with: spec during: aBlock
]

{
	#category : #'api spec callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>packageForVersion: packageName with: aBlockOrString [
    aBlockOrString setPackage: packageName withInMetacelloConfig: self
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>postLoadDoIt: aSymbol [
    self root postLoadDoIt: aSymbol constructor: self
]

{
	#category : #'api spec callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>postLoadDoItForPackage: aSymbol [
    self postLoadDoItForSpec: aSymbol
]

{
	#category : #'api spec callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>postLoadDoItForProject: aSymbol [
    self postLoadDoItForSpec: aSymbol
]

{
	#category : #'api spec callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>postLoadDoItForSpec: aSymbol [
    self validateDoItSelector: aSymbol.
    self root postLoadDoIt: aSymbol
]

{
	#category : #'api spec callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>postLoadDoItForVersion: aSymbol [
    self postLoadDoItForSpec: aSymbol
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>preLoadDoIt: aSymbol [
    self root preLoadDoIt: aSymbol constructor: self
]

{
	#category : #'api spec callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>preLoadDoItForPackage: aSymbol [
    self preLoadDoItForSpec: aSymbol
]

{
	#category : #'api spec callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>preLoadDoItForProject: aSymbol [
    self preLoadDoItForSpec: aSymbol
]

{
	#category : #'api spec callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>preLoadDoItForSpec: aSymbol [
    self validateDoItSelector: aSymbol.
    self root preLoadDoIt: aSymbol
]

{
	#category : #'api spec callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>preLoadDoItForVersion: aSymbol [
    self preLoadDoItForSpec: aSymbol
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>project [
    project == nil
        ifTrue: [ project := self projectClass new ].
    ^ project
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>project: aString [
    self root project: aString constructor: self
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>project: aString copyFrom: oldSpecName with: aBlock [
    self root
        project: aString
        copyFrom: oldSpecName
        with: aBlock
        constructor: self
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>project: aString overrides: aBlock [
    self root project: aString overrides: aBlock constructor: self
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>project: aString with: aBlockOrString [
    self root project: aString with: aBlockOrString constructor: self
]

{
	#category : #'api spec callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>projectForVersion: aString [
    self project: aString with: ''
]

{
	#category : #'api spec callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>projectForVersion: aString copyFrom: oldSpecName with: aBlock [
    | spec projectSpec |
    projectSpec := self project projectSpec
        name: aString;
        yourself.
    spec := self project projectReferenceSpec
        name: aString;
        projectReference: projectSpec;
        yourself.
    self root packages copy: oldSpecName to: spec.
    self with: projectSpec during: aBlock
]

{
	#category : #'api spec callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>projectForVersion: aString overrides: aBlock [
    | spec projectSpec |
    projectSpec := self project projectSpec
        name: aString;
        yourself.
    spec := self project projectReferenceSpec
        name: aString;
        projectReference: projectSpec;
        yourself.
    self root packages add: spec.
    self with: projectSpec during: aBlock
]

{
	#category : #'api spec callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>projectForVersion: aString with: aBlockOrString [
    aBlockOrString setProject: aString withInMetacelloConfig: self
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>projectPackage: aBlock [
    "projectPackage spec data folded into project spec"

    self root projectPackage: aBlock constructor: self
]

{
	#category : #'api spec callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>projectPackageForProject: aBlock [
    self with: self root during: aBlock
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>removeGroup: aString [
    self root removeGroup: aString constructor: self
]

{
	#category : #'api spec callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>removeGroupForVersion: aString [
    | spec |
    spec := self project groupSpec
        name: aString;
        yourself.
    self root packages remove: spec
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>removePackage: aString [
    self root removePackage: aString constructor: self
]

{
	#category : #'api spec callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>removePackageForVersion: aString [
    | spec |
    spec := self project packageSpec
        name: aString;
        yourself.
    self root packages remove: spec
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>removeProject: aString [
    self root removeProject: aString constructor: self
]

{
	#category : #'api spec callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>removeProjectForVersion: aString [
    | spec |
    spec := self project projectReferenceSpec
        name: aString;
        yourself.
    self root packages remove: spec
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>repositories: aBlock [
    self root repositories: aBlock constructor: self
]

{
	#category : #'api spec callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>repositoriesForPackage: aBlock [
    self repositoriesForSpec: aBlock
]

{
	#category : #'api spec callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>repositoriesForProject: aBlock [
    self repositoriesForSpec: aBlock
]

{
	#category : #'api spec callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>repositoriesForSpec: aBlock [
    self with: self root repositories during: aBlock
]

{
	#category : #'api spec callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>repositoriesForVersion: aBlock [
    self repositoriesForSpec: aBlock
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>repository: anObject [
    self root repository: anObject constructor: self
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>repository: description username: username password: password [
    self root
        repository: description
        username: username
        password: password
        constructor: self
]

{
	#category : #'api spec callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>repositoryForPackage: anObject [
    self repositoryForSpec: anObject
]

{
	#category : #'api spec callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>repositoryForPackage: aString username: username password: password [
    self repositoryForSpec: aString username: username password: password
]

{
	#category : #'api spec callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>repositoryForProject: anObject [
    self repositoryForSpec: anObject
]

{
	#category : #'api spec callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>repositoryForProject: aString username: username password: password [
    self repositoryForSpec: aString username: username password: password
]

{
	#category : #'api spec callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>repositoryForRepositories: anObject [
    self repositoryForSpec: anObject
]

{
	#category : #'api spec callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>repositoryForRepositories: aString username: username password: password [
    self repositoryForVersion: aString username: username password: password
]

{
	#category : #'api spec callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>repositoryForSpec: anObject [
    self root repository: anObject
]

{
	#category : #'api spec callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>repositoryForSpec: aString username: username password: password [
    self root repository: aString username: username password: password
]

{
	#category : #'api spec callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>repositoryForVersion: anObject [
    self repositoryForSpec: anObject
]

{
	#category : #'api spec callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>repositoryForVersion: aString username: username password: password [
    self repositoryForSpec: aString username: username password: password
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>requires: anObject [
    self root requires: anObject constructor: self
]

{
	#category : #'api spec callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>requiresForPackage: anObject [
    self root requires: anObject
]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>reset [
    attributeMap := attributeOrder := nil
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>root [

	^root
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>root: aMetacelloSpec [
    root := aMetacelloSpec
]

{
	#category : #'api callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>setAuthorWithBlock: aBlock [

	| spec |
	(spec := self root getAuthor) == nil
		ifTrue: [ 
			spec := self project valueHolderSpec.
			self root setAuthor: spec ].
	self with: spec during: aBlock
]

{
	#category : #'api callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>setAuthorWithString: aString [

	self root author: aString
]

{
	#category : #'api callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>setBaseline: aString [
    | spec projectSpec |
    projectSpec := self project baselineOfProjectSpec
        name: aString;
        className: 'BaselineOf' , aString;
        yourself.
    spec := self project projectReferenceSpec
        name: aString;
        projectReference: projectSpec;
        yourself.
    self root packages merge: spec.
    ^ projectSpec
]

{
	#category : #'api callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>setBaseline: aString withBlock: aBlock [
    | projectSpec |
    projectSpec := self setBaseline: aString.
    self with: projectSpec during: aBlock
]

{
	#category : #'api callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>setBlessingWithBlock: aBlock [

	| spec |
	(spec := self root getBlessing) == nil
		ifTrue: [ 
			spec := self project valueHolderSpec.
			self root setBlessing: spec ].
	self with: spec during: aBlock
]

{
	#category : #'api callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>setBlessingWithString: aString [

	self root blessing: aString
]

{
	#category : #'api callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>setConfiguration: aString withBlock: aBlock [
    | spec projectSpec |
    projectSpec := self project configurationOfProjectSpec
        name: aString;
        yourself.
    spec := self project projectReferenceSpec
        name: aString;
        projectReference: projectSpec;
        yourself.
    self root packages merge: spec.
    self with: projectSpec during: aBlock
]

{
	#category : #'api callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>setDescriptionWithBlock: aBlock [

	| spec |
	(spec := self root getDescription) == nil
		ifTrue: [ 
			spec := self project valueHolderSpec.
			self root setDescription: spec ].
	self with: spec during: aBlock
]

{
	#category : #'api callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>setDescriptionWithString: aString [

	self root description: aString
]

{
	#category : #'api callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>setFor: attributeList do: aBlock [
    "conditional version support"

    attributeList asMetacelloAttributeList
        do: [ :attribute | 
            | blockList |
            blockList := self attributeMap
                at: attribute
                ifAbsent: [ self attributeMap at: attribute put: (blockList := OrderedCollection new) ].
            blockList add: aBlock.
            self addAttribute: attribute ]
]

{
	#category : #'api callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>setFor: attributeList version: aString [
    "conditional symbolicVersion support"

    attributeList asMetacelloAttributeList
        do: [ :attribute | 
            self attributeMap at: attribute put: aString.
            self addAttribute: attribute ]
]

{
	#category : #'api callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>setPackage: aString withBlock: aBlock [

	| spec |
	spec := 
		(self project packageSpec)
			name: aString;
			yourself.
	self root packages merge: spec.
	self with: spec during: aBlock
]

{
	#category : #'api callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>setPackage: aString withString: aFile [

	| spec |
	spec := 
		(self project packageSpec)
			name: aString;
			file: aFile;
			yourself.
	self root packages merge: spec.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>setProject: aProject [

	project := aProject
]

{
	#category : #'api callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>setProject: aString withBlock: aBlock [
    | spec projectSpec |
    projectSpec := self project projectSpec
        name: aString;
        yourself.
    spec := self project projectReferenceSpec
        name: aString;
        projectReference: projectSpec;
        yourself.
    self root packages merge: spec.
    self with: projectSpec during: aBlock
]

{
	#category : #'api callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>setProject: aString withString: versionString [

	| spec projectSpec |
	projectSpec := 
		(self project projectSpec)
			name: aString;
			versionString: versionString;
			yourself.
	spec := 
		(self project projectReferenceSpec)
			name: aString;
			projectReference: projectSpec;
			yourself.
	self root packages merge: spec.
]

{
	#category : #'api callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>setTimestampWithBlock: aBlock [

	| spec |
	(spec := self root getTimestamp) == nil
		ifTrue: [ 
			spec := self project valueHolderSpec.
			self root setTimestamp: spec ].
	self with: spec during: aBlock
]

{
	#category : #'api callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>setTimestampWithString: aString [

	self root timestamp: aString
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>supplyingAnswers: aCollection [
    self root supplyingAnswers: aCollection constructor: self
]

{
	#category : #'api spec callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>supplyingAnswersForPackage: anObject [
    self root answers: anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>symbolicVersion [

	^symbolicVersion
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>symbolicVersion: aSymbol [

	symbolicVersion := aSymbol
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>timestamp: aBlockOrStringOrDateAndTime [
    "Define timestamp field of version spec (MetacelloMCVersionSpec).
	 If <aBlockOrStringOrDateAndTime> is a String, the version spec timetamp is set to the String.
	 If <aBlockOrStringOrDateAndTime> is a DateAndTime, the version spec timetamp is set to the printString of the DateAndTime.
	If <aBlockOrStringOrDateAndTime> is a Block, the specifications in <aBlockOrStringOrDateAndTime> are applied to the timestamp spec (MetacelloValueHolderSpec). Not Recommended!
	
		spec timestamp: '10/7/2009 14:40'.
		
		spec timestamp: DateAndTime now'.
		
		spec timestamp: [
			spec value: '10/7/2009 14:40'. ].
    "

    self root timestamp: aBlockOrStringOrDateAndTime constructor: self
]

{
	#category : #'api spec callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>timestampForVersion: aBlockOrStringOrDateAndTime [
    aBlockOrStringOrDateAndTime setTimestampInMetacelloConfig: self
]

{
	#category : #validation,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>validateDoItSelector: anObject [

	anObject == nil ifTrue: [ ^ self ].
	anObject isSymbol ifFalse: [ self error: 'Invalid message selector for doit: ', anObject printString ].
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>value: anObject [
    self root value: anObject constructor: self
]

{
	#category : #'api spec callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>valueForValueHolder: anObject [
    self root value: anObject
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>version: anObject [
    self root version: anObject constructor: self
]

{
	#category : #'api spec callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>versionForProject: anObject [
    self versionStringForProject: anObject
]

{
	#category : #'api spec callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>versionForVersion: anObject [
    self versionStringForVersion: anObject
]

{
	#category : #api,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>versionString: anObject [
    self root versionString: anObject constructor: self
]

{
	#category : #'api spec callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>versionStringForProject: anObject [
    self root versionString: anObject
]

{
	#category : #'api spec callbacks',
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>versionStringForVersion: anObject [
    self versionStringForProject: anObject
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:49'
}
MetacelloAbstractVersionConstructor>>with: aMetacelloSpec during: aBlock [
    | previousRoot |
    previousRoot := self root.
    self root: aMetacelloSpec.
    aBlock
        ensure: [ self root: previousRoot ]
]
