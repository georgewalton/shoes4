require_relative 'common'

class ShoesDslManifest
  extend ShoesManifestReport

  def self.gem_name
    'shoes-dsl'
  end

  def self.files
    @files ||= ShoesCommonManifest.files
      .include(%w[
        fonts/**/*
        lib/shoes/**/*
        manifests/shoes-dsl.rb
        shoes-dsl.gemspec
        static/shoes-icon.png
        static/Shoes.icns
      ])
      .include(test_files)
      .exclude { |file| file =~ %r{lib/shoes/ui|lib/shoes/swt} }
  end

  def self.test_files
    @test_files ||= Rake::FileList['spec/*', 'spec/shoes/**/*']
  end
end


if $0 == __FILE__
  puts ShoesDslManifest.report
end

