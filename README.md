# Medical-Record-Smart-Contract-Sample
A very basic smart contract I have built for the medical sector.

In this smart contract, patient's medical records can be updated and only doctors having permission can access these records to read or update them.
This smart contract was written in solidity and is built using the Remix-Ethereum IDE.

Each patient can update Patient `name`, `age`, `condition` as their medical record. There is also a boolean type field called `istreated` in their record which the doctor mapped to that patient can change.

The code displays *'Patient is treated!'* or *'Patient not treated!'* as the output message depending on the value of `istreated`

## Getting Started

You will need to use the http://remix.ethereum.org/ website to run this smart contract.

### Prerequisites

You will need to activate the 'Solidity Compiler' and 'Debug and Run Transactions' extensions from the Extensions side menu.

## Running the Contract

* Hit 'Compile' and then 'Deploy' in the Compiler and Debug and Run sections repectively to deploy the smart contract.

![Compiling the Code](/images/smind1.png)  ![Deploying the Contract](/images/smind2.png) 
* In the Run and Debug section, there is a subsection called `Accounts`. Each account basically represents a participant in our smart contract, which can either be a doctor or a patient.
* To create a new patient, enter the necessary information in the `setPatientData` field and then click on `setPatientData` to create a new patient data.

![Creating new patient](/images/smind4.png)
* In the terminal, a new transaction must be visible. Click on this and save the hash value in displayed in the `decoded output` section . This value is actually the `uniqueID` of our patient. We will be needing this value later.

* Switch to a different account in the 'Accounts' subsection and copy the hash value of this account, as this account will be used to represent a doctor.

![Switching the Account and creating our Doctor](/images/smind6.png)
* Now switch back to the account where we created our patient and paste this value in the `setDoctor` field and click on it to set that account as the doctor.

* Finally go back to the account we had selected for our doctor and finally input the `uniqueID` we had saved from the `decoded output` earlier to the `patientmapping` field. Clicking on this should display the medical records of the patient that was created. 
* Finally, if the doctor has succesfully treated the patient, he can enter `uniqueID`, `true` as inputs in the `updateRecord` field and click on it to view the changes in the terminal.

![Viewing and Updating Patient's medical records](/images/smind10.png)
* Different accounts can be used to create new patients and doctors by following the above steps. However only the doctors mapped to a patient can view and update his/her medical records. For instance, if enter the `uniqueID` of some other patient in the `patientmapping` section for the doctor we just created it shows null values as output.

![Entering the uniqueID of a different patient](/images/smind12.png) 
