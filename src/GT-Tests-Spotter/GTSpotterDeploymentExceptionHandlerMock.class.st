"

"
Class {
	#name : #GTSpotterDeploymentExceptionHandlerMock,
	#superclass : #GTSpotterDeploymentExceptionHandler,
	#category : #GT-Tests-Spotter-Exceptions-Mocks,
	#timestamp : ''
}

{
	#category : #public,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterDeploymentExceptionHandlerMock>>handleException: anException do: aBlock [
	" we don't want to perform aBlock during tests --> suppress logging to transcript "
	" only register the occured exception for later testing "
	GTSpotterExceptionsTest exceptions add: anException.
]

{
	#category : #public,
	#timestamp : ' 8/31/2017 05:26:42'
}
GTSpotterDeploymentExceptionHandlerMock>>handleFatalException: anException [
	GTSpotterExceptionsTest fatals add: anException
]
