Pod::Spec.new do |spec|
    
    spec.name         = 'DefaultsHelper'
    spec.version      = '1.0'
    spec.license      = { :type => 'MIT' }
    spec.homepage     = 'https://github.com/anotheren/DefaultsHelper'
    spec.author       = { 'liudong' => 'liudong.edward@gmail.com' }
    spec.summary      = 'A Simple UserDefaults Helper'
    spec.source       = { :git => 'https://github.com/anotheren/DefaultsHelper.git',
                          :tag => spec.version }
    spec.swift_version = '4.2'
    
    spec.ios.deployment_target     = '10.0'
    
    spec.source_files = 'Sources/**/*.swift'

    spec.dependency 'LogWriter'
end
