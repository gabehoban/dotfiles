#!/usr/bin/env zsh
echo "\n💻 Starting Mac Setup\n"


echo "- 🤖 nvram"
# Disable auto-booting
sudo nvram AutoBoot=%01
# stop startup chime
sudo nvram StartupMute=%01
sudo nvram SystemAudioVolume=%80


echo "- 🔋 Battery"
# Do not dim brightness on battery source (-b: battery)
sudo pmset -b lessbright 0


echo "- 🚢 Dock" # killall Dock
# Set the Dock position
defaults write com.apple.dock orientation -string "right"
# Autohides the Dock. You can toggle the Dock using ⌥ + ⌘ +d.
defaults write com.apple.dock autohide -bool true
# Change the Dock opening delay.
defaults write com.apple.Dock autohide-delay -float 60
# Wipe all app icons
defaults write com.apple.dock persistent-apps -array
# Set the icon size of Dock items in pixels.
defaults write com.apple.dock tilesize -int 48 
# Magnificate icons
defaults write com.apple.dock magnification -bool true
# Icon size of magnified Dock items
defaults write com.apple.dock largesize -int 56
# disable Launchpad
defaults write com.apple.dock showLaunchpadGestureEnabled -bool false


echo "- 🕹 Menu bar" # killall SystemUIServer
# This setting configures the time and date format for the menubar digital clock
defaults write com.apple.menuextra.clock DateFormat -string "EEE d MMM  h:mm a"
# Time format 12 hour time: AM/PM
defaults write NSGlobalDomain AppleICUForce12HourTime -bool true
# Configure the menu bar Items
defaults write com.apple.systemuiserver menuExtras -array "/System/Library/CoreServices/Menu Extras/TimeMachine.menu"


echo "- 📸 Screenshot"
# Choose whether to display a thumbnail after taking a screenshot
defaults write com.apple.screencapture show-thumbnail -bool false


echo "- 🐤 NSGlobalDomain(General)"
# Dark Mode
defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"
# Set the accent color to green
defaults write NSGlobalDomain AppleAccentColor -int 3
# Set the highlight color to green
defaults write NSGlobalDomain AppleHighlightColor -string "0.752941 0.964706 0.678431 Green"
# Autohides the Menu bar
# defaults write NSGlobalDomain _HIHideMenuBar -bool true
# Show all file extensions in the Finder
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# Turn off alert volume
defaults write NSGlobalDomain com.apple.sound.beep.volume -int 0
# Use keyboard navigation to move focus between controls
# Press the Tab key to move focus forward and Shift Tab to move focus backward
defaults write NSGlobalDomain AppleKeyboardUIMode -int 2


echo "- 🗂 Finder" # killall Finder
# Set the default finder view style to icon view
defaults write com.apple.Finder FXPreferredViewStyle -string "icnv"
# Display the status bar
defaults write com.apple.finder ShowStatusBar -bool true
# Display the path bar
defaults write com.apple.finder ShowPathbar -bool true
# Set a default folder when opening Finder: Google Drive
# Target category ex) PfDo: Documents, PfID: iCloud Drive, PfLo: Others
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file:///Users/$USER/Dropbox/"
# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"


echo "- 🪧 Mission Control" # killall Dock
# Choose whether to rearrange Spaces automatically.
defaults write com.apple.dock mru-spaces -bool false


echo "- 👮🏻‍♂️ Security & Privacy"
# Turn on Firewall
sudo defaults write /Library/Preferences/com.apple.alf globalstate -int 1


echo "- ⌨️ Keyboard"
# Set key repeat rate
defaults write NSGlobalDomain KeyRepeat -int 2
# Set delay until repeat
defaults write NSGlobalDomain InitialKeyRepeat -int 15
#  @ = command
#  ^ = control
#  ~ = option
#  $ = shift
# General Keyboard Shortcut => Paste and Match Style : ⌘ + V
defaults write NSGlobalDomain NSUserKeyEquivalents -dict-add "Paste and Match Style" -string "@v"
# Chrome Keyboard Shortcut => Browsing Data... : ⌃ + ⇧ + ⌘+ ⌥ + D
defaults write com.google.Chrome NSUserKeyEquivalents -dict-add "Clear Browsing Data..." -string "@~^\$d"
# Chrome Keyboard Shortcut => Print... : ⇧ + ⌘ + ⌥ + P
defaults write com.google.Chrome NSUserKeyEquivalents -dict-add "Print..." -string "@~\$p"
# Chrome Keyboard Shortcut => Save Page As... : ⇧ + ⌘ + ⌥ + S
defaults write com.google.Chrome NSUserKeyEquivalents -dict-add "Save Page As..." -string "@~\$s"
# Chrome Keyboard Shortcut => Bookmark This Tab... : ⇧ + ⌘ + ⌥ + D
defaults write com.google.Chrome NSUserKeyEquivalents -dict-add "Bookmark This Tab..." -string "@~\$d"
# Firefox Developer Edition Keyboard Shortcut => Save Page As... : ⇧ + ⌘ + ⌥ + P
defaults write org.mozilla.firefoxdeveloperedition NSUserKeyEquivalents -dict-add "Print..." -string "@~\$p"
# Disable ⌃ + Space for "Select the previous input source"
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 60 '<dict><key>enabled</key><false/></dict>'
# Disable ⌃ + ⌥ + Space for "Select next source in input menu"
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 61 '<dict><key>enabled</key><false/></dict>'
# Disable ⌘ + Space for "Show Spotlight search"
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 64 '<dict><key>enabled</key><false/></dict>'
# Disable ⌥ + ⌘ + Space for "Show Finder search window"
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 65 '<dict><key>enabled</key><false/></dict>'


echo "- 📡 Network"
networksetup -setdnsservers Wi-Fi 192.168.1.23


echo "- 🖲 Trackpad"
# Haptic feedback => 0: Light 1: Medium 2: Firm
defaults write com.apple.AppleMultitouchTrackpad FirstClickThreshold -int 2
defaults write com.apple.AppleMultitouchTrackpad SecondClickThreshold -int 2
# Tracking Speed => 0: Slow 3: Fast
defaults write NSGlobalDomain com.apple.trackpad.scaling -float 2.5
# Disable swipe between pages
defaults write NSGlobalDomain AppleEnableSwipeNavigateWithScrolls -bool false
# Disable Look up & detectors
defaults write NSGlobalDomain com.apple.trackpad.forceClick -bool false
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerTapGesture -int 0


echo "- 🗣 Speech"
# Enable Text to Speech
defaults write com.apple.speech.synthesis.general.prefs SpokenUIUseSpeakingHotKeyFlag -bool false


echo "- 🖥 Display"
# System Preference > Displays > Night Shift
# Night shift from 7am to 6:59am
CORE_BRIGHTNESS="/private/var/root/Library/Preferences/com.apple.CoreBrightness.plist"
CURRENT_USER_UID="CBUser-$(dscl . -read ~ GeneratedUID | sed 's/GeneratedUID: //')"

# Color Temperature: Default warm
sudo /usr/libexec/PlistBuddy -c "Set :$CURRENT_USER_UID:CBBlueLightReductionCCTTargetRaw 4100" $CORE_BRIGHTNESS
# Manual: Turn on Until Tomorrow => 4: check, 3: uncheck
sudo /usr/libexec/PlistBuddy -c "Set :$CURRENT_USER_UID:CBBlueReductionStatus:BlueLightReductionAlgoOverride 4" $CORE_BRIGHTNESS
# Schedule: Custom
sudo /usr/libexec/PlistBuddy -c "Set :$CURRENT_USER_UID:CBBlueReductionStatus:BlueReductionMode 2" $CORE_BRIGHTNESS
# From: Hour
sudo /usr/libexec/PlistBuddy -c "Set :$CURRENT_USER_UID:CBBlueReductionStatus:BlueLightReductionSchedule:NightStartHour 7" $CORE_BRIGHTNESS
# From: Minutes
sudo /usr/libexec/PlistBuddy -c "Set :$CURRENT_USER_UID:CBBlueReductionStatus:BlueLightReductionSchedule:NightStartMinute 0" $CORE_BRIGHTNESS
# To: Hour
sudo /usr/libexec/PlistBuddy -c "Set :$CURRENT_USER_UID:CBBlueReductionStatus:BlueLightReductionSchedule:DayStartHour 6" $CORE_BRIGHTNESS 
# To: Minutes
sudo /usr/libexec/PlistBuddy -c "Set :$CURRENT_USER_UID:CBBlueReductionStatus:BlueLightReductionSchedule:DayStartMinute 59" $CORE_BRIGHTNESS

# Sidecar Settings
defaults write com.apple.sidecar.display doubleTapEnabled -bool true
defaults write com.apple.sidecar.display showTouchbar -bool false
defaults write com.apple.sidecar.display sidebarShown -bool false


echo "- 👼 Killall..."
killall Dock
killall Finder
killall SystemUIServer
# cfprefsd helps an app or the system to read or write to preference files.
sudo killall cfprefsd
sudo killall corebrightnessd

echo "\n🎉 Completed Mac Setup \n"


echo "\n🧝🏻‍♀️ Starting Third-Party Software Setup\n"


echo "- 🐟 VSCode"
VSCODE_USERDATA="$HOME/Library/Application Support/Code/User"
DROPBOX_VSCODE_USERDATA="$HOME/Dropbox/Settings/dotfiles/preferences/VSCode"
VSCODE_USERDATA_ITEMS=("keybindings.json" "settings.json" "snippets")

for i in ${VSCODE_USERDATA_ITEMS[@]}; do
  rm -rf "$VSCODE_USERDATA/$i"
  ln -nfsv "$DROPBOX_VSCODE_USERDATA/$i" "$VSCODE_USERDATA/$i"
  if [ -L "$VSCODE_USERDATA/$i" ]; then
    echo "Created Link"
    ls -l "$VSCODE_USERDATA"
  else
    echo "Error: Creating Links fails"
  fi
done


echo "- 🍎 Xcode"
XCODE_USERDATA="$HOME/Library/Developer/Xcode/UserData"
DROPBOX_XCODE_USERDATA="$HOME/Dropbox/Settings/dotfiles/preferences/Xcode/UserData"
XCODE_USERDATA_ITEMS=("CodeSnippets" "FontAndColorThemes" "KeyBindings")

for i in ${XCODE_USERDATA_ITEMS[@]}; do
  # Need rm -rf to symbolic-link KeyBindings folder
  rm -rf "$XCODE_USERDATA/$i"
  ln -nfsv "$DROPBOX_XCODE_USERDATA/$i" "$XCODE_USERDATA/$i"
  if [ -L "$XCODE_USERDATA/$i" ]; then
    echo "Created Link"
    ls -l "$XCODE_USERDATA"
  else
    echo "Error: Creating Links fails"
  fi
done


echo "- 🎮 iTerm2"
# General > Preferences > check "Load preferences from a custom folder or URL"
defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true
# Restore from the backup
defaults write com.googlecode.iterm2 PrefsCustomFolder -string "$HOME/Dropbox/Settings/dotfiles/preferences/iTerm2"
# General > Preferences > Save changes: when quits 
defaults write com.googlecode.iterm2 NoSyncNeverRemindPrefsChangesLostForFile -bool true


echo "- 🧲 Tiles"
# Don't show the icon in the menu bar
defaults write com.sempliva.Tiles.plist MenuBarIconEnabled -bool false
# Active Hotkeys
# Previous Display: ⌥ + ⌘ + A 
defaults write com.sempliva.Tiles.plist PreviousDisplay -dict-add "characters" -string "\U00e5"
defaults write com.sempliva.Tiles.plist PreviousDisplay -dict-add "charactersIgnoringModifiers" -string "a"
defaults write com.sempliva.Tiles.plist PreviousDisplay -dict-add "keyCode" -int 0
defaults write com.sempliva.Tiles.plist PreviousDisplay -dict-add "modifierFlags" -int 1572864
# Inactive Hotkeys
TILES_INACTIVE_HOTKEYS=("MoveToCenter" "NextThird" "PreviousThird" "FirstTwoThirds" "LastTwoThirds" "NextDisplay" "MoveToLowerLeft" "MoveToLowerRight" "MoveToUpperLeft" "MoveToUpperRight" "UndoLastMove")
for i in ${TILES_INACTIVE_HOTKEYS[@]}; do
  defaults write com.sempliva.Tiles.plist $i -dict-add "keyCode" -int 65535
  defaults write com.sempliva.Tiles.plist $i -dict-add "modifierFlags" -int 0
done


echo "- 🔖 Dash"
defaults write com.kapeli.dashdoc syncFolderPath "~/Dropbox/Settings/Dash"
defaults write com.kapeli.dashdoc snippetSQLPath "$HOME/Dropbox/Settings/Dash/Snippets.dash"


echo "- 🧠 JetBrains (PyCharm)"
rm -rf "$HOME/Library/Application Support/JetBrains"
ln -nfs "$HOME/Dropbox/Settings/JetBrains" "$HOME/Library/Application Support/JetBrains"

echo "\n🎉 Completed Third-Party Software Setup\n"


echo "- 👼 Killall..."
killall Dock
killall Finder
killall SystemUIServer
sudo killall cfprefsd
sudo killall corebrightnessd

