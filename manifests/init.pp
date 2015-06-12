# == Class: iterm
#
# Full description of class iterm here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class iterm (
) {
  package { 'iterm2-nightly-halyard':
    provider    => 'brewcask',
    require     => Homebrew::Tap['halyard/casks']
  }
}
