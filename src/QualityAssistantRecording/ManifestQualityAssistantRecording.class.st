"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestQualityAssistantRecording,
	#superclass : #PackageManifest,
	#category : #QualityAssistantRecording-Manifest,
	#timestamp : '<historical>'
}

{
	#category : #release,
	#timestamp : ' 8/31/2017 05:26:37'
}
ManifestQualityAssistantRecording class>>preUnload [

	QAEventCollector unload
]
