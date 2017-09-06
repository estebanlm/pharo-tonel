Extension {
	#name : #BlockClosure
}

{
	#category : #'*Jobs',
	#timestamp : ' 8/31/2017 07:16:14'
}
BlockClosure>>asJob [

	^ Job block: self.
]
