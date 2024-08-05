$Form1 = New-Object -TypeName System.Windows.Forms.Form
[System.Windows.Forms.OpenFileDialog]$OpenFileDialog1 = $null
[System.Windows.Forms.Label]$ObsExeLabel = $null
[System.Windows.Forms.Panel]$ContainerPanel = $null
[System.Windows.Forms.TableLayoutPanel]$TableLayoutPanel1 = $null
[System.Windows.Forms.TextBox]$TextBox2 = $null
[System.Windows.Forms.Button]$Button1 = $null
function InitializeComponent
{
$OpenFileDialog1 = (New-Object -TypeName System.Windows.Forms.OpenFileDialog)
$ObsExeLabel = (New-Object -TypeName System.Windows.Forms.Label)
$ContainerPanel = (New-Object -TypeName System.Windows.Forms.Panel)
$TableLayoutPanel1 = (New-Object -TypeName System.Windows.Forms.TableLayoutPanel)
$TextBox2 = (New-Object -TypeName System.Windows.Forms.TextBox)
$Button1 = (New-Object -TypeName System.Windows.Forms.Button)
$ContainerPanel.SuspendLayout()
$TableLayoutPanel1.SuspendLayout()
$Form1.SuspendLayout()
#
#OpenFileDialog1
#
$OpenFileDialog1.FileName = [System.String]'OpenFileDialog1'
$OpenFileDialog1.add_FileOk($OpenFileDialog1_FileOk)
#
#ObsExeLabel
#
$ObsExeLabel.AutoSize = $true
$ObsExeLabel.Dock = [System.Windows.Forms.DockStyle]::Top
$ObsExeLabel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]15,[System.Int32]15))
$ObsExeLabel.Name = [System.String]'ObsExeLabel'
$ObsExeLabel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]116,[System.Int32]13))
$ObsExeLabel.TabIndex = [System.Int32]3
$ObsExeLabel.Text = [System.String]'OBS Studio Executable'
$ObsExeLabel.add_Click($ObsExeLabel_Click)
#
#ContainerPanel
#
$ContainerPanel.Controls.Add($TableLayoutPanel1)
$ContainerPanel.Controls.Add($ObsExeLabel)
$ContainerPanel.Dock = [System.Windows.Forms.DockStyle]::Fill
$ContainerPanel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]0,[System.Int32]0))
$ContainerPanel.Margin = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]0))
$ContainerPanel.Name = [System.String]'ContainerPanel'
$ContainerPanel.Padding = (New-Object -TypeName System.Windows.Forms.Padding -ArgumentList @([System.Int32]15))
$ContainerPanel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]519,[System.Int32]291))
$ContainerPanel.TabIndex = [System.Int32]5
$ContainerPanel.add_Paint($ContainerPanel_Paint)
#
#TableLayoutPanel1
#
$TableLayoutPanel1.AllowDrop = $true
$TableLayoutPanel1.AutoSize = $true
$TableLayoutPanel1.ColumnCount = [System.Int32]2
$TableLayoutPanel1.ColumnStyles.Add((New-Object -TypeName System.Windows.Forms.ColumnStyle -ArgumentList @([System.Windows.Forms.SizeType]::Percent,[System.Single]50)))
$TableLayoutPanel1.ColumnStyles.Add((New-Object -TypeName System.Windows.Forms.ColumnStyle))
$TableLayoutPanel1.Controls.Add($TextBox2,[System.Int32]0,[System.Int32]0)
$TableLayoutPanel1.Controls.Add($Button1,[System.Int32]1,[System.Int32]0)
$TableLayoutPanel1.Dock = [System.Windows.Forms.DockStyle]::Top
$TableLayoutPanel1.GrowStyle = [System.Windows.Forms.TableLayoutPanelGrowStyle]::FixedSize
$TableLayoutPanel1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]15,[System.Int32]28))
$TableLayoutPanel1.Name = [System.String]'TableLayoutPanel1'
$TableLayoutPanel1.RowCount = [System.Int32]1
$TableLayoutPanel1.RowStyles.Add((New-Object -TypeName System.Windows.Forms.RowStyle -ArgumentList @([System.Windows.Forms.SizeType]::Percent,[System.Single]50)))
$TableLayoutPanel1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]489,[System.Int32]29))
$TableLayoutPanel1.TabIndex = [System.Int32]4
$TableLayoutPanel1.add_Paint($TableLayoutPanel1_Paint)
#
#TextBox2
#
$TextBox2.Anchor = ([System.Windows.Forms.AnchorStyles][System.Windows.Forms.AnchorStyles]::Left -bor [System.Windows.Forms.AnchorStyles]::Right)
$TextBox2.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]3,[System.Int32]4))
$TextBox2.Name = [System.String]'TextBox2'
$TextBox2.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]402,[System.Int32]21))
$TextBox2.TabIndex = [System.Int32]0
#
#Button1
#
$Button1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]411,[System.Int32]3))
$Button1.Name = [System.String]'Button1'
$Button1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]75,[System.Int32]23))
$Button1.TabIndex = [System.Int32]1
$Button1.Text = [System.String]'Button1'
$Button1.UseVisualStyleBackColor = $true
#
#Form1
#
$Form1.ClientSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]519,[System.Int32]291))
$Form1.Controls.Add($ContainerPanel)
$Form1.Text = [System.String]'Form1'
$Form1.add_Load($Form1_Load)
$ContainerPanel.ResumeLayout($false)
$ContainerPanel.PerformLayout()
$TableLayoutPanel1.ResumeLayout($false)
$TableLayoutPanel1.PerformLayout()
$Form1.ResumeLayout($false)
Add-Member -InputObject $Form1 -Name OpenFileDialog1 -Value $OpenFileDialog1 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name ObsExeLabel -Value $ObsExeLabel -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name ContainerPanel -Value $ContainerPanel -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name TableLayoutPanel1 -Value $TableLayoutPanel1 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name TextBox2 -Value $TextBox2 -MemberType NoteProperty
Add-Member -InputObject $Form1 -Name Button1 -Value $Button1 -MemberType NoteProperty
}
. InitializeComponent
