#!/usr/bin/env bash
# Create volumes from a list of snapshot Ids
# Use the following to get the script ids into a file:
# aws ec2 describe-snapshots --region ap-northeast-1 --filters Name=tag:Name,Values=*Forensics* --query "Snapshots[*].[SnapshotId,Tags[0].Value]" --output text > snapshots.txt

while read -r line; do

  # Use awk to populate variables
  # $line in this context will contain the snapshot id and the name (taken from another script 
  snapshot_id=$(echo $line | awk '{print $1}')
  name=$(echo $line | awk '{print $2}')
  
  aws ec2 create-volume --region ap-southeast-1 --availability-zone ap-southeast-1a --snapshot-id $snapshot_id --volume-type gp3 --encrypted --kms-key-id mrk-4fe13d11613a43878537234e3a211e79 --tag-specifications "ResourceType=volume,Tags=[{Key=Name,Value=$name}]"

done < snapshots.txt
