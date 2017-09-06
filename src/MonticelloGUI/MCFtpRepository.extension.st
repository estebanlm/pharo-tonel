Extension {
	#name : #MCFtpRepository
}

{
	#category : #'*MonticelloGUI',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCFtpRepository class>>fillInTheBlankRequest [
	^ 'FTP Repository:'

	
]

{
	#category : #'*MonticelloGUI',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCFtpRepository class>>morphicConfigure [
	^ self fillInTheBlankConfigure
]
