app.controller('productsCtrl', function($scope, $http) {

    // delete drug
    $scope.deleteProduct = function(drug_id){

        // ask the user if he is sure to delete the record
        if(confirm("Are you sure?")){

            $http({
                method: 'POST',
                data: { 'drug_id' : drug_id },
                url: 'api/drug/delete.php'
            }).then(function successCallback(response) {

                // tell the user drug was deleted
                Materialize.toast(response.data, 4000);

                // refresh the list
                $scope.getAll();
            });
        }
    }

    // update drug record / save changes
    $scope.updateProduct = function(){
        $http({
            method: 'POST',
            data: {
                'drug_id' : $scope.drug_id,
                'name' : $scope.name,
                'formula' : $scope.formula,
                'pharmaceutical_company_id' : $scope.pharmaceutical_company_id
            },
            url: 'api/drug/update.php'
        }).then(function successCallback(response) {

            // tell the user drug record was updated
            Materialize.toast(response.data, 4000);

            // close modal
            $('#modal-drug-form').modal('close');

            // clear modal content
            $scope.clearForm();

            // refresh the drug list
            $scope.getAll();
        });
    }

    // retrieve record to fill out the form
    $scope.readOne = function(drug_id){

        // change modal title
        $('#modal-drug-title').text("Edit drug");

        // show udpate drug button
        $('#btn-update-drug').show();

        // show create drug button
        $('#btn-create-drug').hide();

        // post drug_id of drug to be edited
        $http({
            method: 'POST',
            data: { 'drug_id' : drug_id },
            url: 'api/drug/read_one.php'
        }).then(function successCallback(response) {

            // put the values in form
            $scope.drug_id = response.data[0]["drug_id"];
            $scope.name = response.data[0]["name"];
            $scope.formula = response.data[0]["formula"];
            $scope.pharmaceutical_company_id = response.data[0]["pharmaceutical_company_id"];

            // show modal
            $('#modal-drug-form').modal('open');
        })
        .error(function(data, status, headers, config){
            Materialize.toast('Unable to retrieve record.', 4000);
        });
    }

    // read drugS
    $scope.getAll = function(){
        $http({
            method: 'GET',
            url: 'api/drug/read.php'
        }).then(function successCallback(response) {
            $scope.names = response.data.records;
        });
    }

    $scope.showCreateForm = function(){

        // clear form
        $scope.clearForm();

        // change modal title
        $('#modal-drug-title').text("Create New drug");

        // hide update drug button
        $('#btn-update-drug').hide();

        // show create drug button
        $('#btn-create-drug').show();

    }

    // clear variable / form values
    $scope.clearForm = function(){
        $scope.drug_id = "";
        $scope.name = "";
        $scope.formula = "";
        $scope.pharmaceutical_company_id = "";
    }

    // create new drug
    $scope.createProduct = function(){

        $http({
            method: 'POST',
            data: {
                'name' : $scope.name,
                'formula' : $scope.formula,
                'pharmaceutical_company_id' : $scope.pharmaceutical_company_id
            },
            url: 'api/drug/create.php'
        }).then(function successCallback(response) {

            // tell the user new drug was created
            Materialize.toast(response.data, 4000);

            // close modal
            $('#modal-drug-form').modal('close');

            // clear modal content
            $scope.clearForm();

            // refresh the list
            $scope.getAll();
        });
    }

});
