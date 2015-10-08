Pod::Spec.new do |s|
  s.name = 'RDRGrowingTextView'
  s.version = '0.1.0'
  s.license = 'MIT'
  s.summary = 'Auto Layout backed growing UITextView'
  s.homepage = 'https://github.com/datwelk/RDRGrowingTextView'
  s.authors = 'datwelk'
  s.source = { :git => 'https://github.com/datwelk/RDRGrowingTextView.git', :tag => s.version }

  s.ios.deployment_target = '7.0'

  s.source_files = 'RDRGrowingTextView/*.{h,m}'

  s.requires_arc = true
end
