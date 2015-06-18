angular.module("todolist").
  directive("sortButton", function() {
    return {
      restrict: "E",
      // isolated scope in directive... read up on this later.
      scope: {
        collection: "="
      },
      link: function(scope, element, attrs) {
        element.on("click", function(){
          scope.collection = scope.collection.sort(function (a, b) {
            if (a.title > b.title) {
              return 1;
            } else if (a.title < b.title) {
              return -1;
            } else {
              return 0;
            }
          })
          scope.$digest();
        })
      }
    }
  })
