-- set targetDisplay to 2nd (Dell) monitor

tell application "System Events"
	set desktopList to a reference to every desktop
	try
		-- This might not exist
		set targetDisplay to display name of item 2 of desktopList
	on error
		beep 2
		return
	end try
end tell

set targetRot to "90°"

tell application "System Preferences"
	activate
	set current pane to pane "com.apple.preference.displays"
	tell application "System Events"
		tell process "System Preferences"
			tell window targetDisplay
				set oldval to value of pop up button "Rotation:" of tab group 1
				if oldval is not equal to targetRot then
					click pop up button "Rotation:" of tab group 1
					click menu item targetRot of menu of pop up button "Rotation:" of tab group 1
					delay 2
					click button "Confirm" of sheet 1
				end if
			end tell
		end tell
	end tell
end tell

tell application "System Preferences"
	quit -- that seems to be the safest starting point
end tell
