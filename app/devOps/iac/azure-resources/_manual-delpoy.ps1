az login --tenant <azure denant(directory) id>

az deployment sub create  --template-file main.bicep --subscription <azure-subscription-id> --location westeurope --parameters EMAILPASSWORD=<secret> EMAILSENDER=<secret> SMTPSERVER=<secret> API_KEY=<secret>
