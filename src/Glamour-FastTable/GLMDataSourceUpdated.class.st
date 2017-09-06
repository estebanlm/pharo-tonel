"
I am an annoucement use by Glamour to signal that the dataSource of a Renderer changed.

Description 
--------------------

I keep a pointer to the new dataSource. 
I can be use when the user filter a FastTable for example.
I am use by a Fast related renderer in GLMMorphicFTRenderer.

Public API and Key Messages
------------------

- newDataSource: aDataSource 		is my constructor.
		
Internal Representation and Key Implementation Points.
------------------ 

    Instance Variables
	newDataSource:		The new DataSource.

"
Class {
	#name : #GLMDataSourceUpdated,
	#superclass : #Announcement,
	#instVars : [
		'newDataSource'
	],
	#category : #Glamour-FastTable-Announcement,
	#timestamp : 'CyrilFerlicot 11/16/2015 15:51'
}

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMDataSourceUpdated class>>newDataSource: aDataSource [
	^ self new
		newDataSource: aDataSource;
		yourself
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMDataSourceUpdated>>newDataSource [
	^ newDataSource
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:35'
}
GLMDataSourceUpdated>>newDataSource: anObject [
	newDataSource := anObject
]
