"
I am ZdcPluginMissing, signaled when a plugin required by Zodiac is missing.

You can find more information on Zodiac's website

	http://zdc.stfx.eu
"
Class {
	#name : #ZdcPluginMissing,
	#superclass : #Error,
	#category : #Zodiac-Core,
	#timestamp : '<historical>'
}

{
	#category : #printing,
	#timestamp : ' 8/31/2017 07:16:46'
}
ZdcPluginMissing>>messageText [
	^ 'SSL/TLS plugin initailization failed (VM plugin missing ? OS libraries missing ?)'
]
