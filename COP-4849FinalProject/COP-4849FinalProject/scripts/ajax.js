var toucan = "Ajax Time"; //Refer to project 3

    
    
var xmlhttp = new XMLHttpRequest();
var url = "meanscoredata.json";

xmlhttp.onreadystatechange = function() {
    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
        var json_array = JSON.parse(xmlhttp.responseText);                    
        parseJson(json_array);
    }
}
    
xmlhttp.open("GET", url, true);
xmlhttp.send();

function parseJson(json_array) {
    var json_data = "";
    //var i;
    //for(i=0;i<json_array.student.length; i++) for multiple students you can loop through the student array. create different collections of info, whatever.
    json_data += "<p>First Name: " + json_array.students[0].firstName + "</p>";
    json_data += "<p>Last Name: " + json_array.students[0].lastName + "</p>";
    json_data += "<p>Grades: " + json_array.students[0].grades.join(" -*- ") + "</p>"; //we can walk through each grade json_array.students[0].grades[0-7]
    for(var ii = 0; ii <json_array.students[0].grades.length; ii++){
        json_data += "<p>Grade " + (ii+1) + ": " + json_array.students[0].grades[ii] + "</p>";
    }
    json_data += "<p>Credits: " + json_array.students[0].credits + "</p>";
    //}   
    document.getElementById("display_json").innerHTML = json_data;
}