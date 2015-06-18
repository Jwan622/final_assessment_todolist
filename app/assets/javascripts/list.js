/*
$(document).ready(function() {

  function searchByStatus(self, searchVal) {
    var searchVal = searchVal.toLowerCase();
    var list = self.closest(".list")
    list.find("div[class*='task']").each(function(index, task){
      // so go through the incomplete tasks of the closest current list
      var status = $(task).find("span[class='task-info-status']").text().trim()
      // so I confirmed we are iterating through incomplete and complete tasks in this closest list
      var found = false
      if (searchVal === status) {
        found = true;
      };
      if(found === true) {
        //for some reason, hide(), show() wasn't working and also the bug was the == instead of the ===.
        // There are 6 incomplete adn 2 complete tasks but we were only iterating like 6 times with the debugger below the
        // if (searchVal === status) line.
        $(task).removeClass("hide")
      }
      else {
        $(task).addClass("hide")
      }
    })
  };

  function searchByColumns(self, searchVal) {
    var searchVal = searchVal.toLowerCase()
    var list = self.closest(".list")

    list.find("div[class='task task-incomplete']").each(function(index, task){
      // find all of the tasks in the list and iterate
      // a task represents a div with a task which I'll be hiding or showing later.

      var allTextPerList = $(task).text()
      // this is some sloppy grab to see if the tasks have text

      if (allTextPerList.length > 0) {
        var found = false;
        var searchWords = []
        // searchWords will eventually have title and description of the task.
        $(task).find(".task-info").each(function(index, element) {
          searchWords.push(element.textContent.trim())
        })

        var regExp = new RegExp(searchVal, "i");
        // good old regex match, FML Steve

        var searchRegMatch = searchWords.join()
        if(regExp.test(searchRegMatch.toLowerCase())) {
          found = true;
        }

        if(found === true) {
          $(task).show();
        }
        else {
          $(task).hide();
        }
      }
    });
  };

  // function redrawListsAndTasks(response) {
  //   // clearCurrentLists()
  //   $(".lists").append(response)
  // }
  //
  // function getRevisedListsandTasks() {
  //   $.getJSON("/", function(response) {
  //     redrawListsAndTasks(response)
  //   });
  // }
  // YO eff repainting the dom with a getJSON. NO way. That seems terrible.

  function reviseTask(taskRow) {
    var taskRow1 = $(taskRow)
    // .find("div[class*='task-incomplete']"))
    var completeSection = $(taskRow.parent().parent().find(".complete-section"))
    var incompleteSection = $(taskRow.parent().parent().find(".incomplete-section"))

    if (taskRow1.find("span[class='task-info-status']").text().trim() === "incomplete") {
      taskRow1.find("span[class='task-info-status']").text("complete")
      taskRow1.prepend("<p class='lead'> This task is complete</p>")
      if (completeSection.children().attr("class") === "task hide tasks-hidden") {
        // depending on whether the complete tasks are shown, either hide or show the new task.
        taskRow1.attr("class", "task hide tasks-hidden")
      } else {
        taskRow1.attr("class", "task tasks-hidden")
      }
      completeSection.append(taskRow1);
    } else {
      taskRow1.find("span[class='task-info-status']").text("incomplete")
      taskRow1.attr("class", "task task-incomplete")
      taskRow1.find("p").remove()
      incompleteSection.append(taskRow1);
    }
    // not making a JSON call. I update the thing in the database whne I click a button and I simply move the task to the
    // completed section
  }

  function rearrangeBySort(allTasksPerSection) {
    // each list has two sections to sort. the incomplete and the completed tasks
    var individualList = $(this)

    if (allTasksPerSection.attr("class").match("task-incomplete")) {
      // be wary that match is going to be called on nil if the list is empty.
      individualList.find(".incomplete-section.sortable").empty()
      allTasksPerSection.each(function() {
        individualList.find(".incomplete-section.sortable").append(this);
      })
    }
    else {

    }
  }

  function changeSortButtonNames(sortButton) {
    if (sortButton.text() === "Sort By Title (Descending)") {
      sortButton.text("Sort By Title (Ascending)")
      sortButton.data().dir = "ascending"
    } else if (sortButton.text() === "Sort By Title (Ascending)") {
      sortButton.text("Sort By Title (Descending)")
      sortButton.data().dir = "descending"
    } else if (sortButton.text() === "Sort By Due Date (Earliest)") {
      sortButton.text("Sort By Due Date (Latest)")
      sortButton.data().dir = "descending"
    } else if (sortButton.text() === "Sort By Due Date (Latest)") {
      sortButton.text("Sort By Due Date (Earliest)")
      sortButton.data().dir = "ascending"
    } else if (sortButton.text() === "Sort By Status (Complete)") {
      sortButton.text("Sort By Status (Incomplete)")
      sortButton.data().dir = "ascending"
    } else if (sortButton.text() === "Sort By Status (Incomplete)") {
      sortButton.text("Sort By Status (Complete)")
      sortButton.data().dir = "descending"
    };
  };

  $(".change-views").on("click", ":button", function(btn){
    $(".tasks-hidden").toggleClass("hide")
    if ($("button.btn-completed").text() == "See Completed Tasks") {
      $("button.btn-completed").html("Hide Completed Tasks")
    }
    else {
      $("button.btn-completed").html("See Completed Tasks")
    }
  });

  $('.search_table_by_date_keyword_desc_date').keyup(function() {
    var searchLetter = ($(this).val().toLowerCase())
    var self = $(this)
    searchByColumns(self, searchLetter);
  });

  $('.status-dropdown').change(function() {
    var searchStatus = this.value;
    var self = $(this)
    searchByStatus(self, searchStatus)
  })

  $(".lists").on("change", ":checkbox", function(box){
    var checkBox = $(this);
    var checkedTask = checkBox.closest("div")
    var item_number = parseInt(checkBox[0].name.match(/[^[\]]+(?=])/g)[0]);

    $.ajax( { type: "PUT",
      url: "tasks/" + item_number,
      data: { id: item_number, type: "status-checkbox" },
      success: function(text) {
        reviseTask(checkedTask)
      }
    });
  })

  $(".sorting-section").on("click", ":button", function() {
    var sortButton = $(this)
    var sortMethod = $(this).data().type
    var sortingSections = sortButton.closest(".list").find(".sortable")
    var individualList = $(this).closest(".list")
    // sortingSections is both sections here for incomplete and complete sections
    var sortDirection = $(this).data().dir

    changeSortButtonNames(sortButton)
    if (sortDirection === "ascending") {
      sortingSections.each(function(index, section) {
        var allTasksPerSection = $(section).find(".task")
        allTasksPerSection.sort(function(a,b) {
          if (sortMethod === "date") {
            return Date.parse($($(a).find("span")[2]).text().trim()) - Date.parse($($(b).find("span")[2]).text().trim())
          } else if (sortMethod === "title") {
            return $($(a).find("span")[0]).text().trim().localeCompare($($(b).find("span")[0]).text().trim());
          } else {

            return $($(a).find("span")[3]).text().trim().localeCompare($($(b).find("span")[3]).text().trim());
          }
        })
      rearrangeBySort.call(individualList, allTasksPerSection);
      // if I did rearrangeBySort.bind(individualList, allTasksPerSection), what would this be?
      });
    } else if (sortDirection === "descending") {
      sortingSections.each(function(index, section) {
        var allTasksPerSection = $(section).find(".task")
        allTasksPerSection.sort(function(a,b) {
          if (sortMethod === "date") {
            return Date.parse($($(b).find("span")[2]).text().trim()) - Date.parse($($(a).find("span")[2]).text().trim())
          } else if (sortMethod === "title") {
            return $($(b).find("span")[0]).text().trim().localeCompare($($(a).find("span")[0]).text().trim());
          } else {
            return $($(b).find("span")[3]).text().trim().localeCompare($($(a).find("span")[3]).text().trim());
          }
        })
      rearrangeBySort.call(individualList, allTasksPerSection);
      // if I did rearrangeBySort.bind(individualList, allTasksPerSection), what would this be?
      });
    }
  })
});
*/
