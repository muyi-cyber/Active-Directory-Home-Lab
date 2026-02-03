#Load activedirectory module/commands
Import-Module ActiveDirectory

#Read csv file from location on your desktop and store it in variable $OUAD
$OUAD=Import-csv -path C:\Users\Administrator\Documents\ou_data.csv

#Loops through each row in the csv file
foreach($OU in $OUAD) {
    $name=$OU.Name
    $path=$OU.Path

#Create OU
    New-ADOrganizationalUnit -name $name -path $path
    Write-Host "Success: Created OU $name" -ForegroundColor Green
}