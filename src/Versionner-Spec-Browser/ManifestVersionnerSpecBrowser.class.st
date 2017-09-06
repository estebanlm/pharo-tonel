"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestVersionnerSpecBrowser,
	#superclass : #PackageManifest,
	#category : #Versionner-Spec-Browser,
	#timestamp : 'PavelKrivanek 11/17/2016 10:28'
}

{
	#category : #release,
	#timestamp : ' 8/31/2017 05:26:38'
}
ManifestVersionnerSpecBrowser class>>preUnload [

	VersionnerSpecBrowser clean.
]
