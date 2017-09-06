Extension {
	#name : #MCDirectoryRepository
}

{
	#category : #'*metacello-mc',
	#timestamp : ' 8/31/2017 07:16:20'
}
MCDirectoryRepository>>asRepositorySpecFor: aMetacelloMCProject [
  ""

  ^ directory asRepositorySpecFor: aMetacelloMCProject
]
