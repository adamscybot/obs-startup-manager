$Form1_Load = {
}
$ContainerPanel_Paint = {
}
$OpenFileDialog1_FileOk = {
}
$TableLayoutPanel1_Paint = {
}
$ObsExeLabel_Click = {
}
$TextBox1_TextChanged = {
}
. 'c:\Users\adam\Documents\Code\obs-startup-manager\obs-startup-manager.ps1'
Add-Type -AssemblyName System.Windows.Forms
$btn_Click = {
	Get-OBSPathFromRegistry 
}
. 'c:\Users\adam\Documents\Code\obs-startup-manager\obs-startup-manager.form.designer.ps1'
$Form1.ShowDialog()
