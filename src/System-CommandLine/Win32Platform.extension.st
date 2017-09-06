Extension {
	#name : #Win32Platform
}

{
	#category : #'*System-CommandLine',
	#timestamp : ' 8/31/2017 07:16:54'
}
Win32Platform>>newTerminfo [
	"Windows does not support the termCap"
	^ NullTermInfo new
]
