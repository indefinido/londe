module Londe
  class VersionControl < Feature

    default

    name 'Version Control'

    details <<-DETAILS
    DETAILS


    setup do
      git :init

      # TODO move to template
      create_file '.gitignore', <<-GITIGNORE
# Mac OS X Files
.DS_*

# Bundler
.bundle

# Security Preventions
db/*.sqlite3
config/database.yml
config/pubnub.yml
config/mongoid.yml
test/dummy/db/*.sqlite3
test/dummy/config/database.yml
test/dummy/config/pubnub.yml
test/dummy/config/mongoid.yml
test/dummy/config/initializers/smtp.rb

# Monitoring files
log/*
tmp/**/*
public/uploads/*
public/clicktale/*
public/uploads/*
test/dummy/log/*
test/dummy/tmp/**/*
test/dummy/public/uploads/*
test/dummy/public/clicktale/*
test/dummy/public/uploads/*

# Run Commands Files
.rvmrc
.powrc

# Cache
test/dummy/.sass-cache

# Vendor and Data files
pkg/
test/dummy/public/uploads/*
test/dummy/public/clicktale/*

# Emacs Temporary Files
*~
*#

# Eclipse
.directory
.project
.loadpath
GITIGNORE

      # TODO first commit with link to "She's alive, she's alive!" from "The Last Night Of The Kings - Van Canto"
    end


    builder do
    end

    instructions <<-INSTRUCTIONS
    INSTRUCTIONS

  end
end