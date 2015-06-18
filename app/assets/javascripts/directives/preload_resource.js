angular.module("todolist").
  directive("preloadResource", function() {
    return {
      restrict: "A",
      link: function(scope, element, attrs) {
        scope.preloadResource = JSON.parse(attrs.preloadResource);
        element.remove();
        //we remove the div after we read the data off of the div.
      }
    };
  });
