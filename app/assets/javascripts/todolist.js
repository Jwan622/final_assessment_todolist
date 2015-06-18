(function() {
  var app = angular.module("todolist", [

  ])
  app.config([
  function() {
    console.log("we ran the config function first?")
  }
  ])
  app.run([
    function(){
      console.log("app.run function works after config?")
    }
  ])
})()
