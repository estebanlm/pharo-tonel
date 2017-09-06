"
Access to the web browser on Windows
"
Class {
	#name : #WBWindowsWebBrowser,
	#superclass : #WebBrowser,
	#category : #WebBrowser-Core-OS-Windows,
	#timestamp : 'TorstenBergmann 4/13/2016 08:24'
}

{
	#category : #examples,
	#timestamp : ' 8/31/2017 05:26:19'
}
WBWindowsWebBrowser class>>example [

	self openOn: 'http://www.pharo.org'
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:19'
}
WBWindowsWebBrowser class>>isForCurrentSystem [

	^Smalltalk os isWindows   
]

{
	#category : #'instance creation',
	#timestamp : ' 8/31/2017 05:26:19'
}
WBWindowsWebBrowser class>>openOn: anURLString [
	"
	self openOn: 'http://www.pharo.org'
	"
	^self shellExecute: 'open' file: anURLString parameters: '' directory: '' show: 5 "SW_SHOW"
]

{
	#category : #'private - uffi',
	#timestamp : ' 8/31/2017 05:26:19'
}
WBWindowsWebBrowser class>>shellExecute: lpOperation file: lpFile parameters: lpParameters directory: lpDirectory show: nShowCmd	 [
	
	^self ffiCall: #( 
			FFIConstantHandle ShellExecuteA(
     				0,
     				String* lpOperation,
         			String* lpFile,
     				String* lpParameters,
     				String* lpDirectory,
        			int nShowCmd)) module: #shell32
]
