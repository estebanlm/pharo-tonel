"
I read several parameters related to the default web browser network preferences, through the InternetConfigPlugin VM module.

For example, to get the default path where downloaded files should be placed:

InternetConfiguration getDownloadPath.

Seems to work only on MacOSX
"
Class {
	#name : #InternetConfiguration,
	#superclass : #Object,
	#category : #Network-Kernel,
	#timestamp : 'LaurentLaffont 6/8/2011 22:17'
}

{
	#category : #'HTTP Proxy',
	#timestamp : ' 8/31/2017 07:16:32'
}
InternetConfiguration class>>configureHttpProxy [

	self useHTTPProxy 
		ifTrue: [ self setHttpProxy ]
		ifFalse: [ NetworkSystemSettings useHTTPProxy: false ]
]

{
	#category : #lookups,
	#timestamp : ' 8/31/2017 07:16:32'
}
InternetConfiguration class>>getArchiePreferred [
	"Return the preferred Archie server"
	"InternetConfiguration getArchiePreferred"

	^self primitiveGetStringKeyedBy: 'ArchiePreferred'

]

{
	#category : #lookups,
	#timestamp : ' 8/31/2017 07:16:32'
}
InternetConfiguration class>>getDownloadPath [
	"Return the download path"
	"InternetConfiguration getDownloadPath"

	^self primitiveGetStringKeyedBy: 'DownLoadPath'

]

{
	#category : #lookups,
	#timestamp : ' 8/31/2017 07:16:32'
}
InternetConfiguration class>>getEmail [
	"Return the  email address of user"
	"InternetConfiguration getEmail"

	^self primitiveGetStringKeyedBy: 'Email'

]

{
	#category : #lookups,
	#timestamp : ' 8/31/2017 07:16:32'
}
InternetConfiguration class>>getFTPHost [
	"Return the FTPHost"
	"InternetConfiguration getFTPHost"

	^self primitiveGetStringKeyedBy: 'FTPHost'

]

{
	#category : #lookups,
	#timestamp : ' 8/31/2017 07:16:32'
}
InternetConfiguration class>>getFTPProxyAccount [
	"Return the second level FTP proxy authorisation"
	"InternetConfiguration getFTPProxyAccount"

	^self primitiveGetStringKeyedBy: 'FTPProxyAccount'

]

{
	#category : #lookups,
	#timestamp : ' 8/31/2017 07:16:32'
}
InternetConfiguration class>>getFTPProxyHost [
	"Return the FTP proxy host"
	"InternetConfiguration getFTPProxyHost"

	^self primitiveGetStringKeyedBy: 'FTPProxyHost'

]

{
	#category : #lookups,
	#timestamp : ' 8/31/2017 07:16:32'
}
InternetConfiguration class>>getFTPProxyPassword [
	"Return the FTP proxy password"
	"InternetConfiguration getFTPProxyPassword"

	^self primitiveGetStringKeyedBy: 'FTPProxyPassword'

]

{
	#category : #lookups,
	#timestamp : ' 8/31/2017 07:16:32'
}
InternetConfiguration class>>getFTPProxyUser [
	"Return the first level FTP proxy authorisation"
	"InternetConfiguration getFTPProxyUser"

	^self primitiveGetStringKeyedBy: 'FTPProxyUser'

]

{
	#category : #lookups,
	#timestamp : ' 8/31/2017 07:16:32'
}
InternetConfiguration class>>getFingerHost [
	"Return the default finger server"
	"InternetConfiguration getFingerHost"

	^self primitiveGetStringKeyedBy: 'FingerHost'

]

{
	#category : #lookups,
	#timestamp : ' 8/31/2017 07:16:32'
}
InternetConfiguration class>>getGopherHost [
	"Return the default Gopher server"
	"InternetConfiguration getGopherHost"

	^self primitiveGetStringKeyedBy: 'GopherHost'

]

{
	#category : #lookups,
	#timestamp : ' 8/31/2017 07:16:32'
}
InternetConfiguration class>>getGopherProxy [
	"Return the  Gopher proxy"
	"InternetConfiguration getGopherProxy"

	^self primitiveGetStringKeyedBy: 'GopherProxy'

]

{
	#category : #lookups,
	#timestamp : ' 8/31/2017 07:16:32'
}
InternetConfiguration class>>getHTTPProxyHost [
	"Return the http proxy for this client."
	"InternetConfiguration getHTTPProxyHost"

	^self primitiveGetStringKeyedBy: 'HTTPProxyHost'

]

{
	#category : #lookups,
	#timestamp : ' 8/31/2017 07:16:32'
}
InternetConfiguration class>>getIRCHost [
	"Return the Internet Relay Chat server"
	"InternetConfiguration getIRCHost"

	^self primitiveGetStringKeyedBy: 'IRCHost'

]

{
	#category : #lookups,
	#timestamp : ' 8/31/2017 07:16:32'
}
InternetConfiguration class>>getLDAPSearchbase [
	"Return the LDAP thing"
	"InternetConfiguration getLDAPSearchbase"

	^self primitiveGetStringKeyedBy: 'LDAPSearchbase'

]

{
	#category : #lookups,
	#timestamp : ' 8/31/2017 07:16:32'
}
InternetConfiguration class>>getLDAPServer [
	"Return the LDAP server"
	"InternetConfiguration getLDAPServer"

	^self primitiveGetStringKeyedBy: 'LDAPServer'

]

{
	#category : #lookups,
	#timestamp : ' 8/31/2017 07:16:32'
}
InternetConfiguration class>>getMacintoshFileTypeAndCreatorFrom: aFileName [
	"Return the application type and application signature for the file
	 for the macintosh file system based on the file ending, the file does not need to exist
	failure to find a signature based on the file ending, or because of primitive failure turns nil"
	"InternetConfiguration getMacintoshFileTypeAndCreatorFrom: 'test.jpg'"
	| string |

	string := self primitiveGetMacintoshFileTypeAndCreatorFrom: aFileName.
	string = '********' ifTrue: [^nil].
	^Array with: (string first: 4) with: (string last: 4)

]

{
	#category : #lookups,
	#timestamp : ' 8/31/2017 07:16:32'
}
InternetConfiguration class>>getMailAccount [
	"Return the mail account user@host.domain"
	"InternetConfiguration getMailAccount"

	^self primitiveGetStringKeyedBy: 'MailAccount'

]

{
	#category : #lookups,
	#timestamp : ' 8/31/2017 07:16:32'
}
InternetConfiguration class>>getMailPassword  [
	"Return the mail account Password "
	"InternetConfiguration getMailPassword "

	^self primitiveGetStringKeyedBy: 'MailPassword'

]

{
	#category : #lookups,
	#timestamp : ' 8/31/2017 07:16:32'
}
InternetConfiguration class>>getNNTPHost [
	"Return the NNTP server"
	"InternetConfiguration getNNTPHost"

	^self primitiveGetStringKeyedBy: 'NNTPHost'

]

{
	#category : #lookups,
	#timestamp : ' 8/31/2017 07:16:32'
}
InternetConfiguration class>>getNTPHost [
	"Return the  Network Time Protocol (NTP)"
	"InternetConfiguration getNTPHost"

	^self primitiveGetStringKeyedBy: 'NTPHost'

]

{
	#category : #lookups,
	#timestamp : ' 8/31/2017 07:16:32'
}
InternetConfiguration class>>getNewsAuthPassword [
	"Return the Password for the authorised news servers"
	"InternetConfiguration getNewsAuthPassword"

	^self primitiveGetStringKeyedBy: 'NewsAuthPassword'

]

{
	#category : #lookups,
	#timestamp : ' 8/31/2017 07:16:32'
}
InternetConfiguration class>>getNewsAuthUsername [
	"Return the user name for authorised news servers"
	"InternetConfiguration getNewsAuthUsername"

	^self primitiveGetStringKeyedBy: 'NewsAuthUsername'

]

{
	#category : #lookups,
	#timestamp : ' 8/31/2017 07:16:32'
}
InternetConfiguration class>>getNoProxyDomains [
	"Return a comma seperated string of domains not to proxy"
	"InternetConfiguration getNoProxyDomains"

	^self primitiveGetStringKeyedBy: 'NoProxyDomains'

]

{
	#category : #lookups,
	#timestamp : ' 8/31/2017 07:16:32'
}
InternetConfiguration class>>getOrganization [
	"Return the Organization"
	"InternetConfiguration getOrganization"

	^self primitiveGetStringKeyedBy: 'Organization'

]

{
	#category : #lookups,
	#timestamp : ' 8/31/2017 07:16:32'
}
InternetConfiguration class>>getPhHost [
	"Return the PhHost server"
	"InternetConfiguration getPhHost"

	^self primitiveGetStringKeyedBy: 'PhHost'

]

{
	#category : #lookups,
	#timestamp : ' 8/31/2017 07:16:32'
}
InternetConfiguration class>>getRealName [
	"Return the RealName"
	"InternetConfiguration getRealName"

	^self primitiveGetStringKeyedBy: 'RealName'

]

{
	#category : #lookups,
	#timestamp : ' 8/31/2017 07:16:32'
}
InternetConfiguration class>>getSMTPHost [
	"Return the SMTP server"
	"InternetConfiguration getSMTPHost"

	^self primitiveGetStringKeyedBy: 'SMTPHost'

]

{
	#category : #lookups,
	#timestamp : ' 8/31/2017 07:16:32'
}
InternetConfiguration class>>getSocksHost [
	"Return the Socks server"
	"InternetConfiguration getSocksHost"

	^self primitiveGetStringKeyedBy: 'SocksHost'

]

{
	#category : #lookups,
	#timestamp : ' 8/31/2017 07:16:32'
}
InternetConfiguration class>>getTelnetHost [
	"Return the TelnetHost server"
	"InternetConfiguration getTelnetHost"

	^self primitiveGetStringKeyedBy: 'TelnetHost'

]

{
	#category : #lookups,
	#timestamp : ' 8/31/2017 07:16:32'
}
InternetConfiguration class>>getWAISGateway [
	"Return the wais gateway"
	"InternetConfiguration getWAISGateway"

	^self primitiveGetStringKeyedBy: 'WAISGateway'

]

{
	#category : #lookups,
	#timestamp : ' 8/31/2017 07:16:32'
}
InternetConfiguration class>>getWWWHomePage [
	"Return the WWW home page url"
	"InternetConfiguration getWWWHomePage"

	^self primitiveGetStringKeyedBy: 'WWWHomePage'

]

{
	#category : #lookups,
	#timestamp : ' 8/31/2017 07:16:32'
}
InternetConfiguration class>>getWhoisHost [
	"Return the WhoisHost server"
	"InternetConfiguration getWhoisHost"

	^self primitiveGetStringKeyedBy: 'WhoisHost'

]

{
	#category : #initialization,
	#timestamp : ' 8/31/2017 07:16:32'
}
InternetConfiguration class>>initialize [
	SessionManager default
		registerNetworkClassNamed: self name
]

{
	#category : #'system primitives',
	#timestamp : ' 8/31/2017 07:16:32'
}
InternetConfiguration class>>primitiveGetMacintoshFileTypeAndCreatorFrom: aFileName [
	<primitive: 'primitiveGetMacintoshFileTypeAndCreatorFrom' module: 'InternetConfigPlugin'>
	^'********' copy 
]

{
	#category : #'system primitives',
	#timestamp : ' 8/31/2017 07:16:32'
}
InternetConfiguration class>>primitiveGetStringKeyedBy: aKey [
	<primitive: 'primitiveGetStringKeyedBy' module: 'InternetConfigPlugin'>
	^String new.

]

{
	#category : #'HTTP Proxy',
	#timestamp : ' 8/31/2017 07:16:32'
}
InternetConfiguration class>>setHttpProxy [

	(self getHTTPProxyHost findTokens: ':') ifNotEmpty: [ :p |
		NetworkSystemSettings
			httpProxyServer: p first;
			httpProxyPort: p second asInteger;
			useHTTPProxy: true ]
]

{
	#category : #'system startup',
	#timestamp : ' 8/31/2017 07:16:32'
}
InternetConfiguration class>>shutDown [
	Smalltalk os isMacOS
		ifTrue: [ NetworkSystemSettings useHTTPProxy: false ]
	

]

{
	#category : #'system startup',
	#timestamp : ' 8/31/2017 07:16:32'
}
InternetConfiguration class>>startUp [
	Smalltalk os configureHttpProxy
]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 07:16:32'
}
InternetConfiguration class>>useFTPProxy [
	"Return true if UseFTPProxy"
	"InternetConfiguration useFTPProxy"

	^(self primitiveGetStringKeyedBy: 'UseFTPProxy') = '1'

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 07:16:32'
}
InternetConfiguration class>>useGopherProxy [
	"Return true if UseGopherProxy"
	"InternetConfiguration useGopherProxy"

	^(self primitiveGetStringKeyedBy: 'UseGopherProxy') = '1'

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 07:16:32'
}
InternetConfiguration class>>useHTTPProxy [
	"Return true if UseHTTPProxy"
	"InternetConfiguration useHTTPProxy"

	^(self primitiveGetStringKeyedBy: 'UseHTTPProxy') = '1'

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 07:16:32'
}
InternetConfiguration class>>usePassiveFTP [
	"Return true if UsePassiveFTP"
	"InternetConfiguration usePassiveFTP"

	^(self primitiveGetStringKeyedBy: 'UsePassiveFTP') = '1'

]

{
	#category : #tests,
	#timestamp : ' 8/31/2017 07:16:32'
}
InternetConfiguration class>>useSocks [
	"Return true if UseSocks"
	"InternetConfiguration useSocks"

	^(self primitiveGetStringKeyedBy: 'UseSocks') = '1'

]
