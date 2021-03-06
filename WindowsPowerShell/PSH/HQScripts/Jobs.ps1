$job = start-job -scriptblock {gci -path HKLM:\Software\}
# get job status
Get-Job
$job1 = get-job -id 1
# get the Results of the job
receive-job -job $job1
receive-job -job $job1 > c:\results.txt
# To prevent Receive-Job from deleting the job results that is returned, use the Keep parameter.
# with -KEEP, Receive-Job returns all results that have been generated until that time.
receive-job -job $job1 -keep
# you can wait for a particular job, for all jobs, or for any of the jobs to be completed.
wait-job -ID 10 -timeout 120 # Timeout in Seconds
# stop job
$job | stop-job
# see why job failed
$job.ChildJobs[0].JobStateInfo.Reason
# for remoting, use Invoke-Command with -AsJob parameter, or {start-job} in the scriptblock.
