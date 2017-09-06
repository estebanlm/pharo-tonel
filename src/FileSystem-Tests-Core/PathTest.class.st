"
SUnit tests for file system paths
"
Class {
	#name : #PathTest,
	#superclass : #TestCase,
	#type : #variable,
	#category : #FileSystem-Tests-Core,
	#timestamp : 'TorstenBergmann 1/31/2014 11:44'
}

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PathTest>>testAbsolutePath [

	| path |

	self assert: (AbsolutePath new isAbsolute).
	self assert: (Path root isAbsolute).
	
	path := AbsolutePath from: 'parent/child/grandChild' delimiter: $/.
	self assert: path size equals: 3.
	self assert: (path at: 1) equals: 'parent'.
	self assert: (path at: 2) equals: 'child'.
	self assert: (path at: 3) equals: 'grandChild'.
	
	path := AbsolutePath from: '/' delimiter: $/.
	self assert: path equals: Path root.
	

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PathTest>>testAbsolutePrintString [
	| path actual |
	path := Path / 'plonk' / 'griffle'.
	actual := path printString.
	self assert: actual equals: 'Path / ''plonk'' / ''griffle'''
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PathTest>>testAbsoluteWithParents [
	| path allPaths |
	path := Path / 'plonk' / 'griffle' / 'nurb'.
	allPaths := path withParents.
	
	self assert: allPaths size equals: 4.
	self assert: allPaths first isRoot.
	self assert: allPaths second basename equals: 'plonk'.
	self assert: allPaths second size equals: 1.
	self assert: (allPaths second isChildOf: allPaths first).
	self assert: allPaths third basename equals: 'griffle'.
	self assert: allPaths third size equals: 2.
	self assert: (allPaths third isChildOf: allPaths second).
	self assert: allPaths fourth basename equals: 'nurb'.
	self assert: allPaths fourth size equals: 3.
	self assert: (allPaths fourth isChildOf: allPaths third).
	
	self assert: allPaths fourth equals: path.
	self assert: allPaths fourth == path
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PathTest>>testAsReference [
	| path reference |
	path := Path * 'plonk'.
	reference := path asFileReference.
	self assert: reference class equals: FileReference.
	self assert: reference path equals: path
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PathTest>>testBasename [
	| path |
	path := Path * 'plonk' / 'griffle'.
	self assert: path basename equals: 'griffle'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PathTest>>testBasenameWithoutExtension [
	"self debug: #testBasenameWithoutExtension"
	| path |
	path := Path * 'plonk' / 'griffle'.
	self assert: path basenameWithoutExtension equals: 'griffle'.
	self assert: (path basenameWithoutExtension: 'griffle') equals: 'griffle'.
	self assert: (path basenameWithoutExtension: 'taz') equals: 'griffle'.
	
	path := Path * 'plonk' / 'griffle.taz'.
	self assert: path basenameWithoutExtension equals: 'griffle'.
	self assert: (path basenameWithoutExtension: 'taz') equals: 'griffle'.
	self assert: (path basenameWithoutExtension: 'griffle.taz') equals: 'griffle.taz'.
	self assert: (path basenameWithoutExtension: 'zork') equals: 'griffle.taz'.
	
	path := Path * 'plonk' / 'griffle.taz.zork'.
	self assert: path basenameWithoutExtension equals: 'griffle.taz'.
	self assert: (path basenameWithoutExtension: 'zork') equals: 'griffle.taz'.
	self assert: (path basenameWithoutExtension: 'taz.zork') equals: 'griffle'.
	self assert: (path basenameWithoutExtension: 'girffle.taz.zork') equals: 'griffle.taz.zork'.
	self assert: (path basenameWithoutExtension: 'taz') equals: 'griffle.taz.zork'.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PathTest>>testCanonicalization [

	| ref |

	ref := (Path * 'a/b/c') canonicalize.
	self assert: ref segments equals: #('a' 'b' 'c').

	ref := (Path / 'a/b/c') canonicalize.
	self assert: ref segments equals: #('a' 'b' 'c').

	ref := (Path * '../a/b/c') canonicalize.
	self assert: ref segments equals: #('..' 'a' 'b' 'c').

	ref := (Path * 'a/b/c/..') canonicalize.
	self assert: ref segments equals: #('a' 'b').

	ref := (Path / 'a/b/c/..') canonicalize.
	self assert: ref segments equals: #('a' 'b').

	ref := (Path * 'a/b/../c') canonicalize.
	self assert: ref segments equals: #('a' 'c').

	ref := (Path / 'a/b/../c') canonicalize.
	self assert: ref segments equals: #('a' 'c').

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PathTest>>testCommaAddsExtension [
	| path result |
	path := Path * 'plonk' .
	result := path, 'griffle'.
	self assert: result basename equals: 'plonk.griffle'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PathTest>>testCommaAddsExtensionAgain [
	| path result |
	path := Path * 'plonk.griffle'.
	result := path, 'nurp'.
	self assert: result basename equals: 'plonk.griffle.nurp'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PathTest>>testContains [
	| ancestor descendent |
	ancestor := Path / 'plonk'.
	descendent := Path / 'plonk' / 'griffle' / 'bork'.
	self assert: (ancestor contains: descendent).
	self deny: (descendent contains: ancestor)
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PathTest>>testContainsLocator [
	| ancestor descendent |
	ancestor := FileLocator imageDirectory resolve path.
	descendent := FileLocator image / 'griffle'.
	self deny: (ancestor contains: descendent).
	self deny: (descendent contains: ancestor)
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PathTest>>testEqual [
	| a b |
	a := Path * 'plonk'.
	b := Path * 'plonk'.
	self deny: a == b.
	self assert: a equals: b.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PathTest>>testExtendingPath [

	| ref |

	self should: [ '/a/b' asPath / '' ] raise: Error.
	self should: [ '/a/b' asPath / nil ] raise: Error.

	ref := '/a/b/c' asPath / 'd/e'.
	self assert: ref segments equals: #('a' 'b' 'c' 'd' 'e').

	ref := '/a/b/c' asPath / 'd/e'.
	self assert: ref parent segments equals: #('a' 'b' 'c' 'd').

	ref := '/a/b/c' asPath / '../d'.
	self assert: ref segments equals:  #('a' 'b' 'c' '..' 'd').

	ref := '/a/b/c' asPath / 'd/..'.
	self assert: ref segments equals: #('a' 'b' 'c' 'd' '..').

	ref := '/a/b/c' asPath / 'd/../e'.
	self assert: ref segments equals: #('a' 'b' 'c' 'd' '..' 'e').

	ref := '/a/b/c' asPath / './d'.
	self assert: (ref segments = #('a' 'b' 'c' 'd')).

	ref := '/a/b/c' asPath / 'd/.'.
	self assert: (ref segments = #('a' 'b' 'c' 'd')).

	ref := '/a/b/c' asPath / 'd/./e'.
	self assert: ref segments equals: #('a' 'b' 'c' 'd' 'e').


]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PathTest>>testExtensions [
	self 
		assertCollection: (Path from: 'foo') extensions asArray
		equals: #().
	self
		assertCollection: (Path from: 'foo.tar') extensions asArray
		equals: #( 'tar' ).
	self
		assertCollection: (Path from: 'foo.tar.gz') extensions asArray
		equals: #( 'tar' 'gz').
	self
		assertCollection: (Path from: 'foo.1.tar.gz') extensions asArray
		equals: #( '1' 'tar' 'gz').
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PathTest>>testFullName [

	| path |

	path := (FileSystem workingDirectory / 'book-result' / 'W01-Welcome')
				relativeToReference: FileSystem workingDirectory.
	self assert: path fullName equals: 'book-result/W01-Welcome'

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PathTest>>testGrandchildOfPath [
	| griffle  nurb |
	griffle := Path / 'griffle'.
	nurb := griffle / 'plonk' / 'nurb'.
	self deny: (griffle isChildOf: nurb).
	self deny: (nurb isChildOf: griffle).
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PathTest>>testIsAbsolute [
	self assert: (Path / 'plonk') isAbsolute
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PathTest>>testIsAbsoluteWindowsPathReturnsFalseWhenNoWindowsAbsolutePathProvided [
  
	self deny: (Path isAbsoluteWindowsPath: 'tmp').
	self deny: (Path isAbsoluteWindowsPath: '/tmp').
	self deny: (Path isAbsoluteWindowsPath: '/tmp/test').
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PathTest>>testIsAbsoluteWindowsPathReturnsTrueWhenWindowsAbsolutePathProvided [
  
	self assert: (Path isAbsoluteWindowsPath: 'A:\').
	self assert: (Path isAbsoluteWindowsPath: 'c:\').
	self assert: (Path isAbsoluteWindowsPath: 'c:\test').
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PathTest>>testIsChildOfPath [
	| parent child |
	parent := Path / 'griffle'.
	child := parent / 'nurb'.
	self assert: (child isChildOf: parent).
	self deny: (parent isChildOf: child)
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PathTest>>testIsChildOfReference [
	| parent child |
	parent := Path / 'griffle'.
	child := (FileSystem memory referenceTo: parent / 'nurb').
	self deny: (child isChildOf: parent).
	self deny: (parent isChildOf: child)
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PathTest>>testIsEmpty [
	self assert: (Path workingDirectory) isEmpty
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PathTest>>testIsNotAbsolute [
	self deny: (Path * 'plonk') isAbsolute
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PathTest>>testIsNotRelative [
	self deny: (Path / 'plonk') isRelative
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PathTest>>testIsNotRoot [
	self deny: (Path / 'plonk') isRoot
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PathTest>>testIsRelative [
	self assert: (Path * 'plonk') isRelative
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PathTest>>testIsRoot [
	self assert: Path root isRoot
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PathTest>>testMakeRelative [
	"self run: #testMakeRelative"
	
	| parent child relative |
	parent := Path / 'griffle' / 'bibb'.
	child := Path / 'griffle' / 'plonk' / 'nurp'.
	relative := parent makeRelative: child.
	self assert: relative equals: (Path parent / 'plonk' / 'nurp')
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PathTest>>testMakeRelativeFrom2RelativePaths [
	"Related to issue: 14846 MakeRelative-method-applied-on-two-relative-paths-is-not-working"

	| parent child relative |
	parent := RelativePath new / 'griffle' / 'bibb'.
	child := RelativePath new / 'griffle' / 'plonk' / 'nurp'.
	relative := parent makeRelative: child.
	self assert: relative equals: Path parent / 'plonk' / 'nurp'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PathTest>>testParent [
	| path parent |
	path := (Path * 'plonk') / 'griffle'.
	parent := path parent.
	self assert: parent isRelative.
	self assert: (parent at: 1) equals: 'plonk'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PathTest>>testParentParent [
	| path  |
	path := (Path * '..') parent.
	self assert: path size equals: 2.
	self assert: (path at: 1) equals: '..'.
	self assert: (path at: 2) equals: '..'.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PathTest>>testParentResolution [
	| base relative absolute |
	base := Path / 'plonk' / 'pinto'.
	relative := Path parent / 'griffle' / 'zonk'.
	absolute := base resolve: relative.
	self assert: absolute isAbsolute.
	self assert: absolute segments equals: #('plonk' 'pinto' '..' 'griffle' 'zonk').

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PathTest>>testParentUpTo [
	| a b c |
	a := Path / 'testParentUpTo' / 'A'.
	b := Path / 'testParentUpTo' / 'A' / 'B'.
	c := Path / 'testParentUpTo' / 'A' / 'B' / 'C'.
	self assert: b equals: (c parentUpTo: 'B').
	self assert: a equals: (c parentUpTo: 'A').
	self assert: Path / 'testParentUpTo' equals: (c parentUpTo: 'testParentUpTo').
	self assert: Path root equals: (c parentUpTo: 'notAParent')
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PathTest>>testParse [
	"self run: #testParse"
	
	| path |
	path := Path from: 'parent/child/grandChild' delimiter: $/.
	self assert: path size equals: 3.
	self assert: (path at: 1) equals: 'parent'.
	self assert: (path at: 2) equals: 'child'.
	self assert: (path at: 3) equals: 'grandChild'.
	

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PathTest>>testParseBogus [
	"self run: #testParseBogus"
	
	| path |
	path := Path from: 'parent?<>~ \child/grandChild' delimiter: $/.
	self assert: path size equals: 2.
	self assert: (path at: 1) equals: 'parent?<>~ \child'.
	self assert: (path at: 2) equals: 'grandChild'.
	

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PathTest>>testParseTrailingSlash [
	| path |
	path := Path from: 'griffle/' delimiter: $/.
	self assert: path size equals: 1.
	self assert: (path at: 1) equals: 'griffle'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PathTest>>testParseWindowsPathWithUnixDelimiters [
	"self run: #testParse"
	
	| path |
	path := WindowsStore new pathFromString: 'C:\a/b/c'.
	self assert: path segments size equals: 4.
	self
		assertCollection: path segments
		equals: #('C:' 'a' 'b' 'c')

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PathTest>>testPathString [

	| path |

	path := (FileSystem workingDirectory / 'book-result' / 'W01-Welcome')
				relativeToReference: FileSystem workingDirectory.
	self assert: path isRelative.
	self assert: path pathString equals: 'book-result/W01-Welcome'

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PathTest>>testPrintPathOn [

	| pathString pathSrc path |

	"Test a Relative path"
	pathSrc := 'one/two/three'.
	path := Path from: pathSrc.
	self assert: path isRelative.
	pathString := String streamContents: [ :stream | path printPathOn: stream ].
	self assert: pathSrc equals: pathString.

	"Test an Absolute path"
	pathSrc := '/one/two/three'.
	path := Path from: pathSrc.
	self assert: path isAbsolute.
	pathString := String streamContents: [ :stream | path printPathOn: stream ].
	self assert: pathSrc equals: pathString
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PathTest>>testPrintPathOnDelimiter [

	| pathString pathSrc path |

	"Test a Relative path"
	"Use an unusal delimiter to check that the default isn't hardcoded anywhere"
	pathSrc := 'one|two|three'.
	path := Path from: pathSrc delimiter: $|.
	self assert: path isRelative.
	pathString := String streamContents: [ :stream | path printPathOn: stream delimiter: $| ].
	self assert: pathSrc equals: pathString.

	"Test an Absolute path"
	"Use an unusal delimiter to check that the default isn't hardcoded anywhere"
	pathSrc := '|one|two|three'.
	path := Path from: pathSrc delimiter: $|.
	self assert: path isAbsolute.
	pathString := String streamContents: [ :stream | path printPathOn: stream delimiter: $| ].
	self assert: pathSrc equals: pathString
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PathTest>>testPrintRelativeWithParent [
	| path |
	path := Path parent / 'foo'.
	self assert: (path printWithDelimiter: $/) equals: '../foo'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PathTest>>testPrintWithDelimiter [
	| path |
	path := (Path * 'plonk') / 'griffle'.
	self assert: (path printWithDelimiter: $%) equals: 'plonk%griffle'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PathTest>>testRedundantSeparators [

	| ref |

	ref := '/a/b/c' asPath / 'foo/'.
	self assert: ref segments equals: #('a' 'b' 'c' 'foo').

	ref := '/a/b/c' asPath / 'foo//'.
	self assert: ref segments equals: #('a' 'b' 'c' 'foo').

	ref := '/a/b/c' asPath / 'foo//..'.
	self assert: ref segments equals: #('a' 'b' 'c' 'foo' '..').

	ref := '/a/b/c' asPath / '..//foo'.
	self assert: ref segments equals: #('a' 'b' 'c' '..' 'foo').

	ref := '/a/b/c' asPath / 'foo//..//bar'.
	self assert: ref segments equals: #('a' 'b' 'c' 'foo' '..' 'bar')
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PathTest>>testRelativeFromString [

	| path |
	
	path := Path from: 'plonk/griffle'.
	
	self assert: path isRelative.
	self assert: path size equals: 2.
	self assert: (path at: 1) equals: 'plonk'.
	self assert: (path at: 2) equals: 'griffle'.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PathTest>>testRelativeFromStringNormalization [

	| path |
	
	path := Path from: 'plonk/../griffle'.
	
	self assert: path isRelative.
	self assert: path size equals: 3.
	self assert: path segments equals: #('plonk' '..' 'griffle').
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PathTest>>testRelativeFromStringNormalizationParent [

	| path |
	
	path := Path from: 'plonk/../../griffle'.
	
	self assert: path isRelative.
	self assert: path size equals: 4.
	self assert: path segments equals: #('plonk' '..' '..' 'griffle')
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PathTest>>testRelativeFromStringParent [

	| path |
	
	path := Path from: '../..'.
	
	self assert: path isRelative.
	self assert: path size equals: 2.
	self assert: (path at: 1) equals: '..'.
	self assert: (path at: 2) equals: '..'.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PathTest>>testRelativePrintString [
	| path actual |
	path := Path * 'plonk' / 'griffle'.
	actual := path printString.
	self assert: actual equals: 'Path * ''plonk'' / ''griffle'''
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PathTest>>testRelativeTo [
	"self run: #testRelativeTo"
	"aPath relativeTo: aParent returns a new path relative to the parent"
	
	| parent child relative |
	parent := Path / 'griffle'.
	child := Path / 'griffle' / 'plonk' / 'nurp'.
	relative := child relativeTo: parent.
	self assert: relative equals: (Path * 'plonk' / 'nurp')
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PathTest>>testRelativeToBranch [
	| parent child relative |
	parent := Path / 'griffle' / 'bibb'.
	child := Path / 'griffle' / 'plonk' / 'nurp'.
	relative := child relativeTo: parent.
	self assert: relative  equals: (Path parent / 'plonk' / 'nurp')
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PathTest>>testRelativeWithParents [
	| path allPaths |
	path := Path * 'plonk' / 'griffle' / 'nurb'.
	allPaths := path withParents.
	
	self assert: allPaths size equals: 3.
	self assert: allPaths first basename equals: 'plonk'.
	self assert: allPaths first size equals: 1.
	self assert: allPaths second basename equals: 'griffle'.
	self assert: allPaths second size equals: 2.
	self assert: (allPaths second isChildOf: allPaths first).
	self assert: allPaths third basename equals: 'nurb'.
	self assert: allPaths third size equals: 3.
	self assert: (allPaths third isChildOf: allPaths second).
	self assert: allPaths third == path
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PathTest>>testResolveAbsolute [
	| path |
	path := Path / 'griffle'.
	self assert: path resolve == path.
	self assert: path isAbsolute
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PathTest>>testResolvePath [
	"self debug: #testResolvePath"
	
	| path |
	path := Path / 'grandfather' / 'father' / 'child'.
	self 
		assert: (path resolvePath: Path / 'grandfather') 
		equals: (Path / 'grandfather').
	self 
		assert: (path resolvePath: Path / 'child')
		equals: (Path / 'child').
	self
		assert: (path resolvePath: Path * 'grandfather')
		equals: (Path / 'grandfather' / 'father' / 'child' / 'grandfather').
	self
		assert: (path resolvePath: Path * 'child')
		equals: (Path / 'grandfather' / 'father' / 'child' / 'child').
	self
		assert: (path resolvePath: Path * 'grandfather')
		equals: (Path / 'grandfather' / 'father' / 'child' / 'grandfather').
	self
		assert: (path resolvePath: Path * 'child')
		equals: (Path / 'grandfather' / 'father' / 'child' / 'child').
	self
		assert:  (path resolvePath: (Path parent) / '..') canonicalize
		equals: (Path / 'grandfather')
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PathTest>>testResolveRelative [
	| path |
	path := Path * 'griffle'.
	self assert: path resolve == path.
	self assert: path isRelative
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PathTest>>testResolveString [
	"self debug: #testResolveString"

	| path result |
	path := Path * 'plonk'.
	result := path resolve: 'griffle'.
	self assert: result class equals: path class.
	self assert: result size equals: 2.
	self assert: (result at: 1) equals: 'plonk'.
	self assert: (result at: 2) equals: 'griffle'.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PathTest>>testRootParent [
	| root |
	root := Path root.
	self assert: root parent == root
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PathTest>>testRootPrintString [
	| path actual |
	path := Path root.
	actual := path printString.
	self assert: actual equals: 'Path root'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PathTest>>testSiblingOfPath [
	| griffle  nurb |
	griffle := Path / 'griffle'.
	nurb := Path / 'nurb'.
	self deny: (griffle isChildOf: nurb).
	self deny: (nurb isChildOf: griffle).
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PathTest>>testSimpleResolution [
	| base relative absolute |
	base := Path / 'plonk'.
	relative := (Path * 'griffle') / 'zonk'.
	absolute := base resolve: relative.
	self assert: absolute isAbsolute.
	self assert: (absolute at: 1) equals: 'plonk'.
	self assert: (absolute at: 2) equals: 'griffle'.
	self assert: (absolute at: 3) equals: 'zonk'.

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PathTest>>testSlash [
	| path actual |
	path := Path * 'plonk'.
	actual := path / 'griffle'.
	self assert: actual class equals: path class.
	self assert: (actual printWithDelimiter: $/) equals: 'plonk/griffle'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PathTest>>testUnequalContent [
	| a b |
	a := Path * 'plonk'.
	b := Path * 'griffle'.
	self deny: a = b.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PathTest>>testUnequalSize [
	| a b |
	a := Path * 'plonk'.
	b := (Path * 'plonk') / 'griffle'.
	self deny: a = b.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PathTest>>testUnixAbsolutePathName [

	self assert: (Path from: '/test') isAbsolute.
	self assert: (Path from: '/etc/bin') isAbsolute.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PathTest>>testWindowsAbsolutePathName [
  
	self assert: (Path from: 'A:\') isAbsolute.
	self assert: (Path from: 'c:\') isAbsolute.
	self assert: (Path from: 'c:\test') isAbsolute.
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PathTest>>testWithExtentionAddsExtension [
	| path result |
	path := Path * 'plonk'.
	result := path withExtension: 'griffle'.
	self assert: result basename equals: 'plonk.griffle'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PathTest>>testWithExtentionReplacesExtension [
	| path result |
	path := Path * 'plonk.griffle'.
	result := path withExtension: 'griffle'.
	self assert: result basename equals: 'plonk.griffle'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PathTest>>testWorkingDirPrintString [
	| path actual |
	path := Path workingDirectory. 
	actual := path printString.
	self assert: actual equals: 'Path workingDirectory'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:29'
}
PathTest>>testWorkingDirectoryParent [
	| path |
	path := Path workingDirectory parent.
	self assert: path size equals: 1.
	self assert: (path at: 1) equals: '..'
]
