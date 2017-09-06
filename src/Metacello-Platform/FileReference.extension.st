Extension {
	#name : #FileReference
}

{
	#category : #'*metacello-platform',
	#timestamp : ' 8/31/2017 07:16:15'
}
FileReference>>asRepositorySpecFor: aMetacelloMCProject [
  ^ aMetacelloMCProject repositorySpec
    description: self fullName;
    type: 'directory';
    yourself
]
