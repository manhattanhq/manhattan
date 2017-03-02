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

Each patient is uniquely identified by a **PatientID** -- **PRIMARY KEY**, and is characterized by the following **simple**, as well as **composite**, **attributes**:

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

Each doctor is uniquely identified by a **DoctorID** -- **PRIMARY KEY**, and is characterized by the following **simple**, as well as **composite**, **attributes**:

- **Specialty**
- **ExperienceYears**
- **FullName**
  - FirstName
  - LastName

### PHARMACEUTICAL COMPANY

> Pharmaceutical companies provide pharmacies with drugs.

Each pharmaceutical company is uniquely identified by a **PharmaceuticalCompanyId** -- **Primary Key**, and is characterized by the following **simple** **attributes**:

- **Name**
- **PhoneNumber**

### Drug

> Drugs are being produced by pharcuetical companies.

Each drug is uniquely identified by a **DrugId** -- **Primary Key**, and is characterized by the following **simple** **attributes**:

- **Name**
- **Formula**

### Pharmacy

> Prescriptions-R-X pharmacies.

Each pharmacy is uniquely identified by a **PharmacyID** -- **PRIMARY KEY**, and is characterized by the following **simple**, as well as **composite**, **attributes**:

- **Name**
- **Address**
  - Town
  - StreetName
  - Number
  - PostalCode

### Relations

### ER Diagram

![ER](src/diagrams/ER.png)

## R Model

### R Diagram

![R](src/diagrams/R.png)

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
---------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- | -----------------------------------------------------------------------------------------
[George Baxopoulos](http://github.com/georgebax)                                               | [Konstantinos Mitropoulos](https://github.com/tsikos7)                                              | [Klaus Sinani](https://github.com/klauscfhq)

## License

MIT © [George Baxopoulos](https://github.com/georgebax), [Konstantinos Mitropoulos](https://github.com/tsikos7) & [Klaus Sinani](https://github.com/klauscfhq)

<div align="center"><br>
  <br>
    <a href="https://github.com/manhattanhq/manhattan">
  <img src="https://cdn.rawgit.com/manhattanhq/manhattan/16b69460/media/logo.png" alt="Manhattan" width="40%">
</a>
  <br>
  <br></div>
