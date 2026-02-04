#Load activedirectory module/commands
Import-Module ActiveDirectory

#Import csv file and pass the values to variable $UsersToDelete
$UsersToDelete = Import-csv -Path C:\Users\Administrator\Documents\bulk_users_data.csv

#Loop through "Name" column in the csv file
foreach($User in $UsersToDelete){
    $TargetUser = $User.Name
try{
    #-Confirm:$false to prevent the script from asking "Are you sure" for every user
    Remove-ADUser -Identity $TargetUser -Confirm:$false
    Write-Host "Successfully deleted: $TargetUser" -ForegroundColor Green
}
catch{
    Write-Host "Failed to delete;$TargetUser.Error: $_" -ForegroundColor Red
}
}