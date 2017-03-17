app.controller('productsCtrl', function ($scope, $http) {
	// delete experienced
  $scope.deleteProduct = function (experienced_id) {
		// ask the user if he is sure to delete the record
    if (confirm('Are you sure?')) {
      $http({
        method: 'POST',
        data: {
          experienced_id: experienced_id
        },
        url: 'api/experienced/delete.php'
      }).then(function successCallback(response) {
				// tell the user experienced was deleted
        Materialize.toast(response.data, 4000);

				// refresh the list
        $scope.getAll();
      });
    }
  };

	// update experienced record / save changes
  $scope.updateProduct = function () {
    $http({
      method: 'POST',
      data: {
        experienced_id: $scope.experienced_id,
        name: $scope.name,
        surname: $scope.surname,
        specialty: $scope.specialty,
        experience_years: $scope.experience_years
      },
      url: 'api/experienced/update.php'
    }).then(function successCallback(response) {
			// tell the user experienced record was updated
      Materialize.toast(response.data, 4000);

			// close modal
      $('#modal-experienced-form').modal('close');

			// clear modal content
      $scope.clearForm();

			// refresh the experienced list
      $scope.getAll();
    });
  };

	// retrieve record to fill out the form
  $scope.readOne = function (experienced_id) {
		// change modal title
    $('#modal-experienced-title').text('Edit experienced');

		// show udpate experienced button
    $('#btn-update-experienced').show();

		// show create experienced button
    $('#btn-create-experienced').hide();

		// post experienced_id of experienced to be edited
    $http({
      method: 'POST',
      data: {
        experienced_id: experienced_id
      },
      url: 'api/experienced/read_one.php'
    }).then(function successCallback(response) {
				// put the values in form
      $scope.experienced_id = response.data[0].experienced_id;
      $scope.name = response.data[0].name;
      $scope.surname = response.data[0].surname;
      $scope.specialty = response.data[0].specialty;
      $scope.experience_years = response.data[0].experience_years;

				// show modal
      $('#modal-experienced-form').modal('open');
    })
			.error(function (data, status, headers, config) {
  Materialize.toast('Unable to retrieve record.', 4000);
});
  };

	// read experiencedS
  $scope.getAll = function () {
    $http({
      method: 'GET',
      url: 'api/experienced/read.php'
    }).then(function successCallback(response) {
      $scope.names = response.data.records;
    });
  };

  $scope.showCreateForm = function () {
		// clear form
    $scope.clearForm();

		// change modal title
    $('#modal-experienced-title').text('Create New experienced');

		// hide update experienced button
    $('#btn-update-experienced').hide();

		// show create experienced button
    $('#btn-create-experienced').show();
  };

	// clear variable / form values
  $scope.clearForm = function () {
    $scope.experienced_id = '';
    $scope.name = '';
    $scope.surname = '';
    $scope.specialty = '';
    $scope.experience_years = '';
  };

	// create new experienced
  $scope.createProduct = function () {
    $http({
      method: 'POST',
      data: {
        name: $scope.name,
        surname: $scope.surname,
        specialty: $scope.specialty,
        experience_years: $scope.experience_years
      },
      url: 'api/experienced/create.php'
    }).then(function successCallback(response) {
			// tell the user new experienced was created
      Materialize.toast(response.data, 4000);

			// close modal
      $('#modal-experienced-form').modal('close');

			// clear modal content
      $scope.clearForm();

			// refresh the list
      $scope.getAll();
    });
  };
});
