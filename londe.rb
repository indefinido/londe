$: << File.join(File.expand_path(File.dirname(__FILE__)), 'lib')

require 'londe/composer'
require 'londe/feature'

require 'active_support/core_ext/string/inquiry'
require 'active_support/core_ext/kernel/reporting.rb'

Londe::Composer.compose self
