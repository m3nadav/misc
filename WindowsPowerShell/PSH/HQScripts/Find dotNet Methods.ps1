$key = 'process'
[System.Diagnostics.Process].Assembly.GetExportedTypes() | Where-Object { $_.isPublic} | Where-Object { $_.isClass } | Where-Object { @($_.GetMethods() | Where-Object { $_.Name -like "*$key*" }).Count -gt 0 } | Select-Object -expandProperty FullName