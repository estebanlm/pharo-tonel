"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestSystemAnnouncements,
	#superclass : #PackageManifest,
	#category : #System-Announcements,
	#timestamp : '<historical>'
}

{
	#category : #'meta-data - dependency analyser',
	#timestamp : ' 8/31/2017 07:17:00'
}
ManifestSystemAnnouncements class>>ignoredDependencies [
	^ #(#PragmaCollector)
]

{
	#category : #'meta-data - dependency analyser',
	#timestamp : ' 8/31/2017 07:17:00'
}
ManifestSystemAnnouncements class>>manuallyResolvedDependencies [
	^ #(#Transcript)
]
