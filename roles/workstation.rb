name "workstation"
description "Mac OS X worksations"

run_list(
  "recipe[build-essential]",
  #"recipe[git]",
  #"recipe[ruby_build]",
  #"recipe[rbenv::user]",
  "recipe[users]",
  "recipe[workstation]",
  "recipe[mac_os_x::settings]",
  "recipe[mac_os_x::firewall]",
  # Additional applications that have their own cookbooks.
  "recipe[iterm2]",
  #"recipe[virtualbox]",
  #"recipe[ghmac]",
  "recipe[1password]",
  "recipe[xquartz]"
)

default_attributes(
  "iterm2" => {
    "version" => "1_0_0_20120203",
    "checksum" => "30febc426de2db2ea14f46723f5365ae3ad6ab23c877a1b016cd42e29199fe02",
    "tmux_enabled" => true,
    "tmux_compile" => false,
    "tmux_version" => "20120203",
    "tmux_compiled_checksum" => "679719f2b6b35b95875d656f44d9d6f9ca15515f24eea051f0b96e20e2d89509"
  },
  "virtualbox" => {
    "urlbase" => "http://download.virtualbox.org/virtualbox/4.1.18",
    "url" => "http://download.virtualbox.org/virtualbox/4.1.18/VirtualBox-4.1.18-78361-OSX.dmg"
  },
  # These attributes are used by the mac_os_x::settings recipe to
  # build dynamic data driven settings. See the mac_os_x cookbook's
  # README.md for more information about how this works. Note that the
  # "domain" key is required.
  # These are my personal preferences. If you don't know what a
  # particular setting does, remove it before running Chef.
  "mac_os_x" => {
    "settings" => {
      "dock" => {
        "domain" => "com.apple.dock",
        "autohide" => true,
        "magnification" => true,
        "minimize-to-application" => true,
        "tilesize" => 64,
		"orientation" => "right"
      },
      "trackpad" => {
        "domain" => "com.apple.driver.AppleBluetoothMultitouch.trackpad",
        "Clicking" => true
      },
      "finder" => {
        "domain" => "com.apple.finder",
        "FXPreferredViewStyle" => "Nlsv" # list view
      },
      "global" => {
        "domain" => "NSGlobalDomain",
        "InitialKeyRepeat" => 25,
        "KeyRepeat" => 2,
        "com.apple.springing.delay" => "0.5",
        "com.apple.springing.enabled" => 1
      },
      "safari" => {
        "domain" => "com.apple.Safari",
        "AutoFillFromAddressBook" => false
      },
      "screensaver" => {
        "domain" => "com.apple.screensaver",
        "askForPassword" => 1,
        "askForPasswordDelay" => 5
      }
    }
  }
)
