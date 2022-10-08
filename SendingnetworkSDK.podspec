Pod::Spec.new do |s|

  s.name         = "SendingnetworkSDK"
  s.version      = "0.23.10"
  s.summary      = "The iOS SDK to build apps compatible with Sendingnetwork (https://www.sending.network)"

  s.description  = <<-DESC
				   Sendingnetwork is a new open standard for interoperable Instant Messaging and VoIP, providing pragmatic HTTP APIs and open source reference implementations for creating and running your own real-time communication infrastructure.

				   Our hope is to make VoIP/IM as universal and interoperable as email.
                   DESC

  s.homepage     = "https://www.sending.network"

  s.license      = { :type => "Apache License, Version 2.0", :file => "LICENSE" }

  s.author             = { "sending.network" => "support@sending.network" }
  s.social_media_url   = "http://twitter.com/Sending_Network"

  s.source       = { :git => "https://github.com/xiaoluo-whu/sendingnetwork-ios-sdk.git", :tag => "v#{s.version}" }
  
  s.requires_arc  = true
  s.swift_versions = ['5.1', '5.2']
  
  s.ios.deployment_target = "11.0"
  s.osx.deployment_target = "10.12"
  
  s.default_subspec = 'Core'
  s.subspec 'Core' do |ss|
      ss.ios.deployment_target = "11.0"
      ss.osx.deployment_target = "10.12"
      
      ss.source_files = "SendingnetworkSDK", "SendingnetworkSDK/**/*.{h,m}", "SendingnetworkSDK/**/*.{swift}"
      ss.osx.exclude_files = "SendingnetworkSDK/VoIP/MXiOSAudioOutputRoute*.swift"
      ss.private_header_files = ['SendingnetworkSDK/SendingnetworkSDKSwiftHeader.h', "SendingnetworkSDK/**/*_Private.h"]
      ss.resources = "SendingnetworkSDK/**/*.{xcdatamodeld}"
      ss.frameworks = "CoreData"

      ss.dependency 'AFNetworking', '~> 4.0.0'
      ss.dependency 'GZIP', '~> 1.3.0'

      ss.dependency 'SwiftyBeaver', '1.9.5'

      # Requirements for e2e encryption
      ss.dependency 'OLMKit', '~> 3.2.5'
      ss.dependency 'Realm', '10.27.0'
      ss.dependency 'libbase58', '~> 0.1.4'
      ss.ios.dependency 'SendingnetworkSDK/CryptoSDK'
      ss.dependency 'SVGKit'
  end

  s.subspec 'JingleCallStack' do |ss|
    ss.ios.deployment_target = "12.0"
    
    ss.source_files  = "SendingnetworkSDKExtensions/VoIP/Jingle/**/*.{h,m}"
    
    ss.dependency 'SendingnetworkSDK/Core'
    
    # The Google WebRTC stack
    # Note: it is disabled because its framework does not embed x86 build which
    # prevents us from submitting the SendingnetworkSDK pod
    #ss.ios.dependency 'GoogleWebRTC', '~>1.1.21820'
    
    # Use WebRTC framework included in Jitsi Meet SDK
    ss.ios.dependency 'JitsiMeetSDK', '5.0.2'
  end
  
  # Experimental / NOT production-ready Rust-based crypto library, iOS-only
  s.subspec 'CryptoSDK' do |ss|
    ss.platform = :ios
    ss.dependency 'MatrixSDKCrypto', '0.1.0', :configurations => ["DEBUG"]
  end

end
