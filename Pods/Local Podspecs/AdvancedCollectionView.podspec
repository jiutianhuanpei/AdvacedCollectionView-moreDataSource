Pod::Spec.new do |s|
  s.name          = 'AdvancedCollectionView'
  s.version       = '1.0'
  s.license       = { :type => 'MIT' }
  s.homepage      = 'https://github.com/akolov/AdvancedCollectionView'
  s.authors       = 'Apple'
  s.summary       = 'Advanced User Interfaces Using Collection View'

# Source Info
  s.platform      = :ios, '7.0'
  s.source        = { :git => 'https://github.com/akolov/AdvancedCollectionView.git', :tag => "#{s.version}" }

  s.requires_arc = true
  s.source_files  = 'AdvancedCollectionView/AAPLAction.{h,m}',
                    'AdvancedCollectionView/AAPLContentLoading.{h,m}',
                    'AdvancedCollectionView/AAPLStateMachine.{h,m}',
                    'AdvancedCollectionView/Categories/*.{h,m}',
                    'AdvancedCollectionView/DataSources/*.{h,m}',
                    'AdvancedCollectionView/Layouts/*.{h,m}',
                    'AdvancedCollectionView/ViewControllers/*.{h,m}',
                    'AdvancedCollectionView/Views/*.{h,m}'

  s.prefix_header_contents = <<-EOS
#ifndef NS_DESIGNATED_INITIALIZER
#if __has_attribute(objc_designated_initializer)
#define NS_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
#else
#define NS_DESIGNATED_INITIALIZER
#endif
#endif
EOS
end
