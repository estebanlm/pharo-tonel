Extension {
	#name : #PackageManifest
}

{
	#category : #'*renraku',
	#timestamp : ' 8/31/2017 05:26:37'
}
PackageManifest class>>forcedRules [

	"override this method and return all the rule names that have to be applied to your package despite global bans"

	^ #()
]
