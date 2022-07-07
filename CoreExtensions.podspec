
Pod::Spec.new do |spec|

    spec.name         = "CoreExtensions"
    spec.version      = "0.0.1"
    spec.summary      = "Some Shared Extensions, that are used in the projects of the Moscow Metro."
    
    spec.description  = <<-DESC
                    Some Shared Extensions, that are used in the projects of the Moscow Metro.
                     DESC
  
    spec.homepage     = "https://github.com/MosMetro-official/CoreExtensions"
    
    spec.license      = "MIT"
    
    spec.author             = { "Павел Кузин" => "polykuzin@gmail.com" }

    spec.platform     = :ios
    spec.platform     = :ios, "13.0"
    
    spec.ios.deployment_target = "13.0"
    
    spec.source       = { :git => "https://github.com/MosMetro-official/CoreExtensions", :tag => "#{spec.version}" }
    
    spec.source_files  = "Sources/CoreExtensions/**/*.{swift}"
    spec.exclude_files = "Tests/CoreExtensions/**/*"
    
    spec.dependency 'SwiftDate', '~> 5.0'
    
  end