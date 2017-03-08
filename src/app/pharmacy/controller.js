app.controller('productsCtrl', function($scope, $http) {

    // delete pharmacy
    $scope.deleteProduct = function(pharmacy_id){

        // ask the user if he is sure to delete the record
        if(confirm("Are you sure?")){

            $http({
                method: 'POST',
                data: { 'pharmacy_id' : pharmacy_id },
                url: 'api/pharmacy/delete.php'
            }).then(function successCallback(response) {

                // tell the user pharmacy was deleted
                Materialize.toast(response.data, 4000);

                // refresh the list
                $scope.getAll();
            });
        }
    }

    // update pharmacy record / save changes
    $scope.updateProduct = function(){
        $http({
            method: 'POST',
            data: {
                'pharmacy_id' : $scope.pharmacy_id,
                'name' : $scope.name,
                'town' : $scope.town,
                'street_name' : $scope.street_name,
                'number' : $scope.number,
                'postalcode' : $scope.postalcode,
                'phone_number' : $scope.phone_number
            },
            url: 'api/pharmacy/update.php'
        }).then(function successCallback(response) {

            // tell the user pharmacy record was updated
            Materialize.toast(response.data, 4000);

            // close modal
            $('#modal-pharmacy-form').modal('close');

            // clear modal content
            $scope.clearForm();

            // refresh the pharmacy list
            $scope.getAll();
        });
    }

    // retrieve record to fill out the form
    $scope.readOne = function(pharmacy_id){

        // change modal title
        $('#modal-pharmacy-title').text("Edit pharmacy");

        // show udpate pharmacy button
        $('#btn-update-pharmacy').show();

        // show create pharmacy button
        $('#btn-create-pharmacy').hide();

        // post pharmacy_id of pharmacy to be edited
        $http({
            method: 'POST',
            data: { 'pharmacy_id' : pharmacy_id },
            url: 'api/pharmacy/read_one.php'
        }).then(function successCallback(response) {

            // put the values in form
            $scope.pharmacy_id = response.data[0]["pharmacy_id"];
            $scope.name = response.data[0]["name"];
            $scope.town = response.data[0]["town"];
            $scope.street_name = response.data[0]["street_name"];
            $scope.number = response.data[0]["number"];
            $scope.postalcode = response.data[0]["postalcode"];
            $scope.phone_number = response.data[0]["phone_number"];

            // show modal
            $('#modal-pharmacy-form').modal('open');
        })
        .error(function(data, status, headers, config){
            Materialize.toast('Unable to retrieve record.', 4000);
        });
    }

    // read pharmacyS
    $scope.getAll = function(){
        $http({
            method: 'GET',
            url: 'api/pharmacy/read.php'
        }).then(function successCallback(response) {
            $scope.names = response.data.records;
        });
    }

    $scope.showCreateForm = function(){

        // clear form
        $scope.clearForm();

        // change modal title
        $('#modal-pharmacy-title').text("Create New pharmacy");

        // hide update pharmacy button
        $('#btn-update-pharmacy').hide();

        // show create pharmacy button
        $('#btn-create-pharmacy').show();

    }

    // clear variable / form values
    $scope.clearForm = function(){
        $scope.pharmacy_id = "";
        $scope.name = "";
        $scope.town = "";
        $scope.street_name = "";
        $scope.number = "";
        $scope.postalcode = "";
        $scope.phone_number = "";
    }

    // create new pharmacy
    $scope.createProduct = function(){

        $http({
            method: 'POST',
            data: {
                'name' : $scope.name,
                'town' : $scope.town,
                'street_name' : $scope.street_name,
                'number' : $scope.number,
                'postalcode' : $scope.postalcode,
                'phone_number' : $scope.phone_number
            },
            url: 'api/pharmacy/create.php'
        }).then(function successCallback(response) {

            // tell the user new pharmacy was created
            Materialize.toast(response.data, 4000);

            // close modal
            $('#modal-pharmacy-form').modal('close');

            // clear modal content
            $scope.clearForm();

            // refresh the list
            $scope.getAll();
        });
    }

});
