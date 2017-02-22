app.controller('SquadreController', [ '$routeParams', '$location', '$scope', 'SquadreService',
    function($routeParams, $location, $scope, SquadreService) {
    var vm = $scope;
    
    vm.id = null;
    vm.item = {};
    vm.items = [];
    
    vm.loadItem = function(response){
        vm.item = response.data && response.data.item;
        vm.message = response.data && response.data.message || "";
    };
    
    vm.resetItem = function(){
        return {
            id:0,
            allenatore:'',
            denominazione:'',
            datafondazione:null
        };
    };
    
    vm.loadItems = function(response){
        var list = response.data && response.data.items || [];
        vm.items.length = 0;
        angular.forEach(list, function(v,k){
            vm.items.push(v);
        });
        vm.message = response.data && response.data.message || "";
    };

    vm.save = function(item){
        SquadreService.saveItem(item,vm.loadItems);
    };
    
    vm.view = function(id){
        $location.path( '/squadre/'+id );
    };
    
    vm.back = function(){
        $location.path( '/squadre' );
    };
    
    vm.del = function(id){
        SquadreService.delItem(id,vm.loadItems);
    };
    
    vm.init = function(){
        vm.id = $routeParams && $routeParams['id'] || false;
        if(vm.id){
            SquadreService.getItem(vm.id,vm.loadItem);
        }else{
            SquadreService.getList(vm.loadItems);
        }
    };
    
    vm.init();
}]);