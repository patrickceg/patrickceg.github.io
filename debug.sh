#! /bin/bash
# For debugging

# Enable the Ruby Version Manager environment
RVM_SCRIPT_LOCAL=~/.rvm/scripts/rvm
if [ -f $RVM_SCRIPT_LOCAL ]; then
	source $RVM_SCRIPT_LOCAL
fi

bundle exec jekyll clean
bundle exec jekyll serve --watch
