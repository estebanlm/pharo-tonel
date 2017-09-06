"

"
Class {
	#name : #MetacelloMCVersionSpecLoader,
	#superclass : #Object,
	#instVars : [
		'versionSpec',
		'required',
		'packages',
		'loader',
		'loaderPolicy'
	],
	#category : #Metacello-MC-Loaders,
	#timestamp : ''
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCVersionSpecLoader class>>on: aVersionSpec [

	^(self new) 
		versionSpec: aVersionSpec;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCVersionSpecLoader>>label [

	^self versionSpec label
]

{
	#category : #loading,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCVersionSpecLoader>>load [
  | mcLoader |
  packages := Dictionary new.
  self resolveToLoadableSpecs.
  mcLoader := self loader.
  packages values
    do: [ :pkg | 
      pkg ensureLoadedForDevelopmentUsing: mcLoader.
      (MetacelloIgnorePackageLoaded signal: pkg)
        ifFalse: [ 
          mcLoader ignoreImage
            ifFalse: [ 
              (pkg
                compareCurrentVersion: self operator
                targetVersionStatus: #(#'allLoadedToSpec')
                using: mcLoader)
                ifTrue: [ packages removeKey: pkg name ] ] ] ].
  packages notEmpty
    ifTrue: [ 
      mcLoader preLoad: self versionSpec.
      mcLoader load.
      mcLoader postLoad: self versionSpec ].
  ^ mcLoader
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCVersionSpecLoader>>loader [

	loader == nil 
		ifTrue: [
			loader := self versionSpec loader copy.
			loader spec: self.
			loaderPolicy notNil ifTrue: [ loader loaderPolicy: loaderPolicy] ].
	^loader
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCVersionSpecLoader>>loaderPolicy [
	^ loaderPolicy
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCVersionSpecLoader>>loaderPolicy: anObject [
	loaderPolicy := anObject
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCVersionSpecLoader>>name [

	^self versionSpec name
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCVersionSpecLoader>>operator [

	^self loader operator
]

{
	#category : #'spec compatibility',
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCVersionSpecLoader>>packageSpecsInLoadOrder [
    ^ self versionSpec packageSpecsInLoadOrderForMap: packages
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCVersionSpecLoader>>packages [

	^packages
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCVersionSpecLoader>>project [

	^self versionSpec project
]

{
	#category : #loading,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCVersionSpecLoader>>repositories [

	^self repositorySpecs
]

{
	#category : #'spec compatibility',
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCVersionSpecLoader>>repositorySpecs [

	| repositoryMap |
	repositoryMap := self versionSpec repositories ~~ nil
		ifTrue: [ self versionSpec repositories map ]
		ifFalse: [ Dictionary new ].
	^repositoryMap values.
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCVersionSpecLoader>>required [

	required == nil ifTrue: [ ^#() ].
	^ required
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCVersionSpecLoader>>required: anObject [
	required := anObject
]

{
	#category : #loading,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCVersionSpecLoader>>resolvePackageNames [

	packages := Dictionary new.
	self resolveToLoadableSpecs.
	^packages values collect: [:pkg | pkg name ]
]

{
	#category : #private,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCVersionSpecLoader>>resolveToLoadableSpecs [
    self versionSpec resolveToLoadableSpecs: required forLoad: true map: packages
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCVersionSpecLoader>>versionSpec [
	^ versionSpec
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCVersionSpecLoader>>versionSpec: anObject [
	versionSpec := anObject
]

{
	#category : #'spec compatibility',
	#timestamp : ' 8/31/2017 07:16:20'
}
MetacelloMCVersionSpecLoader>>versionString [

	^self versionSpec versionString
]
