app.controller('productsCtrl', function($scope, $http) {

    // delete average
    $scope.deleteProduct = function(average_id){

        // ask the user if he is sure to delete the record
        if(confirm("Are you sure?")){

            $http({
                method: 'POST',
                data: { 'average_id' : average_id },
                url: 'api/average/delete.php'
            }).then(function successCallback(response) {

                // tell the user average was deleted
                Materialize.toast(response.data, 4000);

                // refresh the list
                $scope.getAll();
            });
        }
    }

    // update average record / save changes
    $scope.updateProduct = function(){
        $http({
            method: 'POST',
            data: {
                'average_id' : $scope.average_id,
                'name' : $scope.name,
                'formula' : $scope.formula,
                'pharmaceutical_company_id' : $scope.pharmaceutical_company_id,
                'avg' : $avg
            },
            url: 'api/average/update.php'
        }).then(function successCallback(response) {

            // tell the user average record was updated
            Materialize.toast(response.data, 4000);

            // close modal
            $('#modal-average-form').modal('close');

            // clear modal content
            $scope.clearForm();

            // refresh the average list
            $scope.getAll();
        });
    }

    // retrieve record to fill out the form
    $scope.readOne = function(average_id){

        // change modal title
        $('#modal-average-title').text("Edit average");

        // show udpate average button
        $('#btn-update-average').show();

        // show create average button
        $('#btn-create-average').hide();

        // post average_id of average to be edited
        $http({
            method: 'POST',
            data: { 'average_id' : average_id },
            url: 'api/average/read_one.php'
        }).then(function successCallback(response) {

            // put the values in form
            $scope.average_id = response.data[0]["average_id"];
            $scope.name = response.data[0]["name"];
            $scope.formula = response.data[0]["formula"];
            $scope.pharmaceutical_company_id = response.data[0]["pharmaceutical_company_id"];
            $scope.avg = response.data[0]["avg"];

            // show modal
            $('#modal-average-form').modal('open');
        })
        .error(function(data, status, headers, config){
            Materialize.toast('Unable to retrieve record.', 4000);
        });
    }

    // read averageS
    $scope.getAll = function(){
        $http({
            method: 'GET',
            url: 'api/average/read.php'
        }).then(function successCallback(response) {
            $scope.names = response.data.records;
        });
    }

    $scope.showCreateForm = function(){

        // clear form
        $scope.clearForm();

        // change modal title
        $('#modal-average-title').text("Create New average");

        // hide update average button
        $('#btn-update-average').hide();

        // show create average button
        $('#btn-create-average').show();

    }

    // clear variable / form values
    $scope.clearForm = function(){
        $scope.average_id = "";
        $scope.name = "";
        $scope.formula = "";
        $scope.pharmaceutical_company_id = "";
        $scope.avg = "";
    }

    // create new average
    $scope.createProduct = function(){

        $http({
            method: 'POST',
            data: {
                'name' : $scope.name,
                'formula' : $scope.formula,
                'pharmaceutical_company_id' : $scope.pharmaceutical_company_id,
                'avg' : $scope.avg
            },
            url: 'api/average/create.php'
        }).then(function successCallback(response) {

            // tell the user new average was created
            Materialize.toast(response.data, 4000);

            // close modal
            $('#modal-average-form').modal('close');

            // clear modal content
            $scope.clearForm();

            // refresh the list
            $scope.getAll();
        });
    }

});
