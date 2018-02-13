#!/bin/bash

while read p; do
  # Download file
  wget https://aact.ctti-clinicaltrials.org/static/exported_files/"$p".zip

  # Unzip required files
  unzip -p "$p".zip facilities.txt > facilities.txt
  unzip -p "$p".zip facility_contacts.txt > facility_contacts.txt
  unzip -p "$p".zip facility_investigators.txt > facility_investigators.txt

  # Transfer to GCS
  gsutil cp ./facility_investigators.txt gs://daasnerds-cracircle/aact/raw/"$p"/facility_investigators.txt
  gsutil cp ./facility_contacts.txt gs://daasnerds-cracircle/aact/raw/"$p"/facility_contacts.txt
  gsutil cp ./facilities.txt gs://daasnerds-cracircle/aact/raw/"$p"/facilities.txt

  # Cleanup
  rm "$p".zip
  rm facil*.txt
done <aact_snapshots.txt

