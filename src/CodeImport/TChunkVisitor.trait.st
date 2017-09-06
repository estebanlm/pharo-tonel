"
I am a trait defining the basic methods for visiting a chunk object.
"
Trait {
	#name : #TChunkVisitor,
	#traits : '{}',
	#classTraits : '{}',
	#category : #CodeImport,
	#timestamp : 'GuillermoPolito 6/1/2015 11:24'
}

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 07:16:32'
}
TChunkVisitor>>visitClassCommentChunk: aChunk [

	self visitCodeChunk: aChunk
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 07:16:32'
}
TChunkVisitor>>visitClassOrganizationChunk: aChunk [

	self visitCodeChunk: aChunk
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 07:16:32'
}
TChunkVisitor>>visitCodeChunk: aChunk [

	"Base method called from every other visit*"
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 07:16:32'
}
TChunkVisitor>>visitDoItChunk: aChunk [

	self visitCodeChunk: aChunk
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 07:16:32'
}
TChunkVisitor>>visitMethodChunk: aChunk [

	self visitCodeChunk: aChunk
]

{
	#category : #visitor,
	#timestamp : ' 8/31/2017 07:16:32'
}
TChunkVisitor>>visitStyleChunk: aChunk [

	self visitCodeChunk: aChunk
]
