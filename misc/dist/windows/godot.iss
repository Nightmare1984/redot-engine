#define MyAppName "Redot Engine"
#define MyAppVersion "4.5"
#define MyAppPublisher "Redot Engine contributors"
#define MyAppURL "https://redotengine.org/"
#define MyAppExeName "redot.exe"

[Setup]
AppId={{60D07AAA-400E-40F5-B073-A796C34D9D78}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
; Don't add "version {version}" to the installed app name in the Add/Remove Programs
; dialog as it's redundant with the Version field in that same dialog.
AppVerName={#MyAppName}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
AppComments=Redot Engine editor
ChangesEnvironment=yes
DefaultDirName={localappdata}\Redot
DefaultGroupName=Redot Engine
AllowNoIcons=yes
UninstallDisplayIcon={app}\{#MyAppExeName}
#ifdef App32Bit
  OutputBaseFilename=redot-setup-x86
#else
  OutputBaseFilename=redot-setup-x86_64
  ArchitecturesAllowed=x64
  ArchitecturesInstallIn64BitMode=x64
#endif
Compression=lzma
SolidCompression=yes
PrivilegesRequired=lowest

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
Name: "modifypath"; Description: "Add Redot to PATH environment variable"

[Files]
Source: "{#MyAppExeName}"; DestDir: "{app}"; Flags: ignoreversion

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

[Code]
const
    ModPathName = 'modifypath';
    ModPathType = 'user';

function ModPathDir(): TArrayOfString;
begin
    setArrayLength(Result, 1)
    Result[0] := ExpandConstant('{app}');
end;

#include "modpath.pas"
