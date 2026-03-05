# Cấu hình
$url = "https://raw.githubusercontent.com/StudyWithMe9x/openGGM/refs/heads/main/MO_LINK.bat"
$fileName = "MO_LINK.bat"

# Sử dụng Shell.Application để lấy đường dẫn Startup folder đúng
$shell = New-Object -ComObject Shell.Application
$startupFolder = $shell.Namespace(0x1b).Self.Path  # 0x1b là Startup folder
$startupPath = Join-Path $startupFolder $fileName

try {
    Write-Host "Đang tải file từ: $url" -ForegroundColor Cyan
    Write-Host "Lưu vào: $startupPath" -ForegroundColor Gray
    
    Invoke-WebRequest -Uri $url -OutFile $startupPath -UseBasicParsing
    
    if (Test-Path $startupPath) {
        Write-Host "Thành công! File đã được lưu vào Startup." -ForegroundColor Green
        Write-Host "Vị trí: $startupPath" -ForegroundColor Gray
    } else {
        Write-Host "Lỗi: File không được tạo." -ForegroundColor Red
    }
}
catch {
    Write-Host "Đã xảy ra lỗi: $_" -ForegroundColor Red
}

Read-Host -Prompt "Nhấn Enter để thoát..."

