"
I am a class defining the current shortcuts of the system. My main purpose is to avoid the duplication of shortcut definition amongst basic tools and to allow to change the shortcuts from a single place.

Users may query me to know the key combinations used to accept or cancel an action, browse or inspect an object.

EXAMPLES

PharoShortcuts current browseShortcut => Cmd-B

ATTENTION - I'm not still finished. My #current method returns always a new instance of myself instead of a configured one.

NEXT Steps: Allow one to configure the shortcuts and to define several shortcut configurations via settings.
"
Class {
	#name : #PharoShortcuts,
	#superclass : #Object,
	#category : #Tool-Base,
	#timestamp : 'GuillermoPolito 8/10/2014 14:16'
}

{
	#category : #accessing,
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts class>>current [

	^ self new
]

{
	#category : #'keymaps - editor edit',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>acceptShortcut [

	^ $s meta
]

{
	#category : #'keymaps - code',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>argAdvanceShortcut [
	^ $a meta shift
]

{
	#category : #'keymaps - editor edit',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>backspaceShortcut [

	^ Character backspace asShortcut
]

{
	#category : #'keymaps - editor navigation',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>backwardCharShortcut [

	^ Character arrowLeft asShortcut
]

{
	#category : #'keymaps - editor navigation',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>backwardLineShortcut [

	^ Character arrowUp asShortcut
]

{
	#category : #'keymaps - editor edit',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>backwardWordDeleteShortcut [

	^ Character backspace shift
]

{
	#category : #'keymaps - editor navigation',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>backwardWordShortcut [
	^ Character arrowLeft meta
]

{
	#category : #'keymaps - code search',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>browseClassReferencesShortcut [

	^ $n meta shift
]

{
	#category : #'keymaps - code search',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>browseImplementorsShortcut [

	^ $m meta
]

{
	#category : #'keymaps - code search',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>browseMethodHierarchyShortcut [

	^ $i meta
]

{
	#category : #'keymaps - code search',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>browseReferencesShortcut [

	^ $b meta shift
]

{
	#category : #'keymaps - code search',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>browseSendersShortcut [

	^ $n meta
]

{
	#category : #'keymaps - code search',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>browseShortcut [

	^ $b meta
]

{
	#category : #'keymaps - code search',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>browseVersionsShortcut [

	^ $v meta
]

{
	#category : #'keymaps - editor edit',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>cancelShortcut [

	^ $l meta
]

{
	#category : #'keymaps - editor style',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>changeStyleShortcut [

	^ $k meta shift
]

{
	#category : #'keymaps - window',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>closeWindowShortcut [

	^ $w meta
]

{
	#category : #'keymaps - editor edit',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>compareToClipboardShortcut [

	^ $c meta shift
]

{
	#category : #'keymaps - editor edit',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>copySelectionShortcut [

	^ $c meta
]

{
	#category : #'keymaps - editor navigation',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>cursorEndShortcut [

	^ Character end meta
]

{
	#category : #'keymaps - editor navigation',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>cursorHomeShortcut [

	^ Character home meta
]

{
	#category : #'keymaps - editor edit',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>cutShortcut [

	^ $x meta
]

{
	#category : #'keymaps - code',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>debugItShortcut [

	^  $d meta shift
]

{
	#category : #'keymaps - editor style',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>decreaseKerningShortcut [

	^ $9 meta
]

{
	#category : #'keymaps - editor edit',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>delShortcut [

	^ Character delete asShortcut
]

{
	#category : #'as yet unclassified',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>delWordShortcut [

	^ Character delete shift asShortcut
]

{
	#category : #'keymaps - code',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>displayIfFalseShortcut [

	^ $f alt
]

{
	#category : #'keymaps - code',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>displayIfTrueShortcut [

	^ $t alt win | $t alt unix | $t option mac
]

{
	#category : #'keymaps - code',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>doItShortcut [

	^ $d meta
]

{
	#category : #'keymaps - editor edit',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>duplicateFromSelectionShortcut [

	^ $d meta shift
]

{
	#category : #'keymaps - editor edit',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>escapeShortcut [

	^ Character escape asShortcut
]

{
	#category : #'keymaps - editor edit',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>exchangeSelectionShortcut [

	^ $e meta
]

{
	#category : #'keymaps - code',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>fileItInShortcut [

	^ $g alt win | $g alt unix | $g option mac
]

{
	#category : #'keymaps - editor navigation',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>findAgainShortcut [
	^ $g meta
]

{
	#category : #'keymaps - editor navigation',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>findShortcut [
	^ $f meta
]

{
	#category : #'keymaps - editor edit',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>formatCodeShortcut [

	^ $f meta shift
]

{
	#category : #'keymaps - editor navigation',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>forwardCharShortcut [

	^ Character arrowRight asShortcut
]

{
	#category : #'keymaps - editor navigation',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>forwardLineShortcut [

	^ Character arrowDown asShortcut
]

{
	#category : #'keymaps - editor navigation',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>forwardWordShortcut [
	^ Character arrowRight meta
]

{
	#category : #'keymaps - editor style',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>increaseKerningShortcut [

	^ $= meta
]

{
	#category : #'keymaps - editor edit',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>indentShortcut [

	^ $r meta shift
]

{
	#category : #'keymaps - code',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>inspectItShortcut [

	^ $i meta
]

{
	#category : #'keymaps - editor navigation',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>lineEndShortcut [

	^ Character end asShortcut
]

{
	#category : #'keymaps - editor navigation',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>lineStartShortcut [

	^ Character home asShortcut
]

{
	#category : #'keymaps - editor edit',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>makeCapitalizedShortcut [

	^ $z meta shift
]

{
	#category : #'keymaps - editor edit',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>makeLowercaseShortcut [

	^ $x meta shift
]

{
	#category : #'keymaps - editor edit',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>makeUppercaseShortcut [

	^ $y meta shift
]

{
	#category : #'keymaps - code search',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>methodNamesContainingItShortcut [

	^  $w meta shift
]

{
	#category : #'keymaps - code search',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>methodStringContainingItShortcut [

	^  $e meta shift
]

{
	#category : #'keymaps - editor style',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>normalEmphasisShortcut [

	^ $0 meta
]

{
	#category : #'keymaps - editor style',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>openFontAlignmentMenuShortcut [

	^ $u meta
]

{
	#category : #'keymaps - editor style',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>openFontColorMenuShortcut [

	^ $6 meta
]

{
	#category : #'keymaps - editor style',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>openFontMenuShortcut [

	^ $k meta shift
]

{
	#category : #'keymaps - Tools',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>openKomitterShortcut [
	^ $o meta, $k meta
]

{
	#category : #'keymaps - Tools',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>openMonticielloShortcut [
	^ $o meta, $p meta
]

{
	#category : #'keymaps - Tools',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>openPlaygroundShortcut [
	^ $o meta, $w meta
]

{
	#category : #'keymaps - Tools',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>openSettingsShortcut [
	^ $o meta, $s meta
]

{
	#category : #'keymaps - Tools',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>openSystemBrowserShortcut [
	^ $o meta , $b meta
]

{
	#category : #'keymaps - Tools',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>openTestRunnerShortcut [
	^ $o meta , $u meta
]

{
	#category : #'keymaps - Tools',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>openTranscriptShortcut [
	^ $o meta , $t meta
]

{
	#category : #'keymaps - editor edit',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>outdentShortcut [

	^ $l meta shift
]

{
	#category : #'keymaps - editor navigation',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>pageDownShortcut [

	^ Character pageDown asShortcut
]

{
	#category : #'keymaps - editor navigation',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>pageUpShortcut [

	^ Character pageUp asShortcut
]

{
	#category : #'keymaps - code',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>pasteInitialsShortcut [

	^ $v alt win | $v alt unix | $v option mac
]

{
	#category : #'keymaps - editor edit',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>pasteShortcut [

	^ $v meta
]

{
	#category : #'keymaps - code',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>printItShortcut [

	^ $p meta
]

{
	#category : #'keymaps - code search',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>querySymbolShortcut [

	^  $q meta shift
]

{
	#category : #'keymaps - editor edit',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>redoShortcut [

	^ $z meta shift
]

{
	#category : #'keymaps - code',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>removeShortcut [

	^ $x meta
]

{
	#category : #'keymaps - debugger',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>restartExecutionShortcut [

	^ $a meta shift
]

{
	#category : #'keymaps - debugger',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>resumeExecutionShortcut [

	^ $r meta
]

{
	#category : #'keymaps - Tools',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>saveImageShortcut [
	^ $s meta shift
]

{
	#category : #'keymaps - editor navigation',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>searchShortcut [
	^ $s meta
]

{
	#category : #'keymaps - editor edit',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>selectAllShortcut [

	^ $a meta
]

{
	#category : #'keymaps - editor selection',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>selectBackwardCharShortcut [

	^ Character arrowLeft shift
]

{
	#category : #'keymaps - editor selection',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>selectBackwardLineShortcut [

	^ Character arrowUp shift
]

{
	#category : #'keymaps - editor selection',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>selectBackwardWordShortcut [
	^ Character arrowLeft meta shift
]

{
	#category : #'keymaps - editor selection',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>selectForwardCharShortcut [

	^ Character arrowRight shift
]

{
	#category : #'keymaps - editor selection',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>selectForwardLineShortcut [

	^ Character arrowDown shift
]

{
	#category : #'keymaps - editor selection',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>selectForwardWordShortcut [
	^ Character arrowRight shift meta
]

{
	#category : #'keymaps - editor selection',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>selectLineEndShortcut [
	^ Character end shift
]

{
	#category : #'keymaps - editor selection',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>selectLineStartShortcut [
	^ Character home shift
]

{
	#category : #'keymaps - editor selection',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>selectPageDownShortcut [

	^ Character pageDown shift
]

{
	#category : #'keymaps - editor selection',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>selectPageUpShortcut [

	^ Character pageUp shift
]

{
	#category : #'keymaps - editor selection',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>selectTextEndShortcut [

	^ Character end shift meta
	 
]

{
	#category : #'keymaps - editor selection',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>selectTextStartShortcut [
	^ Character home shift meta
]

{
	#category : #'keymaps - editor edit',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>selectUndoShortcut [

	^ $m meta shift
]

{
	#category : #'keymaps - editor edit',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>selectWordShortcut [

	^ Character space meta
]

{
	#category : #'keymaps - editor navigation',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>setSearchStringShortcut [
	^ $h meta
]

{
	#category : #'keymaps - debugger',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>stepIntoShortcut [

	^ $e meta 
]

{
	#category : #'keymaps - debugger',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>stepOverShortcut [

	^ $o meta shift
]

{
	#category : #'keymaps - debugger',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>stepThroughShortcut [

	^ $t meta shift
]

{
	#category : #'keymaps - editor style',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>strokethroughShortcut [

	^ $= meta
]

{
	#category : #'keymaps - editor edit',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>swapCharsShortcut [

	^ $y meta
]

{
	#category : #'keymaps - editor navigation',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>textEndShortcut [

	^ Character end meta
	 
]

{
	#category : #'keymaps - editor navigation',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>textStartShortcut [

	^ Character home meta

]

{
	#category : #'keymaps - editor style',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>toggleBoldEmphasisShortcut [

	^ $7 meta
]

{
	#category : #'keymaps - editor edit',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>toggleCommentOnSelectionOrLine [

	^ $/ meta
]

{
	#category : #'keymaps - editor style',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>toggleItalicEmphasisShortcut [

	^ $8 meta
]

{
	#category : #'keymaps - editor style',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>underlineShortcut [

	^ $_ meta
]

{
	#category : #'keymaps - editor edit',
	#timestamp : ' 8/31/2017 05:26:18'
}
PharoShortcuts>>undoShortcut [

	^ $z meta
]
