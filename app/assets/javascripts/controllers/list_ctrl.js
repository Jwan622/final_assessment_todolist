(function() {
  function ListCtrl($scope){
    // $scope.tasks = $scope.preloadResource;
    /* in this previous code, the idea here is that we take the data that of preloadResources that we defined on the scope,
    and assign it on $scope.tasks The problem is that the ng controller gets loaded before the preloadResources directive, and so
    the right side of the assignment woudl be nothing because preloadResources hasn't been assigned yet which takes places in the directive.
    So you have to wait until the $scope.preloadResource is assigned, and the way you do that is with a watch.*/

    $scope.$watch("preloadResource", function (tasks) {
      $scope.tasks = tasks;
    })

    // $scope.sortTasks = function(sortOptions) {
    //   if (sortOptions.by === 'title') {
    //     $scope.tasks.sort(function(a,b){
    //       if (a.title > b.title) {
    //         return 1;
    //       } else if (a.title < b.title) {
    //         return -1;
    //       } else {
    //         return 0;
    //       }
    //     })
    //   }
    // }

    // in the above $scope.tasks is an array of javascript objects


    //
    // $scope.removeAllTasks = function ($event) {
    //   $event.preventDefault();
    //   $scope.tasks = [];
    // }
    //
    // $scope.addNewTask = function ($event) {
    //   $event.preventDefault();
    //   $scope.tasks.push({
    //     title: "Some new task",
    //     description: "Some description"
    //   })
    // }
  }
  angular.module("todolist").controller("ListCtrl", ["$scope", ListCtrl])
})()
