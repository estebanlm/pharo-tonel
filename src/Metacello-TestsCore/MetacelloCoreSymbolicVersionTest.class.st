"

"
Class {
	#name : #MetacelloCoreSymbolicVersionTest,
	#superclass : #TestCase,
	#category : #Metacello-TestsCore-Configs,
	#timestamp : ''
}

{
	#category : #baselines,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloCoreSymbolicVersionTest>>baseline10: spec [
    <version: '1.0-baseline'>
    spec
        for: #'common'
        do: [ 
            spec blessing: #'baseline'.
            spec
                project: 'Example Project'
                with: [ 
                    spec
                        className: 'MetacelloExampleProjectConfig';
                        versionString: '1.0-baseline';
                        preLoadDoIt: #'preloadForProject';
                        postLoadDoIt: #'postloadForProject';
                        yourself ] ]
]

{
	#category : #baselines,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloCoreSymbolicVersionTest>>baseline20: spec [
    <version: '2.0-baseline'>
    spec
        for: #'common'
        do: [ 
            spec blessing: #'baseline'.
            spec
                project: 'Example Project'
                with: [ 
                    spec
                        className: 'MetacelloExampleProjectConfig';
                        versionString: '1.0-baseline';
                        preLoadDoIt: #'preloadForProject';
                        postLoadDoIt: #'postloadForProject';
                        yourself ] ]
]

{
	#category : #versions,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloCoreSymbolicVersionTest>>bleedingEdge: spec [
    <symbolicVersion: #'bleedingEdge'>
    spec for: #'platformVersion1.x' version: '1.0-baseline'
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloCoreSymbolicVersionTest>>project [

	^self projectWith: #()
]

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloCoreSymbolicVersionTest>>projectWith: projectAttributes [
    | project |
    "Construct Metacello project"
    project := MetacelloProject new.
    project projectAttributes: projectAttributes.
    MetacelloVersionConstructor on: self project: project.
    ^ project
]

{
	#category : #versions,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloCoreSymbolicVersionTest>>stableVersion: spec [
    <symbolicVersion: #'stable'>
    spec for: #'platformVersion1.x' version: '1.0'
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloCoreSymbolicVersionTest>>testBasicBleedingEdgeVersion [
    | project version wc expected actual |
    project := self projectWith: #(#'platformVersion1.x').
    version := project version: #'bleedingEdge'.
    expected := 'spec blessing: #''baseline''.
spec project: ''Example Project'' with: [
		spec
			className: ''MetacelloExampleProjectConfig'';
			versionString: ''1.0-baseline'';
			preLoadDoIt: #''preloadForProject'';
			postLoadDoIt: #''postloadForProject'' ].'.
    actual := version spec printString.
    self assert: expected = actual
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloCoreSymbolicVersionTest>>testBasicStableVersion [
    | project version wc expected actual |
    project := self projectWith: #(#'platformVersion1.x').
    version := project version: #'stable'.
    expected := 'spec blessing: #''release''.
spec project: ''Example Project'' with: [
		spec
			className: ''MetacelloExampleProjectConfig'';
			versionString: ''1.0-baseline'';
			preLoadDoIt: #''preloadForProject'';
			postLoadDoIt: #''postloadForProject'' ].'.
    actual := version spec printString.
    self assert: expected = actual
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloCoreSymbolicVersionTest>>testBleedingEdgeMethod [
    | project version |
    project := self projectWith: #(#'platformVersion1.x').
    self assert: (project version: #'bleedingEdge') = project bleedingEdge
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloCoreSymbolicVersionTest>>testStableVersionMethod [
    | project version |
    project := self projectWith: #(#'platformVersion1.x').
    self assert: (project version: #'stable') = project stableVersion
]

{
	#category : #versions,
	#timestamp : ' 8/31/2017 05:26:32'
}
MetacelloCoreSymbolicVersionTest>>version10: spec [
    <version: '1.0' imports: #('1.0-baseline')>
    spec for: #'common' do: [ spec blessing: #'release' ]
]
