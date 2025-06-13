# BoxStarterScripts WinServer2022
Set of Boxstarter scripts leveraging on Chocolatey to setup my PCs/VMs for different applications.  This is a conversion of the Chocolatey based repo https://github.com/microsoft/windows-dev-box-setup-scripts.  The goal of this project is to install the majority of my needed software and tools for new machines (virtual or physical)  CAN'T USE WINGET EASILY ON WINDOWS SERVER! 

These scripts leverage these popular open source projects.
- Boxstarter [boxstarter.org](http://boxstarter.org)
- Chocolatey [chocolatey.org](http://chocolatey.org)  (This is only used if Winget doesn't have a package and Chocolatey does)

## Project structure
The script code is organized in a hierarchy

**Recipes**
A recipe is the script you run.  It calls multiple helper scripts.  These currently live in the root of the project (HomePC.ps1, etc.) 

**Helper Scripts**: A helper script performs setup routines that may be useful by many recipes. Recipes call helper scripts (you don't run helper scripts directly).  The helper scripts live in the **scripts** folder


## Custom Recipies
*Note: The one-click links use the following format.  When working out of a different Fork or Branch you'll want to update the links as follows:*

`http://boxstarter.org/package/url?https://raw.githubusercontent.com/GITHUB_DOMAIN/windows-dev-box-setup-scripts/YOUR_BRANCH/RECIPE_NAME.ps1

## How to run the scripts
To run a recipe script, click a link in the table below from your target machine. This will download the Boxstarter one-click application, and prompt you for Boxstarter to run with Administrator privileges (which it needs to do its job). Clicking yes in this dialog will cause the recipe to begin. You can then leave the job unattended and come back when it's finished.

|Click link to run  |Description  |
|-------------------|-------------|
|<a href='http://boxstarter.org/package/url?https://raw.githubusercontent.com/GeekDougle/BoxStarterScripts/WinServer2022/CloudEngDevPC.ps1'>CloudEngDevPC</a> | Sets up a cloud hosted PC to be a development environment for engineering, including essential tools and configurations. |

**Notes:**  
1. If you are using WSL there's a followup step we recommend after running the setup script.  When the script finishes you will only have a root user with a blank password. You should  manually create a non-root user via `$ sudo adduser [USERNAME] sudo` 
with a non-blank password. Use this user going forward. For more info on WSL please refer to the [documentation](https://docs.microsoft.com/en-us/windows/wsl/about).
2. If you're a Node.js contributor working on Node.js core, please see the [Node.js Bootstrapping Guide](https://github.com/nodejs/node/tree/master/tools/bootstrap) or [click here to run](http://boxstarter.org/package/nr/url?https://raw.githubusercontent.com/nodejs/node/master/tools/bootstrap/windows_boxstarter).

## Known issues
- The Boxstarter ClickOnce installer does not work when using Chrome.  This issue is being tracked [here](https://github.com/chocolatey/boxstarter/issues/345). Please use Edge to run the ClickOnce installer.
- Reboot is not always logging you back in to resume the script.  This is being tracked [here](https://github.com/chocolatey/boxstarter/issues/318).  The workaround is to login manually and the script will continue running. 
- There have been reports of Windows 1803 not successfully launching Boxstarter via the web launcher. See this issue for details: https://github.com/chocolatey/boxstarter/issues/301
