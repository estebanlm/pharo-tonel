Extension {
	#name : #Integer
}

{
	#category : #'*Kernel-Chronology',
	#timestamp : ' 8/31/2017 07:16:33'
}
Integer>>asSeconds [
	^ Duration seconds: self
]
