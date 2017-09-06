"
I am an object representing the current image to get all sorted packages for browsing.

CurrentImage new packages
	=> all packages in the image sorted
"
Class {
	#name : #CurrentImage,
	#superclass : #Object,
	#category : #Tool-ExternalBrowser,
	#timestamp : 'GuillermoPolito 5/29/2015 13:43'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:21'
}
CurrentImage>>packages [

	^ (RPackageOrganizer default packages) sorted
]
