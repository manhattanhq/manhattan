app.controller('productsCtrl', function ($scope, $http) {
	// delete patient
  $scope.deleteProduct = function (patient_id) {
		// ask the user if he is sure to delete the record
    if (confirm('Are you sure?')) {
      $http({
        method: 'POST',
        data: {
          patient_id: patient_id
        },
        url: 'api/patient/delete.php'
      }).then(function successCallback(response) {
				// tell the user patient was deleted
        Materialize.toast(response.data, 4000);

				// refresh the list
        $scope.getAll();
      });
    }
  };

	// update patient record / save changes
  $scope.updateProduct = function () {
    $http({
      method: 'POST',
      data: {
        patient_id: $scope.patient_id,
        name: $scope.name,
        surname: $scope.surname,
        town: $scope.town,
        street_name: $scope.street_name,
        number: $scope.number,
        postalcode: $scope.postalcode,
        age: $scope.age,
        doctor_id: $scope.doctor_id
      },
      url: 'api/patient/update.php'
    }).then(function successCallback(response) {
			// tell the user patient record was updated
      Materialize.toast(response.data, 4000);

			// close modal
      $('#modal-patient-form').modal('close');

			// clear modal content
      $scope.clearForm();

			// refresh the patient list
      $scope.getAll();
    });
  };

	// retrieve record to fill out the form
  $scope.readOne = function (patient_id) {
		// change modal title
    $('#modal-patient-title').text('Edit patient');

		// show udpate patient button
    $('#btn-update-patient').show();

		// show create patient button
    $('#btn-create-patient').hide();

		// post patient_id of patient to be edited
    $http({
      method: 'POST',
      data: {
        patient_id: patient_id
      },
      url: 'api/patient/read_one.php'
    }).then(function successCallback(response) {
				// put the values in form
      $scope.patient_id = response.data[0].patient_id;
      $scope.name = response.data[0].name;
      $scope.surname = response.data[0].surname;
      $scope.town = response.data[0].town;
      $scope.street_name = response.data[0].street_name;
      $scope.number = response.data[0].number;
      $scope.postalcode = response.data[0].postalcode;
      $scope.age = response.data[0].age;
      $scope.doctor_id = response.data[0].doctor_id;

				// show modal
      $('#modal-patient-form').modal('open');
    })
			.error(function (data, status, headers, config) {
  Materialize.toast('Unable to retrieve record.', 4000);
});
  };

	// read patientS
  $scope.getAll = function () {
    $http({
      method: 'GET',
      url: 'api/patient/read.php'
    }).then(function successCallback(response) {
      $scope.names = response.data.records;
    });
  };

  $scope.showCreateForm = function () {
		// clear form
    $scope.clearForm();

		// change modal title
    $('#modal-patient-title').text('Create New patient');

		// hide update patient button
    $('#btn-update-patient').hide();

		// show create patient button
    $('#btn-create-patient').show();
  };

	// clear variable / form values
  $scope.clearForm = function () {
    $scope.patient_id = '';
    $scope.name = '';
    $scope.surname = '';
    $scope.town = '';
    $scope.street_name = '';
    $scope.number = '';
    $scope.postalcode = '';
    $scope.age = '';
    $scope.doctor_id = '';
  };

	// create new patient
  $scope.createProduct = function () {
    $http({
      method: 'POST',
      data: {
        name: $scope.name,
        surname: $scope.surname,
        town: $scope.town,
        street_name: $scope.street_name,
        number: $scope.number,
        postalcode: $scope.postalcode,
        age: $scope.age,
        doctor_id: $scope.doctor_id
      },
      url: 'api/patient/create.php'
    }).then(function successCallback(response) {
			// tell the user new patient was created
      Materialize.toast(response.data, 4000);

			// close modal
      $('#modal-patient-form').modal('close');

			// clear modal content
      $scope.clearForm();

			// refresh the list
      $scope.getAll();
    });
  };
});
