# Cấu hình đường link tải file .bat
$url = "https://raw.githubusercontent.com/StudyWithMe9x/openGGM/refs/heads/main/MO_LINK%20-%20Copy.bat"  # <--- THAY LINK CỦA BẠN VÀO ĐÂY

# Tên file .bat sẽ được lưu
$fileName = "auto_run.bat" # <--- THAY TÊN FILE BẠN MUỐN

# Đường dẫn thư mục Startup của người dùng hiện tại (Không cần quyền Admin)
$startupPath = "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup\$fileName"

try {
    Write-Host "Đang tải file từ: $url" -ForegroundColor Cyan
    
    # Tải file về
    Invoke-WebRequest -Uri $url -OutFile $startupPath -UseBasicParsing
    
    # Kiểm tra xem file có tồn tại không
    if (Test-Path $startupPath) {
        Write-Host "Thành công! File đã được lưu vào Startup." -ForegroundColor Green
        Write-Host "Vị trí: $startupPath" -ForegroundColor Gray
        Write-Host "File sẽ chạy mỗi khi bạn đăng nhập Windows." -ForegroundColor Yellow
    } else {
        Write-Host "Lỗi: File không được tạo sau khi tải." -ForegroundColor Red
    }
}
catch {
    Write-Host "Đã xảy ra lỗi: $_" -ForegroundColor Red
}

# Giữ cửa sổ mở để xem kết quả (nếu chạy bằng cách click đúp)

Read-Host -Prompt "Nhấn Enter để thoát..."
