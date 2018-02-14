!#/bin/bash

# Download file 
# https://www.fda.gov/Drugs/InformationOnDrugs/ucm135162.htm
wget https://www.fda.gov/downloads/Drugs/InformationOnDrugs/UCM135169.zip

unzip UCM135169.zip

rm UCM135169.zip

# Copy to GCS
gsutil cp ./Bmis.txt gs://daasnerds-cracircle/bmis.txt

rm Bmis.txt

