$job = Start-Job { Dir $env:windir *.log -recurse  -ErrorAction SilentlyContinue}

# To check the status of your job, you can check the $job variable:
$job

# To retrieve the collected results from your background job, you can use Receive-Job:
Receive-Job $job

# you can also stop the job..
Stop-Job $job