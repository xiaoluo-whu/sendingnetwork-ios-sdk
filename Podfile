# Uncomment this line to define a global platform for your project

# Expose Objective-C frameworks to Swift
# Build and link dependencies as static frameworks
use_frameworks! :linkage => :static

abstract_target 'SendingnetworkSDK' do
    
    pod 'AFNetworking', '~> 4.0.0'
    pod 'GZIP', '~> 1.3.0'

    pod 'SwiftyBeaver', '1.9.5'
    
    pod 'OLMKit', '~> 3.2.5', :inhibit_warnings => true
    #pod 'OLMKit', :path => '../olm/OLMKit.podspec'
    
    pod 'Realm', '10.27.0'
    pod 'libbase58', '~> 0.1.4'
    
    target 'SendingnetworkSDK-iOS' do
        platform :ios, '11.0'
        
        pod 'SendingnetworkSDKCrypto', "0.1.0", :configurations => ['DEBUG']
        
        target 'SendingnetworkSDKTests-iOS' do
            inherit! :search_paths
            pod 'OHHTTPStubs', '~> 9.1.0'
        end
    end
    
    target 'SendingnetworkSDK-macOS' do
        platform :osx, '10.10'

        target 'SendingnetworkSDKTests-macOS' do
            inherit! :search_paths
            pod 'OHHTTPStubs', '~> 9.1.0'
        end
    end
end
