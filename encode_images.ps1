$files = Get-ChildItem "d:\pen data\trials\pyqapp\whatsapp_images_temp" -Filter *.jpeg | Sort-Object Name
$gallery = ""
foreach ($file in $files) {
    $base64 = [convert]::ToBase64String((Get-Content $file.FullName -Encoding Byte))
    $gallery += "<div class='gallery-item'><img src='data:image/jpeg;base64,$base64' alt='$($file.Name)'></div>`n"
}
$gallery | Out-File "d:\pen data\trials\pyqapp\gallery.html"