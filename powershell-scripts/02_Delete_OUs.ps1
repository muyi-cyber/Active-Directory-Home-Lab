#Load activedirectory module/commands
Import-Module ActiveDirectory

#Read csv file from location on your desktop and store it in variable $OUAD
$OUAD=Import-csv -path C:\Users\Administrator\Documents\ou_delete_data.csv

#Loops through each row in the csv file
foreach ($OU in $OUAD){
    $name=$OU.Name
    $path=$OU.Path

#This below deletes the OU
try{
    get-ADOrganizationalUnit -Identity $path | Set-ADObject -ProtectedFromAccidentalDeletion:$false 
    Remove-ADOrganizationalUnit -Identity $path -Confirm:$false

#To check if it was done
Write-Host "$name has been deleted successfully" -ForegroundColor Green
}
catch{
    Write-Host "Failed to delete $name because '$($_.Exception.Message)'" -ForegroundColor Red
}
} 

