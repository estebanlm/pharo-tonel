"

"
Class {
	#name : #GTSpotterDeploymentExceptionHandlerMock5,
	#superclass : #GTSpotterDeploymentExceptionHandlerMock,
	#category : #GT-Tests-Spotter-Exceptions-Mocks,
	#timestamp : ''
}

{
	#category : #public,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterDeploymentExceptionHandlerMock5>>handleException: anException do: aBlock [
	super handleException: anException do: aBlock. " we perform the block because mock5 should not raise any exception within aBlock "
	^ aBlock value
]
