Extension {
	#name : #String
}

{
	#category : #'*files',
	#timestamp : ' 8/31/2017 07:16:12'
}
String>>asVmPathName [
	"This method returns self encoded in the encoding the system expects.
	We default to utf8 as this is the most common encoding, but we should ask the system the current encoding instead.
	
	Also, note the method name is wrong, this should be fixed"
	self flag: #TODO.
	^ self utf8Encoded
]
