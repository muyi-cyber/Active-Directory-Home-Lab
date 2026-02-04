#Load activedirectory module/commands
Import-Module ActiveDirectory

#Import csv file and pass the values to variable $ADUsers
$ADUsers = Import-csv -path C:\Users\Administrator\Documents\bulk_users_data.csv

#read each row of input data and assign each user details to variables 
foreach($User in $ADUsers){
    $Username=$User.Name
    $Password=$User.password
    $Firstname=$User.Firstname
    $Lastname=$User.LastName
    $email=$User.email
    $OU=$User.OU
    $company=$User.Company
    $department=$User.Department
    $telephone=$User.Telephone
    $address=$User.Address
    $city=$User.City
    $state=$User.State
    $zipCode=$User.ZipCode
    $country=$User.Country

#Check that user does not exist in AD 
if (Get-ADUser -F {SamAccountName -eq $username}){

#If user exists display warning
Write-Host "A user account with username $username already exists in active directory" -ForegroundColor Red
}
else{
#Create each user in the csv file
New-ADUser -Name "$Firstname $Lastname" `
-SamAccountName $Username `
-Givenname $Firstname `
-Surname $LastName `
-Displayname "$LastName,$Firstname" `
-AccountPassword (ConvertTo-SecureString $password -AsPlainText -Force) `
-Enabled $true `
-Path $OU
Write-Host "The user $firstname $lastname as successfully been created" -ForegroundColor Green
}

}
