$BASEDIR="C:\Users"
$folders=Get-ChildItem -Directory $BASEDIR
$profilesToSkip=@("Public","Default","administrator","Guest")
$foldersToClean=@("Documents","Desktop","Downloads","Music","Videos","Pictures")

Write-Output "=== Start cleanup"
foreach ($item in $folders){
    if($profilesToSkip -contains $item){
        continue;
    }
    foreach($ftc in $foldersToClean){

        $ftcFull="$BASEDIR\$item\$ftc"
        
        if (Test-Path -Path $ftcFull) {
            Write-Output "Cleanup $ftcFull"
            Remove-item "$ftcFull\*" -Recurse -Force
        }else{
            Write-Output "No $ftcFull"
        }
    }
}