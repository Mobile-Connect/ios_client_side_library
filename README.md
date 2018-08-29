GSMA MobileConnect iOS Client Side Library
==============================================================================================================
Mobile Connect is a mobile identity service based on the OpenID Connect & OAuth2 where end users can authenticate themselves using their mobile phone via Mobile Connect. This allows them access to websites and applications without the need to remember passwords and usernames. It’s safe, secure and no personal information is shared without their permission.

This example client side application demonstrates how to integrate client side library with server side library.

Note: if you operate in the EU then you should use EU Discovery Service domain in discovery URL: eu.discover.mobileconnect.io

## Pre-requisites
- Swift 4.0
- Xcode 9

## Quick Start
- Open the configuration file: (ClientSideLib/Config.plist).
Be sure to provide your server side endpoint.

Note: you can not change the server side endpoint while application is running. 

You can also configure your MSISDN, MCC and MNC, if it's necessary. You can change them while application is running.

- Build the [Application](ClientSideLib/).
- The Application works in three modes (MSISDN, MCC_MNC, None). Also you can configure the IP Address.
- With your configuration specified in the configuration file and using user interface, you have everything you need to make a successful call to the server side library by pressing 'Mobile Connect' button.

Note: Your client side library will work only with server side library. Please, see links to the [server side libraries](#resources).

## Support

If you encounter any issues which are not resolved by consulting the resources below then [send us a message](https://developer.mobileconnect.io/content/contact-us)

## Resources
- [MobileConnect iOS Client Side Library](https://developer.mobileconnect.io/content/ios-client-side-library)
- [MobileConnect Java Server Side Library](https://developer.mobileconnect.io/content/java-server-side-library)
- [MobileConnect .NET Server Side Library](https://developer.mobileconnect.io/content/net-server-side-library)
- [MobileConnect PHP Server Side Library](https://developer.mobileconnect.io/content/php-server-side-library)
- [MobileConnect Authentication API Information](https://developer.mobileconnect.io/mobile-connect-api)
- [MobileConnect Authentication API (v2.0) Information](https://developer.mobileconnect.io/mobile-connect-profile-v2-0)
- [MobileConnect Discovery API Information](https://developer.mobileconnect.io/discovery-api)

