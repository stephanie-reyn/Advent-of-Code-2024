# frozen_string_literal: true

# A Guardfile
# More info at https://github.com/guard/guard#readme

# set this to the directory containing your spec files and the input file
todays_dir = '01'

guard 'rspec', cmd: 'rspec --color --format doc', spec_paths: [todays_dir] do
  watch(%r{^#{todays_dir}/(.+)_spec\.rb$})
end
