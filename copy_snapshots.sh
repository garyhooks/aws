#!/usr/bin/env bash
# Copy snapshots from one region to another by using a list of snapshot IDs 
# Use the following to get the script ids into a file:
# aws ec2 describe-snapshots --region ap-northeast-1 --filters Name=tag:Name,Values=*Forensics* --query "Snapshots[*].[SnapshotId,Tags[0].Value]" --output text

while read -r line; do
  
  # Use awk to populate variables
  # $line in this context will contain the snapshot id and the name (taken from another script 
  snapshot_id=$(echo $line | awk '{print $1}')
  name=$(echo $line | awk '{print $2}')
  echo $snapshot_id
  echo $name

  aws ec2 copy-snapshot --region ap-southeast-1 --source-region ap-northeast-1 --source-snapshot-id $snapshot_id --description="$name" --tag-specifications "ResourceType=snapshot,Tags=[{Key=Name,Value=CLIENT--$name}]"

done < snapshots.txt
