# [![Manhattan](media/header.png)](https://github.com/manhattanhq/manhattan)

> 🗽Materialy designed stellar🚀 database app

[![Trello Board](https://img.shields.io/badge/trello-board-blue.svg)](https://trello.com/b/ut3VcEu2) [![Repo Size](https://reposs.herokuapp.com/?path=manhattanhq/manhattan&color=orange)](https://raw.githubusercontent.com/manhattanhq/manhattan) [![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/klauscfhq/os-x-ntua/master/license) [![Open Source Love](https://badges.frapsoft.com/os/v2/open-source.svg?v=102)](https://github.com/ellerbrock/open-source-badge/)

## Contents

- [Project Description](#projec-description)
- [Designing](#designing)
  - [ER Model](#er-model)
  - [R Model](#r-model)
- [API](#api)
  - [SQL Structure](#sql-structure)
- [Download](#download)
- [Credits](#credits)
- [Links](#links)
- [Team](#team)
- [License](#license)

## Project Description

## Designing

## ER Model

### Entities

For our Entities-Relations Model, we consider all the below described entities as **strong**.

#### PATIENT

> Patients receive drug prescriptions by doctors.

Each patient is uniquely identified by a **PatientID** -- **PRIMARY KEY**:key:, and is characterized by the following **simple**, as well as **composite**, **attributes**:

- **Age**
- **FullName**
  - FirstName
  - LastName
- **Address**
  - Town
  - StreetName
  - Number
  - PostalCode

#### DOCTOR

> Doctors prescribe drugs and monitor patients.

Each doctor is uniquely identified by a **DoctorID** -- **PRIMARY KEY**:key:, and is characterized by the following **simple**, as well as **composite**, **attributes**:

- **Specialty**
- **ExperienceYears**
- **FullName**
  - FirstName
  - LastName

#### PHARMACEUTICAL COMPANY

> Pharmaceutical companies provide pharmacies with drugs.

Each pharmaceutical company is uniquely identified by a **PharmaceuticalCompanyId** -- **PRIMARY KEY**:key:, and is characterized by the following **simple** **attributes**:

- **Name**
- **PhoneNumber**

In addition, we consider that each pharmaceutical company has a unique name and a unique phone number, thus making the **Name** attribute a **Candidate Key** and the **PhoneNumber** a **Single-valued** (not **Multivalued**) attribute.

#### DRUG

> Drugs are produced by pharmaceutical companies.

Each drug is uniquely identified by a **DrugId** -- **PRIMARY KEY**:key:, and is characterized by the following **simple** **attributes**:

- **Name**
- **Formula**

Additionally, we consider as unique the commercial name of each drug, thus making the **Name** attribute a **Candidate Key**.

#### PHARMACY

> Prescriptions-R-X pharmacies.

Each pharmacy is uniquely identified by a **PharmacyID** -- **PRIMARY KEY**:key:, and is characterized by the following **simple**, as well as **composite**, **attributes**:

- **Name**
- **Address**
  - Town
  - StreetName
  - Number
  - PostalCode

Again, we considering as unique the name of each pharmacy, making the **Name** attribute a **Candidate Key**.

### Relations

#### SEEN BY

> Connects a patient with a corresponding doctor.

Each patient can be seen by **at most one** doctor, while each doctor can see **any number** patients.

Also, each patient has a doctor monitoring him, while a each doctor has **at least one** patient to monitor.

- Mapping Cardinality
  - **1:N**
- Total Participation
  - **DOCTOR**
  - **PATIENT**

#### SELL

> Connects a pharmacy with its selling drugs.

Each pharmacy can have for sale **any number** of drugs, while a drug can be
available at **any number** of pharmacies. Also, the relation holds a **Price**
attribute, representing the selling price of a drug.

Additionally, we consider that each pharmacy can have drugs for sale, while a drug can be **unavailable** at all pharmacies.

- Mapping Cardinality
  - **N:M**
- Total Participation
  - **Pharmacy**
- Partial Participation
  - **Drug**
- Relation Attributes
  - **Price**

#### MAKE

> Connects a drug with the pharmaceutical company producing it.

Each drug can be produced by **at most one** pharmaceutical company, while a
pharmaceutical company can be producing **any number** of drugs.

Additionally, each drug can be produced by a pharmaceutical company, while a pharmaceutical company might **not be producing** some drugs out of the totally registered ones.

- Mapping Cardinality
  - **1:N**
- Total Participation
  - **Drugs**
- Partial Participation
  - **Pharmaceutical Company**

#### PRESCRIPTION

> Connects a patient with a doctor and a prescribed drug.

This is a **ternary relationship**, where a patient can receive a prescription for
**any number** of drugs by **any number** of doctors, a doctor can prescribe
**any number** of drugs to **any number** of patients, and a drug can be
prescribed to **any number** of patients by **any number** of doctors. Also,
the relation holds a **Date** attribute, representing the prescription date,
and a **Quantity** attribute, representing the quantity of the prescribed
drug.

Additionally, for a patient might not exist a corresponding prescription, and a doctor might not have prescribed a prescription for a corresponding patient, while a drug might not have been prescribed by a doctor for a patient.

- Mapping Cardinality
  - **N:M:K**
- Partial Participation
  - **PATIENT**
  - **DRUG**
  - **DOCTOR**
- Relation Attributes
  - **Date**
  - **Quality**

Finally, if a doctor prescribes the same drug to the same patient, more than one time, then the **last** prescription is the one registered in our database.

#### CONTRACT

> Connects a pharmaceutical company with a pharmacy.

A pharmacy can be in contract with **any number** of pharmaceutical companies,
while a pharmaceutical company can be in contract with **any number** of
pharmacies. Also, the relations holds a **StartDate** and an **EndDate** attribute, representing the contract initialization and termination dates accordingly, a **Text** attribute, representing the text upon which the contract was agreed and signed by both counterparts, and a **Supervisor** attribute, representing the contract supervisor.

We consider that each pharmacy is in contract with a pharmaceutical company, to supply itself with drugs, while each registered pharmaceutical company is in contract with one of the pharmacies.

- Mapping Cardinality
  - **N:M**
- Total Participation
  - **PHARMACEUTICAL COMPANY**
  - **PHARMACY**
- Relation Attributes
  - **StartDate**
  - **EndDate**
  - **Text**
  - **Supervisor**

Finally, if a pharmacy signs a contract with the same company, more than one time, then the last contract is the one registered in our database.

[:arrow_up:Back to top!](#contents)

### ER Diagram

<div align="center">
    <a href="#">
  <img src="https://cdn.rawgit.com/manhattanhq/manhattan/5359efed/src/diagrams/ER.png" alt="ER Diagram" width="75%">
</a>
</div>

## R Model

Each strong entity is immediately converted to a relation.

Keys are noted in a **bold** & _tilted_ fashion.

Also, we replaced the composite attribute **Address** with the simple attributes composing it.

### Strong Entities to Relations

- **Patient** (**_PatientId_**, FirstName, LastName, Town, StreetName, Number, PostalCode, Age)
- **Doctor** (**_DoctorId_**, FirstName, LastName, Specialty, ExperienceYears)
- **PharmaceuticalCompany** (**_PharmaceuticalCompanyId_**, Name, PhoneNumber)
- **Drug** (**_Drug_**, Name, Formula)
- **Pharmacy** (**_PharmacyId_**, Name, Town, StreetName, Number, PostalCode, PhoneNumber)

### Relation Sets

- **SeenBy** (**_PatientId_**, DoctorId)
- **Sell** (**_PharmacyId_**, **_DrugId_**, Price)
- **Make** (**_DrugId_**, PharmaceuticalCompanyId)
- **Prescription** (**_PatientId_**, **_DoctorId_**, **_DrugId_**, Date, Quantity)
- **Contract** (**_PharmacyId_**, **_PharmaceuticalCompanyId_**, StartDate, EndDate, Text,
Supervisor)

[:arrow_up:Back to top!](#contents)

### R Diagram

<div align="center">
    <a href="#">
  <img src="https://cdn.rawgit.com/manhattanhq/manhattan/5359efed/src/diagrams/R.png" alt="R Diagram" width="75%">
</a>
</div>

## API

### SQL Structure

Some sample structure designs pulled from the latest main Manhattan SQL source.

### Patient Table Design

#### Table structure for `patient`

```SQL
CREATE TABLE `patient` (
  `patient_id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `surname` varchar(20) NOT NULL,
  `town` varchar(20) NOT NULL,
  `street_name` varchar(20) NOT NULL,
  `number` int(11) NOT NULL,
  `postalcode` int(11) NOT NULL,
  `age` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
```

#### Indexes for table `patient`

```SQL
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patient_id`);
```

### Prescription Table Design


#### Table structure for `prescription`

```SQL
CREATE TABLE `prescription` (
  `patient_id` int(11) NOT NULL,
  `doctor_id` int(11) NOT NULL,
  `drug_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `quantity` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
```

#### Indexes for table `prescription`

```SQL
ALTER TABLE `prescription`
  ADD PRIMARY KEY (`patient_id`,`doctor_id`,`drug_id`);
```

[:arrow_up:Back to top!](#contents)

## Download

### Fork project

```bash
# clone the repository
git clone https://github.com/manhattanhq/manhattan.git
# navigate to the project directory
cd manhattan
```

## Links

## Credits

## Team

:sparkles: **<>** with :heart: by George, Konstantinos & Klaus :sparkles:

[![George Baxopoulos](https://avatars.githubusercontent.com/u/)](https://github.com/georgebax) | [![Konstantinos Mitropoulos](https://avatars.githubusercontent.com/u/)](https://github.com/tsikos7) | [![Klaus Sinani](https://avatars.githubusercontent.com/u/)](https://github.com/klauscfhq)
--- | --- | ---
[George Baxopoulos](http://github.com/georgebax) | [Konstantinos Mitropoulos](https://github.com/tsikos7) | [Klaus Sinani](https://github.com/klauscfhq)
## License

MIT © [George Baxopoulos](https://github.com/georgebax), [Konstantinos Mitropoulos](https://github.com/tsikos7) & [Klaus Sinani](https://github.com/klauscfhq)

<div align="center"><br>
  <br>
    <a href="https://github.com/manhattanhq/manhattan">
  <img src="https://cdn.rawgit.com/manhattanhq/manhattan/16b69460/media/logo.png" alt="Manhattan" width="40%">
</a>
  <br>
  <br></div>
