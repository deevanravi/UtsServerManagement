<!DOCTYPE html>
<html>
    <head>
        <title> Redlock-Web-2.0 </title>
    </head>
<body>
    <?php
        // hubungkan menggunakan PDO ke database
        $db = new PDO('sqlite:./Redlock.sqlite');
        $results = $db->query('SELECT * From users')->fetchAll(PDO::FETCH_ASSOC);

        // Menampilkan Table 
        echo "<table>";
        echo "<tr><th>ID</th><th>Nama</th><th>Alamat</th><th>Jabatan</th></tr>";

        $totalUsers = 0;

        foreach ($results as $row) {
            $totalUsers = $totalUsers + 1;
            echo "<tr><td>".$row["ID"]."</td><td>".$row["Nama"]."</td><td>".$row["Alamat"]."</td><td>".$row["Jabatan"]."</td></tr>";
        }

        echo "</table>";
        echo "Jumlah User : $totalUsers";
        
    ?>
</body>
</html>
