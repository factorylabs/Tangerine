require File.expand_path('../../../support/vcr/configuration_variables', __FILE__)

namespace :tangerine do

  namespace :vcr do

    # Remove VCR "cassettes" - force re-record on next spec run (specify
    # cassettes to erase CASSETTES=dir/cassette_name,other_dir - paths
    # are relative to VCR::Configuration.cassette_library_dir) defaults
    # to erase all cassettes
    task :erase_cassettes do
      cassettes = ENV['CASSETTES'] || ' '

      cassettes_to_erase = cassettes.split(',').collect do |c|
        path = File.join(VCR_CASSETTE_LIBRARY_DIR, c.strip)
        if !File.exists?(path)
          puts "Unable to locate: #{path}"
          puts "No cassettes have been erased."
          raise
        end
        path
      end

      cassettes_to_erase.each { |c| FileUtils.rm_r c }
    end

  end

end

