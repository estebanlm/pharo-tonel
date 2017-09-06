"
This class changes the default compiler used to compile itself to include the AST transforming plugin ASTPluginMeaningOfLife.

#example42 does not mean what you think it means (see bytecode)
"
Class {
	#name : #ASTTransformExamplePluginActive,
	#superclass : #Object,
	#category : #OpalCompiler-Tests-Plugins,
	#timestamp : 'MarcusDenker 2/28/2015 16:02'
}

{
	#category : #compiler,
	#timestamp : ' 8/31/2017 05:26:31'
}
ASTTransformExamplePluginActive class>>compiler [
	"the example plugin is active for this class"
	^super compiler addPlugin: ASTPluginMeaningOfLife.
]

{
	#category : #example,
	#timestamp : ' 8/31/2017 05:26:31'
}
ASTTransformExamplePluginActive>>example42 [
	^42
]
