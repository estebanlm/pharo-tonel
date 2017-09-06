"
I am a tool that visually represents an MCVersion. 

While I can be opened on anMCVersion, you've probably seen me most often after saving a package in the Monticello Browser. 

I have buttons to perform common version-related actions - like browsing, loading, and viewing changes. In my main text area, I display the following information about my version - name, author, timestamp, UUID, ancestors and log message.
"
Class {
	#name : #MCVersionInspector,
	#superclass : #MCTool,
	#instVars : [
		'version'
	],
	#category : #MonticelloGUI,
	#timestamp : '<historical>'
}

{
	#category : #icons,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCVersionInspector class>>taskbarIconName [
	"Answer the icon for the receiver in a task bar."

	^ #smallSaveIcon
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCVersionInspector>>adopt [
	(self confirm:
'Modifying ancestry can be dangerous unless you know
what you are doing.  Are you sure you want to adopt
',self version info name, ' as an ancestor of your working copy?')
		ifTrue: [self version adopt]
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCVersionInspector>>browse [

	^ self version browse
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCVersionInspector>>buttonSpecs [
       ^ #((Browse browse 'Browse this version' hasVersion)
               (History history 'Browse the history of this version' hasVersion)
               (Changes changes 'Browse the changes this version would make to the
image' hasVersion)
               (Load load 'Load this version into the image' hasVersion)
               (Merge merge 'Merge this version into the image' hasVersion)
               (Adopt adopt 'Adopt this version as an ancestor of your working copy'
hasVersion)
               (Copy save 'Copy this version to another repository' hasVersion)
               (Diff diff 'Create an equivalent version based on an earlier release'
hasVersion))
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCVersionInspector>>changes [
	"Open a patch morph for the changes."
	
	self
		viewChanges: self version changes
		from: self version workingCopy description
		to: self version info name
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCVersionInspector>>defaultLabel [
	^ 'Version: ', self version info name
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCVersionInspector>>diff [
	| ancestorVersion |
	self pickAncestor ifNotNil:
		[:ancestor |
		ancestorVersion := self version workingCopy repositoryGroup versionWithInfo: ancestor.
		(self version asDiffAgainst: ancestorVersion) open]
]

{
	#category : #testing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCVersionInspector>>hasVersion [
	^version notNil
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCVersionInspector>>history [
	(MCVersionHistoryBrowser new ancestry: self versionInfo) show
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCVersionInspector>>initialExtent [
	^ 400@200
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCVersionInspector>>load [
	Cursor wait showWhile: [self version load]
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCVersionInspector>>merge [
	self version merge
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCVersionInspector>>pickAncestor [
	| index versions |
	versions := self version info breadthFirstAncestors.
	index := UIManager default chooseFrom: (versions collect: [:ea | ea name])
				title: 'Ancestor:'.
	^ index = 0 ifFalse: [versions at: index]
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCVersionInspector>>pickRepository [
	| index |
	index := UIManager default chooseFrom: (self repositories collect: [:ea | ea description])
				title: 'Repository:'.
	^ index = 0 ifFalse: [self repositories at: index]
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCVersionInspector>>repositories [
	^ MCRepositoryGroup default repositories
]

{
	#category : #actions,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCVersionInspector>>save [
	
	self pickRepository 
		ifNotNil: [ :ea | 
			self version dependencies do: [ :each | ea storeVersion: each resolve ]. 
			ea storeVersion: self version ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCVersionInspector>>summary [
	^self hasVersion
		ifTrue: [ self versionSummary ]
		ifFalse: [ String new ]
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCVersionInspector>>version [
	^ version
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCVersionInspector>>version: aVersion [
	version := aVersion
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCVersionInspector>>versionInfo [
	^ self version info
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:23'
}
MCVersionInspector>>versionSummary [
	^ self version summary
]

{
	#category : #'morphic ui',
	#timestamp : ' 8/31/2017 05:26:23'
}
MCVersionInspector>>widgetSpecs [
	^ #(
		((buttonRow) (0 0 1 0) (0 0 0 30))
		((textMorph: summary) (0 0 1 1) (0 30 0 0))
		)
]
