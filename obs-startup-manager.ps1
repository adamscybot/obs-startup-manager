$Form1_Load = {
}
$OpenFileDialog1_FileOk = {
}

if (-Not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) {
    if ([int](Get-CimInstance -Class Win32_OperatingSystem | Select-Object -ExpandProperty BuildNumber) -ge 6000) {
        $CommandLine = "-File `"" + $MyInvocation.MyCommand.Path + "`" " + $MyInvocation.UnboundArguments
        Start-Process -FilePath PowerShell.exe -Verb Runas -ArgumentList $CommandLine
        Exit
    }
}

   
# Load required assembly for Windows Forms
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Function to get the installation path of OBS Studio from the registry
function Get-OBSPathFromRegistry {
    $obsRegKeyPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall"
    $obsRegKeyPathWow6432Node = "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall"
    $displayName = "OBS Studio"
   
    # Search the registry keys for OBS Studio installation path
    $regKeys = Get-ChildItem $obsRegKeyPath, $obsRegKeyPathWow6432Node -ErrorAction SilentlyContinue
    foreach ($key in $regKeys) {
        $displayNameValue = (Get-ItemProperty -Path $key.PSPath -Name "DisplayName" -ErrorAction SilentlyContinue).DisplayName
        if ($displayNameValue -eq $displayName) {
            $installLocation = (Get-ItemProperty -Path $key.PSPath -Name "DisplayIcon" -ErrorAction SilentlyContinue).DisplayIcon
            if ($installLocation) {
                return $installLocation
            }
        }
    }

    # Return null if not found
    return $null
}


# Get the installation path of OBS Studio
Write-Host "Finding OBS Studio installation..."
$obsExePath = Get-OBSPathFromRegistry
if (-not $obsExePath) {
    Write-Host "OBS Studio installation not found."
    exit
}
else {
    Write-Host "Found installation at $obsExePath"
}

# Create a Windows Form for user input
$form = New-Object System.Windows.Forms.Form
$form.Text = "OBS Startup Manager"
$form.Size = New-Object System.Drawing.Size(400, 150)
$form.StartPosition = "CenterScreen"
$icon = [System.Drawing.SystemIcons]::GetStockIcon(3)

# Create a label for installation path
$label = New-Object System.Windows.Forms.Label
$label.Text = "Select the OBS Studio executable:"
$label.AutoSize = $true
$label.Location = New-Object System.Drawing.Point(10, 20)
$form.Controls.Add($label)

# Create a textbox for displaying the selected file path
$textBox = New-Object System.Windows.Forms.TextBox
$textBox.Size = New-Object System.Drawing.Size(260, 20)
$textBox.Location = New-Object System.Drawing.Point(10, 50)
$form.Controls.Add($textBox)

# Create a button to open the file picker dialog
$browseButton = New-Object System.Windows.Forms.Button
$browseButton.Text = "Browse..."
$browseButton.Location = New-Object System.Drawing.Point(280, 47)
$browseButton.Add_Click({
        # Create an OpenFileDialog
        $fileDialog = New-Object System.Windows.Forms.OpenFileDialog
        $fileDialog.Filter = "Executable Files (*.exe)|*.exe"
        $fileDialog.Title = "Select OBS Studio executable"
    
        # Show the dialog and set the textbox text to the selected file path
        if ($fileDialog.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK) {
            $textBox.Text = $fileDialog.FileName
        }
    })
$form.Controls.Add($browseButton)

# Create an OK button
$okButton = New-Object System.Windows.Forms.Button
$okButton.Text = "OK"
$okButton.Location = New-Object System.Drawing.Point(300, 80)
$okButton.Add_Click({
        $form.DialogResult = [System.Windows.Forms.DialogResult]::OK
        $form.Close()
    })
$form.Controls.Add($okButton)

# Show the form and wait for user input
$form.ShowDialog()

Write-Host "Finding users startup folder..."
# Get the Startup folder path for the current user
$wshShell = New-Object -ComObject WScript.Shell
$startupFolder = $wshShell.SpecialFolders.Item("Startup")
Write-Host "Startup folder fond at $startupFolder"

$shortcutPath = "$startupFolder\Start OBS.lnk"
Write-Host "Creating shortcut at $shortcutPath"


# Define the target executable
$targetPath = $obsExePath
$startIn = Split-Path -Path $obsExePath -Parent
$arguments = ""

# Create a new shortcut
$shortcut = $wshShell.CreateShortcut($shortcutPath)

# Set the shortcut properties
$shortcut.TargetPath = $targetPath
$shortcut.WorkingDirectory = $startIn
$shortcut.Arguments = $arguments
$shortcut.Description = "Start OBS"
$shortcut.IconLocation = "$targetPath,0"
$shortcut.Hotkey = "Ctrl+Shift+O"  # Optional: Set a hotkey
$shortcut.Save()

# Set the shortcut to run as administrator
$bytes = [System.IO.File]::ReadAllBytes($shortcutPath)
$bytes[21] = $bytes[21] -bor 0x20
[System.IO.File]::WriteAllBytes($shortcutPath, $bytes)

Write-Host "OBS added to startup."