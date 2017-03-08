app.controller('productsCtrl', function($scope, $http) {

    // delete pharmaceutical_company
    $scope.deleteProduct = function(pharmaceutical_company_id){

        // ask the user if he is sure to delete the record
        if(confirm("Are you sure?")){

            $http({
                method: 'POST',
                data: { 'pharmaceutical_company_id' : pharmaceutical_company_id },
                url: 'api/pharmaceutical_company/delete.php'
            }).then(function successCallback(response) {

                // tell the user pharmaceutical_company was deleted
                Materialize.toast(response.data, 4000);

                // refresh the list
                $scope.getAll();
            });
        }
    }

    // update pharmaceutical_company record / save changes
    $scope.updateProduct = function(){
        $http({
            method: 'POST',
            data: {
                'pharmaceutical_company_id' : $scope.pharmaceutical_company_id,
                'name' : $scope.name,
                'phone_number' : $scope.phone_number
            },
            url: 'api/pharmaceutical_company/update.php'
        }).then(function successCallback(response) {

            // tell the user pharmaceutical_company record was updated
            Materialize.toast(response.data, 4000);

            // close modal
            $('#modal-pharmaceutical_company-form').modal('close');

            // clear modal content
            $scope.clearForm();

            // refresh the pharmaceutical_company list
            $scope.getAll();
        });
    }

    // retrieve record to fill out the form
    $scope.readOne = function(pharmaceutical_company_id){

        // change modal title
        $('#modal-pharmaceutical_company-title').text("Edit pharmaceutical_company");

        // show udpate pharmaceutical_company button
        $('#btn-update-pharmaceutical_company').show();

        // show create pharmaceutical_company button
        $('#btn-create-pharmaceutical_company').hide();

        // post pharmaceutical_company_id of pharmaceutical_company to be edited
        $http({
            method: 'POST',
            data: { 'pharmaceutical_company_id' : pharmaceutical_company_id },
            url: 'api/pharmaceutical_company/read_one.php'
        }).then(function successCallback(response) {

            // put the values in form
            $scope.pharmaceutical_company_id = response.data[0]["pharmaceutical_company_id"];
            $scope.name = response.data[0]["name"];
            $scope.phone_number = response.data[0]["phone_number"];

            // show modal
            $('#modal-pharmaceutical_company-form').modal('open');
        })
        .error(function(data, status, headers, config){
            Materialize.toast('Unable to retrieve record.', 4000);
        });
    }

    // read pharmaceutical_companyS
    $scope.getAll = function(){
        $http({
            method: 'GET',
            url: 'api/pharmaceutical_company/read.php'
        }).then(function successCallback(response) {
            $scope.names = response.data.records;
        });
    }

    $scope.showCreateForm = function(){

        // clear form
        $scope.clearForm();

        // change modal title
        $('#modal-pharmaceutical_company-title').text("Create New pharmaceutical_company");

        // hide update pharmaceutical_company button
        $('#btn-update-pharmaceutical_company').hide();

        // show create pharmaceutical_company button
        $('#btn-create-pharmaceutical_company').show();

    }

    // clear variable / form values
    $scope.clearForm = function(){
        $scope.pharmaceutical_company_id = "";
        $scope.name = "";
        $scope.phone_number = "";
    }

    // create new pharmaceutical_company
    $scope.createProduct = function(){

        $http({
            method: 'POST',
            data: {
                'name' : $scope.name,
                'phone_number' : $scope.phone_number
            },
            url: 'api/pharmaceutical_company/create.php'
        }).then(function successCallback(response) {

            // tell the user new pharmaceutical_company was created
            Materialize.toast(response.data, 4000);

            // close modal
            $('#modal-pharmaceutical_company-form').modal('close');

            // clear modal content
            $scope.clearForm();

            // refresh the list
            $scope.getAll();
        });
    }

});
