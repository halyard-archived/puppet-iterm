# == Class: iterm
#
# Install and configure iterm
#
# === Parameters
#
# [*prefs_path*]
#   Path to use as the autoload path for iTerm preferences
#
class iterm (
  $prefs_path = "/Users/${::boxen_user}/Dropbox/iterm"
) {
  package { 'iterm2-nightly-halyard':
    provider => 'brewcask',
    require  => Homebrew::Tap['halyard/casks']
  } ->
  boxen::osx_defaults { 'Enable iterm preference loading':
    user    => $::boxen_user,
    domain  => 'com.googlecode.iterm2',
    key     => 'LoadPrefsFromCustomFolder',
    value   => 1,
    type    => 'integer',
  } ->
  boxen::osx_defaults { 'Set iterm preference path':
    user   => $::boxen_user,
    domain => 'com.googlecode.iterm2',
    key    => 'PrefsCustomFolder',
    value  => $prefs_path,
    type   => 'string'
  }
}
