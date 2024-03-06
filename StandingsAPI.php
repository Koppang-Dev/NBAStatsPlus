<?php
// Setting up connection for MySQL database
// (hostname, MySQL name, password, database name)
$conn = mysqli_connect( "localhost","root","Ril-50702469","STANDINGS");

// Creating array to hold the response
$response = array();

// Checking to see if the database is connected sucessfully
if ($conn) {
 
    // Fetching information from the database
    $sql = "
        SELECT * FROM EASTERN
        UNION
        SELECT * FROM WESTERN
        ORDER BY conference, ranking";
        

    // Saving the result
    $result = mysqli_query($conn, $sql);

    // Check if there is information found
    if ($result) {
        // Adding a header to display it with the JSON Style
        header("Content-Type: JSON");

        // Initalizing Index
        $i = 0;

        // Iterates through each row of the result set
        while($row = mysqli_fetch_assoc($result)) {
            $response[$i]['NAME'] = $row['NAME'];
            $response[$i]['winpercent'] = $row['winpercent'];
            $response[$i]['ranking'] = $row['ranking'];
            $response[$i]['games_back'] = $row['games_back'];
            $response[$i]['wins'] = $row['wins'];
            $response[$i]['loses'] = $row['loses'];
            $response[$i]['conference'] = $row['conference'];
            $i++;
        }
        // Adding a title for the array
        $jsonResponse['TEAM_INFORMATION'] = $response;

        // Printing the response in JSON format
        echo json_encode($response, JSON_PRETTY_PRINT);
    } else {
        // No Result Was Found
        echo "No Result Found";
    }

} else {
    echo "DB Connection Unsuccessful";
}



?>
