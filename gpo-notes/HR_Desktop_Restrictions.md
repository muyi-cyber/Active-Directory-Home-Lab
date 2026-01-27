Project: 1 | HR Desktop Restriction GPO

1.Objective:
To enforce a secure desktop environment for the HR Organizational Unit (OU) within the muyigroups.org domain.

2.Configuration Details:
The following restrictions were configured under User Configuration > Policies > Administrative Templates:
• Disable Command Prompt: Prevents users from accessing cmd.exe.
• Hide Control Panel: Prohibits access to system settings.

3.Implementation & Scope:
• Target OU: Staff \ HR.
• Linked GPO: HR Desktop Restriction GPO.
• Security Filtering: Applied to Authenticated Users within the HR OU.

4.Verification:
The policy was successfully forced using the following command on the Client Machine:
gpupdate /force

5.Results:
• User Testing: Verified successful enforcement on the client machine for user John Doe.
• Confirmation: The command prompt now displays a message stating it has been disabled by an administrator.
