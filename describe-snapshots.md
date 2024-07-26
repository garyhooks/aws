
https://awscli.amazonaws.com/v2/documentation/api/latest/reference/ec2/describe-snapshots.html

# Describe Snapshots
--filters allows you to only return specific snapshots, matched on a value. 
--query allows you to specify what fields to return in the response

The following will search for workstations with a Tagged Name of *Forensics*
The response will include two values, SnapshotId and Tags (Value)
```
aws ec2 describe-snapshots --region ap-northeast-1 --filters Name=tag:Name,Values=*Forensics* --query "Snapshots[*].[SnapshotId,Tags[0].Value]" --output text
```

You can also output as --table for better presentation


aws ec2 describe-snapshots --region ap-northeast-1 --filters Name=tag:Name,Values=*Forensics* --query "Snapshots[*].[SnapshotId,Tags[0].Value]" --output text



