app.controller('productsCtrl', function($scope, $http) {

    // delete doctor
    $scope.deleteProduct = function(doctor_id){

        // ask the user if he is sure to delete the record
        if(confirm("Are you sure?")){

            $http({
                method: 'POST',
                data: { 'doctor_id' : doctor_id },
                url: 'api/doctor/delete.php'
            }).then(function successCallback(response) {

                // tell the user doctor was deleted
                Materialize.toast(response.data, 4000);

                // refresh the list
                $scope.getAll();
            });
        }
    }

    // update doctor record / save changes
    $scope.updateProduct = function(){
        $http({
            method: 'POST',
            data: {
                'doctor_id' : $scope.doctor_id,
                'name' : $scope.name,
                'surname' : $scope.surname,
                'specialty' : $scope.specialty,
                'experience_years' : $scope.experience_years
            },
            url: 'api/doctor/update.php'
        }).then(function successCallback(response) {

            // tell the user doctor record was updated
            Materialize.toast(response.data, 4000);

            // close modal
            $('#modal-doctor-form').modal('close');

            // clear modal content
            $scope.clearForm();

            // refresh the doctor list
            $scope.getAll();
        });
    }

    // retrieve record to fill out the form
    $scope.readOne = function(doctor_id){

        // change modal title
        $('#modal-doctor-title').text("Edit doctor");

        // show udpate doctor button
        $('#btn-update-doctor').show();

        // show create doctor button
        $('#btn-create-doctor').hide();

        // post doctor_id of doctor to be edited
        $http({
            method: 'POST',
            data: { 'doctor_id' : doctor_id },
            url: 'api/doctor/read_one.php'
        }).then(function successCallback(response) {

            // put the values in form
            $scope.doctor_id = response.data[0]["doctor_id"];
            $scope.name = response.data[0]["name"];
            $scope.surname = response.data[0]["surname"];
            $scope.specialty = response.data[0]["specialty"];
            $scope.experience_years = response.data[0]["experience_years"];

            // show modal
            $('#modal-doctor-form').modal('open');
        })
        .error(function(data, status, headers, config){
            Materialize.toast('Unable to retrieve record.', 4000);
        });
    }

    // read doctorS
    $scope.getAll = function(){
        $http({
            method: 'GET',
            url: 'api/doctor/read.php'
        }).then(function successCallback(response) {
            $scope.names = response.data.records;
        });
    }

    $scope.showCreateForm = function(){

        // clear form
        $scope.clearForm();

        // change modal title
        $('#modal-doctor-title').text("Create New doctor");

        // hide update doctor button
        $('#btn-update-doctor').hide();

        // show create doctor button
        $('#btn-create-doctor').show();

    }

    // clear variable / form values
    $scope.clearForm = function(){
        $scope.doctor_id = "";
        $scope.name = "";
        $scope.surname = "";
        $scope.specialty = "";
        $scope.experience_years = "";
    }

    // create new doctor
    $scope.createProduct = function(){

        $http({
            method: 'POST',
            data: {
                'name' : $scope.name,
                'surname' : $scope.surname,
                'specialty' : $scope.specialty,
                'experience_years' : $scope.experience_years
            },
            url: 'api/doctor/create.php'
        }).then(function successCallback(response) {

            // tell the user new doctor was created
            Materialize.toast(response.data, 4000);

            // close modal
            $('#modal-doctor-form').modal('close');

            // clear modal content
            $scope.clearForm();

            // refresh the list
            $scope.getAll();
        });
    }

});
