# [![Manhattan](media/header.png)](https://github.com/manhattanhq/manhattan)

> 🗽Materialy designed stellar🚀 database app

[![Trello Board](https://img.shields.io/badge/trello-board-blue.svg)](https://trello.com/b/ut3VcEu2) [![Repo Size](https://reposs.herokuapp.com/?path=manhattanhq/manhattan&color=orange)](https://raw.githubusercontent.com/manhattanhq/manhattan) [![GitHub license](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/klauscfhq/os-x-ntua/master/license) [![Open Source Love](https://badges.frapsoft.com/os/v2/open-source.svg?v=102)](https://github.com/ellerbrock/open-source-badge/)

## Contents

- [Project Description](#projec-description)
- [Designing](#designing)
  - [ER Model](#er-model)
  - [R Model](#r-model)
- [API](#api)
- [Download](#download)
- [Team](#team)
- [License](#license)

## Project Description

## Designing

## ER Model

### Entities

#### PATIENT

> Patients receive drugs prescriptions by doctors.

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

### DOCTOR

> Doctors prescribe drugs to patient they monitor.

Each doctor is uniquely identified by a **DoctorID** -- **PRIMARY KEY**:key:, and is characterized by the following **simple**, as well as **composite**, **attributes**:

- **Specialty**
- **ExperienceYears**
- **FullName**
  - FirstName
  - LastName

### PHARMACEUTICAL COMPANY

> Pharmaceutical companies provide pharmacies with drugs.

Each pharmaceutical company is uniquely identified by a **PharmaceuticalCompanyId** -- **PRIMARY KEY**:key:, and is characterized by the following **simple** **attributes**:

- **Name**
- **PhoneNumber**

### DRUG

> Drugs are being produced by pharmaceutical companies.

Each drug is uniquely identified by a **DrugId** -- **PRIMARY KEY**:key:, and is characterized by the following **simple** **attributes**:

- **Name**
- **Formula**

### PHARMACY

> Prescriptions-R-X pharmacies.

Each pharmacy is uniquely identified by a **PharmacyID** -- **PRIMARY KEY**:key:, and is characterized by the following **simple**, as well as **composite**, **attributes**:

- **Name**
- **Address**
  - Town
  - StreetName
  - Number
  - PostalCode

### Relations

#### SEE BY

> Connects a patient with a corresponding doctor.

Each patient can be seen by **at most one** doctor, while each doctor can see **any number** patients.

- Mapping Cardinality
  - **1:N**
- Total Participation
  - **DOCTOR**
  - **PATIENT**

#### SELL

> Connects a pharmacy with its for sale drugs.

Each pharmacy can have for sale **any number** of drugs, while a drug can be
available at **any number** of pharmacies. Also, the relation holds a **Price**
attribute, representing the selling price of a drug.

- Mapping Cardinality
  - **N:M**
- Total Participation
  - **Pharmacy**
- Partial Participation
  - **Drug**
- Relation Attributes
  - **Price**

#### MAKE

> Connects a pharmaceutical company its producing drugs.

Each drug can be produced  by **at most one** pharmaceutical company, while a
pharmaceutical company can be producing **any number** of drugs.

- Mapping Cardinality
  - **1:N**
- Total Participation
  - **Drugs**
- Partial Participation
  - **Pharmaceutical Company**

#### PRESCRIPTION

> Connects a patient with a doctor and a prescribed drug.

This is a **ternary relation**, where a patient can receive a prescription for
**any number** of drugs by **any number** of doctors, a doctor can prescribe
**any number** of drugs to **any number** of patients, and a drug can be
prescribed to **any number** of patients by **any number** of doctors. Also,
the relation holds a **Date** attribute, representing the prescription date,
and a **Quantity** attribute, representing the quantity of the prescribed
drug.

- Mapping Cardinality
  - **N:M:K**
- Partial Participation
  - **PATIENT**
  - **DRUG**
  - **DOCTOR**
- Relation Attributes
  - **Date**
  - **Quality**

#### CONTRACT

> Connects a Pharmaceutical company with a pharmacy.

A pharmacy can be contract with **any number** of pharmaceutical companies,
while a pharmaceutical company can be in contract with **any number** of
pharmacies. Also, the relations holds a **StartDate** attribute and a **EndDate** attribute,representing the contract initialization and termination date accordingly, a **Text** attribute, representing the text upon which the contract was agreed and signed by both counterparts, and a **Supervisor** attribute, representing the contract supervisor.

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

### ER Diagram

<div align="center">
    <a href="#">
  <img src="https://cdn.rawgit.com/manhattanhq/manhattan/5359efed/src/diagrams/ER.png" alt="ER Diagram" width="75%">
</a>
</div>

## R Model

### R Diagram

<div align="center">
    <a href="#">
  <img src="https://cdn.rawgit.com/manhattanhq/manhattan/5359efed/src/diagrams/R.png" alt="R Diagram" width="75%">
</a>
</div>

## API

## Download

### Fork project

```bash
# clone the repository
git clone https://github.com/manhattanhq/manhattan.git
# navigate to the project directory
cd manhattan
```

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
